#!/bin/bash
echo "Start of Data Cleansing"

cd Tasks

echo '####################################'
echo '# Task 1 - Initial_Assesment        '
echo '####################################'

cd "01_Initial_Assesment"

# Extract Data
echo '* Extract Data with python to: Tasks/01_Initial_Assesment/Data'
python "Python/ExtractData.py" > /dev/null 2>&1

# Load in SQLLite to Explore
echo '* Load in SQLLite to Explore in: Tasks/01_Initial_Assesment/Data/NYPL.db'
./"SQL/importdata.sh" #> /dev/null 2>&1

# Execute Expolore script
echo '* Explore data using: Tasks/01_Initial_Assesment/SQL/Explore.sql'
# ../../Tools/sqlite/sqlite3 Data/NYPL.db ".read SQL/Explore.sql" /dev/null 2>&1
echo '* Saving Zip Archive to: Tasks/01_Initial_Assesment/Data'

cd ..

echo '####################################'
echo '# Task 2 - Open Refine              '
echo '####################################'

cd "02_OpenRefine_Cleansing"

# Extract Open Refefine Data
echo '* Extract Data with python to: Tasks/02_OpenRefine_Cleansing/Data'
python "Python/ExtractData.py" > /dev/null 2>&1

# Generate OpenRefine Audit
echo '* Extract OpenRefine Audit logs to : Tasks/02_OpenRefine_Cleansing/Open Refine'
echo '    OpenRefine < Data/Dish.csv     > "Open Refine/Dish.json"'
echo '    OpenRefine < Data/MenuItem.csv > "Open Refine/MenuItem.json"'
echo '    OpenRefine < Data/MenuPage.csv > "Open Refine/ManuPage.json"'
echo '    OpenRefine < Data/Menu.csv     > "Open Refine/Menu.json"'
echo '* Saving Zip Archive to: Tasks/02_OpenRefine_Cleansing/Data'


cd ..

echo '####################################'
echo '# Task 3 - Other Tools              '
echo '####################################'

cd "03_Data_Cleansing_Other_Tools"

echo '* Extract Open Refine Cleansed Data with python to: Tasks/03_Data_Cleansing_Other_Tools/Data'
python "Python/ExtractData.py" > /dev/null 2>&1

echo '    Processing Menu.csv'
python "Python/Menu.py" #> /dev/null 2>&1

echo '    Processing Dish.csv'
python "Python/Dish.py" #> /dev/null 2>&1

echo '    Processing MenuItem.csv'
python "Python/MenuItem.py" #> /dev/null 2>&1

echo '    Processing MenuPage.csv'
python "Python/MenuPage.py" #> /dev/null 2>&1

echo '* Saving Zip Archive to: Tasks/03_Data_Cleansing_Other_Tools/Data'
python "Python/ZipTaskData.py" > /dev/null 2>&1

cd ..

echo '####################################'
echo '# Task 4 - Relational Schema        '
echo '####################################'

cd "04_Developing_Relational_Schema"

echo '* Extract Open Refine Cleansed Data with python to: Tasks/04_Developing_Relational_Schema/Data'
python "Python/ExtractData.py" > /dev/null 2>&1

# Load in SQLLite to Explore
echo '* Load in SQLLite to Explore in: Tasks/04_Developing_Relational_Schema'
./"SQL/importdata.sh" 
echo '* Saving Zip Archive to: Tasks/04_Developing_Relational_Schema/Data'
#python "Python/ZipTaskData.py" > /dev/null 2>&1

cd ..

echo '####################################'
echo '# Task 5 - Workflow Model           '
echo '####################################'

cd "05_Workflow_Model"
 
echo '* Extract Open Refine Cleansed Data with python to: Tasks/05_Workflow_Model/Data'
python "Python/ExtractData.py" > /dev/null 2>&1

echo '* Saving Zip Archive to: Tasks/05_Workflow_Model/Data'
python "Python/ZipTaskData.py" > /dev/null 2>&1

cd ..

echo '####################################'
echo '# Task 6 - Data Provenance          '
echo '####################################'

cd "06_Data_Provenance"

echo '* Extract Open Refine Cleansed Data with python to: Tasks/06_Data_Provenance/Data'
python "Python/ExtractData.py" > /dev/null 2>&1

echo '* Saving Zip Archive to: Tasks/06_Data_Provenance/Data'
python "Python/ZipTaskData.py" > /dev/null 2>&1

cd ..

echo "End of Data Cleansing"

cd ..