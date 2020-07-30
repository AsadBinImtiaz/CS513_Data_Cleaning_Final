#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import numpy as np

with open('Data\Menu.csv','r',encoding='utf-8') as f:
    menu_df = pd.read_csv(f)

menu_df.id = menu_df.id.astype(int)
menu_df.name = menu_df.name.replace(np.nan, '', regex=True).astype(str)
menu_df.sponsor = menu_df.sponsor.replace(np.nan, '', regex=True).astype(str)
menu_df.event = menu_df.event.replace(np.nan, '', regex=True).astype(str)
menu_df.venue = menu_df.venue.replace(np.nan, '', regex=True).astype(str)
menu_df.place = menu_df.place.replace(np.nan, '', regex=True).astype(str)
menu_df.occasion = menu_df.occasion.replace(np.nan, '', regex=True).astype(str)
menu_df.call_number = menu_df.call_number.replace(np.nan, '', regex=True).astype(str)
menu_df.location = menu_df.location.replace(np.nan, '', regex=True).astype(str)
menu_df.currency = menu_df.currency.replace(np.nan, '', regex=True).astype(str)
menu_df.currency_symbol = menu_df.currency_symbol.replace(np.nan, '', regex=True).astype(str)
menu_df.status = menu_df.status.replace(np.nan, '', regex=True).astype(str)
menu_df.page_count = menu_df.page_count.astype(int)
menu_df.dish_count = menu_df.dish_count.astype(int)
menu_df.notes = menu_df.notes.replace(np.nan, '', regex=True).astype(str)

menu_df['date'] = menu_df.date.str.split('T',expand=True)[0].tolist()

menu_df.name                 = menu_df.name.str.title().str.replace(' & ',' And ')
menu_df.sponsor              = menu_df.sponsor.str.title().str.replace(' & ',' And ')
menu_df.event                = menu_df.event.str.title().str.replace(' & ',' And ').str.rstrip(';')
menu_df.venue                = menu_df.venue.str.title().str.replace(' & ',' And ').str.rstrip(';')
menu_df.place                = menu_df.place.str.title().str.replace(' & ',' And ').str.rstrip(';')
menu_df.physical_description = menu_df.physical_description.str.title().str.replace(' & ',' And ').str.rstrip(';')
menu_df.occasion             = menu_df.occasion.str.title().str.replace(' & ',' And ').str.rstrip(';')
menu_df.notes                = menu_df.notes.str.title().str.replace(' & ',' And ').str.rstrip(';')
menu_df.location             = menu_df.location.str.title().str.replace(' & ',' And ').str.rstrip(';')
menu_df.status               = menu_df.status.str.title()

menu_df.to_csv('Data\Menu.csv',encoding='utf-8',float_format='%.2f',index=False)



