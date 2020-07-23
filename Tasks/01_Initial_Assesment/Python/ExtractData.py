#!/usr/bin/env python
# coding: utf-8

import zipfile


# ## Import Raw Data to Data Directory
# 
# In Each task, the data from previous task's data directory is read, transformed and written in this task's data directory
# 
# IN Task 1, since there is no previous task, the data is taken from Raw data directory of the project. This data is zip archived and is extracted with this python job

Root_Dir = '../../'


Curr_Task = '01_Initial_Assesment'
Tool_Name = 'Python'


in_Data = 'Data.zip'

Task_Dir = 'Tasks/'
Data_Dir = 'Data/'

print('Archive : '+Root_Dir+Data_Dir+in_Data)
print('Unzip to: '+Root_Dir+Task_Dir+Curr_Task+'/'+Data_Dir)

with zipfile.ZipFile(Root_Dir+Data_Dir+in_Data, 'r') as f:
    f.extractall(Root_Dir+Task_Dir+Curr_Task+'/'+Data_Dir)

#END

