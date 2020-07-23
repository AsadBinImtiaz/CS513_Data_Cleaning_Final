#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import numpy as np

with open('Data\MenuItem.csv','r',encoding='utf-8') as f:
    mi_df = pd.read_csv(f)

mi_df.id           = mi_df.id.astype(int)
mi_df.menu_page_id = mi_df.menu_page_id.astype(int)
mi_df.price        = mi_df.price.astype(float)
mi_df.high_price   = mi_df.high_price.astype(float)
mi_df.dish_id      = mi_df.dish_id.fillna(-1).astype(int)
mi_df.created_at   = mi_df.created_at.replace(np.nan, '', regex=True).astype(str)
mi_df.updated_at   = mi_df.updated_at.replace(np.nan, '', regex=True).astype(str)
mi_df.xpos         = mi_df.xpos.astype(float)
mi_df.ypos         = mi_df.ypos.astype(float)

mi_df['created_at'] = mi_df.created_at.str.rstrip(' UTC')
mi_df['updated_at'] = mi_df.updated_at.str.rstrip(' UTC')

mi_df.to_csv('Data\MenuItem.csv',encoding='utf-8',float_format='%.6f',index=False)

