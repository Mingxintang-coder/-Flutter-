from http.server import BaseHTTPRequestHandler, HTTPServer
import logging
import cv2
import pymysql

import sys
import io

import json
from requests_toolbelt.multipart import decoder

import base64
import numpy as np


import tensorflow as tf

import math
import os
import shutil

# new
def send_pic(self):
    i=0
    for filename in os.listdir('D:/results_vae/'): 
        if i>0:
            break  
        fb = open('D:/results_vae/'+filename,"rb")
        img = fb.read()
        self.wfile.write(img)
        fb.close()
        os.remove('D:/results_vae/'+filename)
        i+=1

# new
def send_pic_info(self):
    i=0
    for filename in os.listdir('D:/results_vae/'): 
        if i>0:
            break
        msg = filename
    self.wfile.write(msg.format(self.path).encode('utf-8'))


def match():
    model = tf.keras.models.load_model('D:/vs_code_bin/mnist_data/MNIST/raw/mine.model')

    raw='C:/Users/85773/Desktop/vs_code_bin/mnist_data/MNIST/raw/tar_pic/1011.jpg'

    img_array =cv2.imread(raw,cv2.IMREAD_GRAYSCALE)
    new_array =img_array
    new_array =new_array.reshape(1,784)
    prediction = model.predict(new_array)


    shutil.rmtree('D:/results_vae/')
    os.mkdir('D:/results_vae/')

    path='D:/results_vae/'

    i=0
    for filename in os.listdir('D:/mnist_data/'):
        img_array1 =cv2.imread('D:/mnist_data/'+'/'+filename,cv2.IMREAD_GRAYSCALE)
        new_array1 =img_array1
        new_array1 =new_array1.reshape(1,784)
        prediction1 = model.predict(new_array1)
        if np.sqrt(np.sum(np.square(prediction1-prediction)))<100:
            name=str(np.sqrt(np.sum(np.square(prediction1-prediction))))+".jpg" 
            cv2.imwrite(path+name,img_array1)
            i+=1
    return i

def pic_shap():
    crop_size = (28, 28)
    img = cv2.imread('D:/Master_S/2020A_Software_E/sever_sql/3.png',cv2.IMREAD_GRAYSCALE)
    img_new = cv2.resize(img, crop_size, interpolation = cv2.INTER_AREA)
    img_new = 255-img_new
    for i in range(28):
        for j in range(28):
            if img_new[i][j]<115:
                img_new[i][j]=0
            elif img_new[i][j]>125 :img_new[i][j]=255
    cv2.imwrite('C:/Users/85773/Desktop/vs_code_bin/mnist_data/MNIST/raw/tar_pic/1011.jpg', img_new)

def connectdb():
    print("连接到mysql...")
    db = pymysql.connect(
        host="localhost",
        user="root",
        password="12345",
        db="se_test"
        )
    print("连接成功！")
    return db

def sign_in(db,account,password):
    cursor = db.cursor()
    sql = "SELECT Password FROM User WHERE Account=%s" 
    try:
        cursor.execute(sql,account)
        pw = cursor.fetchone()[0]      
        print(pw)
        if(pw==password):             
            return True
        else:           
            return False
    except:
        return False

def get_UID(db,account):
    cursor = db.cursor()
    sql = "SELECT Id FROM User WHERE Account=%s" 
    try:
        cursor.execute(sql,account)
        uid = cursor.fetchone()[0]      
        print(uid)
        return uid
    except:
        return -1

def add_c(db,uid,nid):
    cursor = db.cursor()
    sql ="""INSERT INTO Collection  (Uid,Nid)
    VALUES(%s,%s)"""
    nid=str(nid)
    values =(uid,nid)
    try:
        cursor.execute(sql,values)
        db.commit()
        return True
    except:
        print("failed to insert")
        db.rollback()
        return False

def add_u(db,account,password):
    cursor = db.cursor()
    sql = 'SELECT MAX(Id) AS id FROM User'
    cursor.execute(sql)
    uid = cursor.fetchone()[0]+1
    sql ="""INSERT INTO User  (Id,Account,Password)
     VALUES(%s,%s,%s)"""
    values =(uid,account,password)
    try:
        cursor.execute(sql,values)
        db.commit()
        return uid
    except:
        print("failed to insert")
        db.rollback()
        return -1

def get_c(db,uid):
    cursor = db.cursor()
    sql="SELECT Nid FROM Collection WHERE Uid = %s"
    try:
        cursor.execute(sql,uid)
        collection = []
        c =cursor.fetchone()
        i=0
        while c!=None:
            c=str(c)
            collection.append (c[2])
            c =cursor.fetchone()
            i+=1     
        mesg = str(i)
        for d in collection:
            mesg = mesg+','+str(d)
        return mesg
    except:
        return -1

