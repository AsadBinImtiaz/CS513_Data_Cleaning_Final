type nul > Data\NYPL.db
DEL Data\NYPL.db /Q /F
type nul > Data\NYPL.db

..\..\Tools\sqlite\sqlite3.exe Data\NYPL.db ".read SQL/ImportData.sql"

