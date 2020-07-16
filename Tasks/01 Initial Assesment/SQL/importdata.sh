echo 'Start'

touch $1/../Data/NYPL.db
rm -rf $1/../Data/NYPL.db
touch $1/../Data/NYPL.db

$1/../../../Tools/sqlite/sqlite3 $1/../Data/NYPL.db ".read $1/ImportData.sql"

echo 'End'