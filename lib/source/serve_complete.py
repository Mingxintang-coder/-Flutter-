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
