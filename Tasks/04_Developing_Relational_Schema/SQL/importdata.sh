#echo 'Start'

touch Data/NYPL.db
rm -rf Data/NYPL.db

#../../Tools/sqlite/sqlite3 :memory: ".read SQL/ImportData.sql"
#../../Tools/sqlite/sqlite3 Data/NYPL.db ".read SQL/Dish.sql"
#../../Tools/sqlite/sqlite3 Data/NYPL.db ".read SQL/Menu.sql"
#../../Tools/sqlite/sqlite3 Data/NYPL.db ".read SQL/MenuPage.sql"
#../../Tools/sqlite/sqlite3 Data/NYPL.db ".read SQL/MenuItem.sql"
#../../Tools/sqlite/sqlite3 Data/NYPL.db ".read SQL/All.sql"
../../Tools/sqlite/sqlite3 Data/NYPL.db ".read SQL/FixAllData.sql"

#echo 'End'