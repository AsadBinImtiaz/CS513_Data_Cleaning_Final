#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import numpy as np

with open('Data\Dish.csv','r',encoding='utf-8') as f:
    dish_df = pd.read_csv(f)
    
dish_df.id   = dish_df.id.astype(int)
dish_df.menus_appeared = dish_df.menus_appeared.astype(int)
dish_df.times_appeared = dish_df.times_appeared.astype(int)
dish_df.first_appeared = dish_df.first_appeared.astype(int)
dish_df.last_appeared  = dish_df.last_appeared.astype(int)
dish_df.lowest_price   = dish_df.lowest_price.astype(float)
dish_df.highest_price  = dish_df.highest_price.astype(float)

dish_df.name = dish_df.name.str.title().str.replace(' & ',' And ')

dish_df.to_csv('Data\Dish.csv',encoding='utf-8',float_format='%.2f',index=False)

# ### END
