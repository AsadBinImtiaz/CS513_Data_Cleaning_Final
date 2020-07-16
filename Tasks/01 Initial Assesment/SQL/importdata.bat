echo 'Start'

type nul > %1\..\Data\NYPL.db
DEL %1\..\Data\NYPL.db /Q /F
type nul > %1\..\Data\NYPL.db

%1\..\..\..\Tools\sqlite\sqlite3.exe %1\..\Data\NYPL.db ".read %1/ImportData.sql"

echo 'End'