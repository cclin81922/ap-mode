#!/bin/bash

mysql -uroot -h 127.0.0.1 -e 'create database ap_mode;'
python init_model.py
