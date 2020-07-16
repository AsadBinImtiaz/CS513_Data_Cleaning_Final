#!/usr/bin/env python
# coding: utf-8

import zipfile


# ## Import Raw Data to Data Directory
# 
# In Each task, the data from previous task's data directory is read, transformed and written in this task's data directory
# 
# IN Task 1, since there is no previous task, the data is taken from Raw data directory of the project. This data is zip archived and is extracted with this python job

Root_Dir = './'


Task_Name = '01 Initial Assesment'
Tool_Name = 'Python'


Raw_Data = 'Data.zip'

Task_Dir = 'Tasks/'
Data_Dir = 'Data/'


with zipfile.ZipFile(Root_Dir+Data_Dir+Raw_Data, 'r') as f:
    f.extractall(Root_Dir+Task_Dir+Task_Name+Data_Dir)


#END

