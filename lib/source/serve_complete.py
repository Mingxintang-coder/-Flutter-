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


    shutil.rmtree('D:/results_vae/')
    os.mkdir('D:/results_vae/')

    path='D:/results_vae/'

    i=0


def pic_shap():
    crop_size = (28, 28)
    img = cv2.imread('D:/Master_S/2020A_Software_E/sever_sql/3.png',cv2.IMREAD_GRAYSCALE)
    img_new = cv2.resize(img, crop_size, interpolation = cv2.INTER_AREA)
    img_new = 255-img_new

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


def add_u(db,account,password):
    cursor = db.cursor()
    sql = 'SELECT MAX(Id) AS id FROM User'
    cursor.execute(sql)
    uid = cursor.fetchone()[0]+1
    sql ="""INSERT INTO User  (Id,Account,Password)
     VALUES(%s,%s,%s)"""
    values =(uid,account,password)




if __name__ == '__main__':
    from sys import argv
    
    if len(argv) == 2:
        run(port=int(argv[1]))
    else:
        run()