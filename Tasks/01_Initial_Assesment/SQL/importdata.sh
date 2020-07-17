#echo 'Start'

touch Data/NYPL.db
rm -rf Data/NYPL.db
touch Data/NYPL.db

../../Tools/sqlite/sqlite3 Data/NYPL.db ".read SQL/ImportData.sql"

#echo 'End'