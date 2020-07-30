


# @BEGIN SQLWorkflow


# @BEGIN ImportDatafromCSV
# @IN Dish @URI file:Data/Dish.csv
# @IN Menu @URI file:Data/Menu.csv
# @IN MenuPage @URI file:Data/MenuPage.csv
# @IN MenuItem @URI file:Data/MenuItem.csv



# @OUT Dish 
# @OUT Menu  
# @OUT MenuPage
# @OUT MenuItem  
# @END ImportDatafromCSV




# @BEGIN CreateDish_New
# @IN Dish 
# @OUT Dish_New 
# @END CreateDish_New


# @BEGIN TrimNameDish_New
# @IN Dish_New 
# @OUT Dish_NewV1 
# @END TrimNameDish_New


# @BEGIN UpdateDish_NewV1
# @IN Dish_NewV1 
# @PARAM last_appeared=currentYear_WHERE_last_appeared>currentYear
# @PARAM last_appeared=first_appeared_WHERE_last_appeared<first_appeared
# @PARAM first_appeared=currentYear_WHERE_first_appeared>currentYear


# @OUT Dish_NewV2 
# @END UpdateDish_NewV1



# @BEGIN CreateMenu_New
# @IN Menu 
# @OUT Menu_New 
# @END CreateMenu_New





# @BEGIN FixMissingVals_Menu_New
# @IN Menu_New
# @PARAM sponsor_WHERE_Values_Are_Missing
# @PARAM name_WHERE_Values_Are_Missing




# @OUT Menu_NewV1 
# @END FixMissingVals_Menu_New



# @BEGIN CreateMenuPage_New
# @IN MenuPage 
# @OUT MenuPage_New 
# @END CreateMenuPage_New




# @BEGIN UpdateMenuPage_New_PageNumber
# @IN MenuPage_New 
# @PARAM page_number_where_=-1





# @OUT MenuPage_NewV1 
# @END UpdateMenuPage_New_PageNumber



# @BEGIN CreateMenuItem_New
# @IN MenuItem 
# @OUT MenuItem_New 
# @END CreateMenuItem_New

# @BEGIN UpdateMenuItem_New
# @IN MenuItem_New 
# @PARAM high_price_=_price_WHERE_price_>_high_price
# @PARAM high_price_=_price_WHERE_price_is_null
# @PARAM updated_at_=_created_at_WHERE_created_at_>_updated_at







# @OUT MenuItem_NewV1 
# @END CreateMenuItem_New




# @BEGIN ConsolidatingDishNames
# @IN Dish_NewV2
# @IN MenuItem_NewV1 

# @OUT Dish_NewV3
# @OUT MenuItem_NewV2 
# @END ConsolidatingDishNames


# @BEGIN RemovingOrphanEntities

# @IN MenuItem_NewV2 
# @IN MenuPage_NewV1
# @PARAM MenuItem.dish_id
# @PARAM MenuItem.menu_page_id
# @PARAM MenuPage.menu_id

# @OUT MenuItem_NewV3 
# @OUT MenuPage_NewV2
# @END RemovingOrphanEntities






# @BEGIN FixingRefrentialIntegrityDish

# @IN Dish_NewV3 
# @PARAM times_appeared
# @PARAM menus_appeared
# @PARAM first_appeared
# @PARAM last_appeared
# @PARAM lowest_price

# @OUT Dish_NewV4 
# @END FixingRefrentialIntegrityDish






# @BEGIN FixingRefrentialIntegrityMenuItem

# @IN MenuItem_NewV3 
# @PARAM high_price

# @OUT MenuItem_NewV4 
# @END FixingRefrentialIntegrityMenuItem



# @BEGIN FixingRefrentialIntegrityMenu

# @IN Menu_NewV1 
# @PARAM dish_count
# @PARAM page_count


# @OUT Menu_NewV2 
# @END FixingRefrentialIntegrityMenu



# @BEGIN SaveNYPL.db
# @IN Menu_NewV2 
# @IN MenuItem_NewV4
# @IN Dish_NewV4 
# @IN MenuPage_NewV2


# @OUT NYPL.db 

# @END SaveNYPL.db



# @END SQLWorkflow

