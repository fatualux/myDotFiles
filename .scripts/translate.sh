#! /bin/bash

echo Word or phrase?
echo  

read -r term

echo  
echo Translating...
echo  

trans -p -t it "$term"
