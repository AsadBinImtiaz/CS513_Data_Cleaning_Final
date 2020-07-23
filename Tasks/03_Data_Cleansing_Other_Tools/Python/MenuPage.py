#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import numpy as np

with open('Data\MenuPage.csv','r',encoding='utf-8') as f:
    mp_df = pd.read_csv(f)

mp_df.id = mp_df.id.astype(int)
mp_df.menu_id = mp_df.menu_id.astype(int)
mp_df.page_number = mp_df.page_number.fillna(-1).astype(int)
mp_df.image_id =  mp_df.image_id.astype(str)
mp_df.full_height = mp_df.full_height.astype(float)
mp_df.full_width = mp_df.full_width.astype(float)
mp_df.uuid = mp_df.uuid.astype(str)

mp_df.image_id = mp_df.image_id.str.replace('psnypl_rbk_','')
mp_df.image_id = mp_df.image_id.str.replace('ps_rbk_','')

mp_df.describe()

mp_df.to_csv('Data\MenuPage.csv',encoding='utf-8',index=False)

# 