def del_c(db,uid,nid):
    cursor = db.cursor()
    sql="DELETE FROM Collection WHERE Uid=%s AND Nid=%s"
    try:
        values=(uid,nid)
        cursor.execute(sql,values)
        db.commit()
        return True
    except:
        db.rollback()
        return False


class S(BaseHTTPRequestHandler):
    def do_HEAD(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        paths = {
            '/foo': {'status': 200},
            '/bar': {'status': 302},
            '/baz': {'status': 404},
            '/qux': {'status': 500}
        }

        if self.path in paths:
            self.respond(paths[self.path])
        else:
            self.respond({'status': 500})
        logging.info("GET request,\nPath: %s\nHeaders:\n%s\n", str(self.path), str(self.headers))

        self.wfile.write("GET request for {}".format(self.path).encode('utf-8'))
        # try
        # if(path)

    def do_POST(self):
        content_length = int(self.headers['Content-Length']) # <--- Gets the size of data
        post_data = self.rfile.read(content_length) # <--- Gets the data itself
        logging.info("GET request,\nPath: %s\nHeaders:\n%s\n", str(self.path), str(self.headers))
       
           
        print(self.headers['Content-Type'][:9])
        if(self.headers['Content-Type'][:9]!='multipart'):
            data = post_data.decode('utf-8')
            data = eval(data)
            print(data)

            logging.info("POST request,\nPath: %s\nHeaders:\n%s\n\nBody:\n%s\n",
                str(self.path), str(self.headers), post_data.decode('utf-8'))
            self.do_HEAD()

            if(data["op"]=="sign_in"):
                db = connectdb()
                if(sign_in(db,data["user"],data["code"])):
                    uid = str(get_UID(db,data["user"]))
                    mesg =uid+' '+data["user"]
                    self.wfile.write(mesg.format(self.path).encode('utf-8')) 
                else:
                    self.wfile.write("-1".format(self.path).encode('utf-8'))
        
            elif(data["op"]=="registe"):
                db = connectdb()
                uid=add_u(db,data["user"],data["code"])
                if(uid!=-1):
                    mesg =str(uid)+' '+data["user"]
                    self.wfile.write(mesg.format(self.path).encode('utf-8')) 
                else:
                    self.wfile.write("-1".format(self.path).encode('utf-8'))

            elif(data["op"]=="add_collection"):
            
                db = connectdb()
                if(add_c(db,data["uid"],data["nid"])):
                    self.wfile.write("1".format(self.path).encode('utf-8'))
                else:
                    self.wfile.write("-1".format(self.path).encode('utf-8'))
                
            elif(data["op"]=="get_collection"):
                print("get_collection")
                db = connectdb()
                mesg = get_c(db,data["uid"])
                self.wfile.write(mesg.format(self.path).encode('utf-8'))

            elif(data["op"]=="delete_collection"):
                db = connectdb()
                if(del_c(db,data["uid"],data["nid"])):
                    mesg = get_c(db,data["uid"])
                    self.wfile.write(mesg.format(self.path).encode('utf-8'))
                else:
                    self.wfile.write("-1".format(self.path).encode('utf-8'))  

            #adding
            elif(data["op"]=="get_pic"):
                send_pic(self)
            elif(data["op"]=="get_pic_info"):
                send_pic_info(self)

        else:
            post_data = post_data.decode('iso-8859-1')
            n =int (post_data.find('stream'))
            post_data=post_data[n+10:]
            post_data= post_data.encode('iso-8859-1')
            print(post_data)
            fb = open("D:\\Master_S\\2020A_Software_E\\sever_sql\\3.png","wb")
            fb.write(post_data)
            fb.close
            pic_shap()
            i = str(match())

            self.wfile.write(i.format(self.path).encode('utf-8'))


        
        
            
                
       
    def respond(self, opts):
        response = self.handle_http(opts['status'], self.path)
        self.wfile.write(response)

    def handle_http(self, status_code, path):
        self.send_response(status_code)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        content = '''
           <html><head><title>Title goes here.</title></head>
           <body><p>This is a test.</p>
           <p>You accessed path: {}</p>
           </body></html>
           '''.format(path)
        return bytes(content, 'UTF-8')

def run(server_class=HTTPServer, handler_class=S, port=8080):
    logging.basicConfig(level=logging.INFO)
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    logging.info('Starting httpd...\n')
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()
    logging.info('Stopping httpd...\n')

if __name__ == '__main__':
    from sys import argv
    
    if len(argv) == 2:
        run(port=int(argv[1]))
    else:
        run()
