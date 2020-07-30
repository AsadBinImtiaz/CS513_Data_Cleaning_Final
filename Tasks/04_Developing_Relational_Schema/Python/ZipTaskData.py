#!/usr/bin/env python
# coding: utf-8

import os
import zipfile
from os.path import basename



# ## Import Raw Data to Data Directory
# 
# In Each task, the data from previous task's data directory is read, transformed and written in this task's data directory
# 
# IN Task 1, since there is no previous task, the data is taken from Raw data directory of the project. This data is zip archived and is extracted with this python job

Root_Dir = '../../'


Prev_Task = '03_Data_Cleansing_Other_Tools'
Curr_Task = '04_Developing_Relational_Schema'
Tool_Name = 'Python'

out_Data  = 'Data.zip'

Task_Dir = 'Tasks/'
Data_Dir = 'Data/'

file_loc = Root_Dir+Task_Dir+Curr_Task+'/'+Data_Dir
out_file = file_loc+out_Data
    
with zipfile.ZipFile(out_file, 'w', zipfile.ZIP_DEFLATED) as f:
    for root, dirs, files in os.walk(file_loc):
        for file in files:
            if str(file).lower().endswith(".csv"):
                filepath = os.path.join(root, file)
                print("Added "+filepath)                
                f.write(filepath,  basename(filepath))
                
    

#END

