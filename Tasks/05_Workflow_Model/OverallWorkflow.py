

# @BEGIN OverallWorkflow
# @IN Dish_File @URI file:Data/Dish.csv
# @IN Menu_File @URI file:Data/Menu.csv
# @IN MenuItem_File @URI file:Data/MenuItem.csv
# @IN MenuPage_File  @URI file:Data/Menupage.csv


# @BEGIN Replace(&,And)
# @IN Dish_File @URI file:Data/Dish.csv
# @IN Menu_File_Updated @URI file:Data/Menu.csv
# @PARAM Dish.name
# @PARAM Menu.name
# @PARAM Menu.sponsor
# @PARAM Menu.event
# @PARAM Menu.venue
# @PARAM Menu.place
# @PARAM Menu.physical_description
# @PARAM Menu.occasion
# @PARAM Menu.notes
# @PARAM Menu.location
# @PARAM Menu.status

# @OUT Menu_File_Updated2  @URI file:Data/Menu.csv
# @OUT Dish_File_Updated  @URI file:Data/Dish.csv
# @END Replace(&And)



# @BEGIN Replace(NAN,)
# @IN MenuItem_File_Updated @URI file:Data/MenuItem.csv
# @IN Menu_File @URI file:Data/Menu.csv

# @PARAM Menu.name
# @PARAM Menu.sponsor
# @PARAM Menu.event
# @PARAM Menu.venue
# @PARAM Menu.place
# @PARAM Menu.occasion
# @PARAM Menu.notes
# @PARAM Menu.location
# @PARAM Menu.status
# @PARAM Menu.currency
# @PARAM Menu.currency_symbol
# @PARAM Menu.call_number




# @PARAM MenuItem.created_at
# @PARAM MenuItem.updated_at
# @OUT MenuItem_File_Updated2  @URI file:Data/MenuItem.csv
# @OUT Menu_File_Updated  @URI file:Menu.csv

# @END Replace(NAN,)


# @BEGIN rstrip(UTC)
# @IN MenuItem_File_Updated2  @URI file:Data/MenuItem.csv
# @OUT MenuItem_File_Updated3  @URI file:Data/MenuItem.csv
# @END rstrip(UTC)

# @BEGIN fillna(-1)
# @IN MenuItem_File @URI file:Data/MenuItem.csv

# @IN MenuPage_File  @URI file:Data/Menupage.csv

# @PARAM MenuPage.page_number
# @PARAM MenuItem.dish_id

# @OUT MenuPage_File_Updated  @URI file:Data/Menupage.csv
# @OUT MenuItem_File_Updated  @URI file:Data/MenuItem.csv

# @END fillna(-1)


# @BEGIN Replace(psnypl_rbk_&ps_rbk_)
# @IN MenuPage_File_Updated  @URI file:Data/Menupage.csv
# @PARAM MenuPage.image_id

# @OUT MenuPage_File_Updated2  @URI file:Data/Menupage.csv
# @END Replace(psnypl_rbk_&ps_rbk_)



# @BEGIN ImportCSVtoSQL
# @IN MenuPage_File_Updated2  @URI file:Data/Menupage.csv
# @IN MenuItem_File_Updated3  @URI file:Data/MenuItem.csv
# @IN Menu_File_Updated2  @URI file:Data/MenuItem.csv
# @IN Dish_File_Updated  @URI file:Data/Dish.csv


# @OUT NYPL_db  @URI file:Data/NYPL.db

# @END ImportCSVtoSQLDatabase


# @BEGIN CopyTable
# @IN NYPL_db  @URI file:Data/NYPL.db

# @OUT Dish_New(v1) @URI file:Data/NYPL.db
# @OUT MenuItem_New(v1)  @URI file:Data/NYPL.db
# @OUT MenuPage_New(v1)  @URI file:Data/NYPL.db
# @OUT Menu_New(v1)  @URI file:Data/NYPL.db

# @END CopyTable


# @BEGIN UpdateDish
# @IN Dish_New(v1) @URI file:Data/NYPL.db

# @PARAM Dish.last_appeared_WHERE_last_appeared<first_appeared
# @PARAM Dish.last_appeared_WHERE_last_appeared>current
# @PARAM Dish.first_appeared_WHERE_first_appeared>current

# @OUT Dish_New(v2) @URI file:Data/NYPL.db

# @END UpdateDish


# @BEGIN UpdateMenu
# @IN Menu_New(v1) @URI file:Data/NYPL.db

# @PARAM Menu.name_WHERE_MissingValues
# @PARAM Menu.sponsor_WHERE_MissingValues

# @OUT Menu_New(v2) @URI file:Data/NYPL.db
# @END UpdateMenu




# @BEGIN UpdateMenuItem
# @IN MenuItem_New(v1) @URI file:Data/NYPL.db

# @PARAM MenuItem.updated_at_WHERE_created_at>updated_at
# @PARAM MenuItem.high_price_WHERE_price>high_price&high_price=null

# @OUT MenuItem_New(v2) @URI file:Data/NYPL.db
# @END UpdateMenu




# @BEGIN UpdateMenuPage
# @IN MenuPage_New(v1) @URI file:Data/NYPL.db

# @PARAM MenuPage.page_number_BY_id

# @OUT MenuPage_New(v2) @URI file:Data/NYPL.db
# @END UpdateMenu


# @BEGIN UpdateDish&MenuItemByJOIN
# @IN Dish_New(v2) @URI file:Data/NYPL.db
# @IN MenuItem_New(v2) @URI file:Data/NYPL.db

# @PARAM MenuItem.dish_id
# @PARAM Dish.menus_appeared
# @PARAM Dish.times_appeared
# @PARAM Dish.first_appeared
# @PARAM Dish.last_appeared
# @PARAM Dish.lowest_price
# @PARAM Dish.highest_price



# @IN Dish_New(v3) @URI file:Data/NYPL.db
# @IN MenuItem_New(v3) @URI file:Data/NYPL.db
# @END UpdateDish&MenuItemByJOIN







# @END OverallWorkflow