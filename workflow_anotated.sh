# @begin NYPL\_Data\_Cleansing\_Workflow @desc NYPL Data Cleaning.
# @in     @{Raw_Data_Dir}
# @param  ${filename}
# @out Tasks/06\_Data\_Provenance/Data/${filename} @desc Final Cleansed Output File.

#!/bin/bash
echo "Start of Data Cleansing"

cd Tasks

echo '####################################'
echo '# Task 1 - Initial_Assesment        '
echo '####################################'

cd "01_Initial_Assesment"

# @begin 01\_Initial\_Assesment @desc Initial Data Assesment.
# @in     @{Raw_Data_Dir}
# @param  ${filename}
# @out Tasks/01\_Initial\_Assesment/Data/${filename} @file stream:filestream
    
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
    
# @end 01\_Initial\_Assesment

echo '####################################'
echo '# Task 2 - Open Refine              '
echo '####################################'

cd "02_OpenRefine_Cleansing"

# @begin 02\_OpenRefine\_Cleansing @desc Cleansing with Open Refine Tool.
# @in  Tasks/01\_Initial\_Assesment/Data/${filename} @file stream:filestream
# @out Tasks/02\_OpenRefine\_Cleansing/Data/${filename} @file stream:filestream
# @param  OpenRefine

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

# @end 02\_OpenRefine\_Cleansing

echo '####################################'
echo '# Task 3 - Other Tools              '
echo '####################################'

cd "03_Data_Cleansing_Other_Tools"

# @begin 03\_Data\_Cleansing\_Other\_Tools @desc Cleansing (e.g. RegEx, Formats etc.) with Python.
# @in  Tasks/02\_OpenRefine\_Cleansing/Data/${filename} @file stream:filestream
# @out Tasks/03\_Data\_Cleansing\_Other\_Tools/Data/${filename} @file stream:filestream
# @param  Python

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

# @end 03\_Data\_Cleansing\_Other\_Tools @desc Initial Data Assesment.

echo '####################################'
echo '# Task 4 - Relational Schema        '
echo '####################################'

cd "04_Developing_Relational_Schema"

# @begin 04\_Developing\_Relational\_Schema @desc Cleansing in SQLLite.
# @in  Tasks/03\_Data\_Cleansing\_Other\_Tools/Data/${filename} @file stream:filestream
# @out Tasks/04\_Developing\_Relational\_Schema/Data/${filename} @file stream:filestream
# @param  SQLLite

echo '* Extract Open Refine Cleansed Data with python to: Tasks/04_Developing_Relational_Schema/Data'
python "Python/ExtractData.py" > /dev/null 2>&1

# Load in SQLLite to Explore
echo '* Load in SQLLite to Explore in: Tasks/04_Developing_Relational_Schema'
./"SQL/importdata.sh" 

echo '* Saving Zip Archive to: Tasks/04_Developing_Relational_Schema/Data'
#python "Python/ZipTaskData.py" > /dev/null 2>&1

cd ..

# @end 04\_Developing\_Relational\_Schema 

echo '####################################'
echo '# Task 5 - Workflow Model           '
echo '####################################'

cd "05_Workflow_Model"
 
# @begin 05\_Workflow\_Model @desc Cleansing in YesWorkFlow.
# @in  Tasks/04\_Developing\_Relational\_Schema/Data/${filename} @file stream:filestream
# @out Tasks/05\_Workflow\_Model/Data/${filename} @file stream:filestream
# @param  SQLLite

echo '* Extract Open Refine Cleansed Data with python to: Tasks/05_Workflow_Model/Data'
python "Python/ExtractData.py" > /dev/null 2>&1

echo '* Saving Zip Archive to: Tasks/05_Workflow_Model/Data'
python "Python/ZipTaskData.py" > /dev/null 2>&1

cd ..

# @end 05\_Workflow\_Model @desc Cleansing in SQLLite.

echo '####################################'
echo '# Task 6 - Data Provenance          '
echo '####################################'

cd "06_Data_Provenance"

# @begin 06\_Data\_Provenance @desc Data Proveenance.
# @in  Tasks/05\_Workflow\_Model/Data/${filename} @file stream:filestream
# @out Tasks/06\_Data\_Provenance/Data/${filename} @file stream:filestream
# @param  SQLLite
# @param  DataLog

echo '* Extract Open Refine Cleansed Data with python to: Tasks/06_Data_Provenance/Data'
python "Python/ExtractData.py" > /dev/null 2>&1

echo '* Saving Zip Archive to: Tasks/06_Data_Provenance/Data'
python "Python/ZipTaskData.py" > /dev/null 2>&1

cd ..

echo "End of Data Cleansing"

cd ..

# @end 06\_Data\_Provenance @desc Cleansing in SQLLite.

# @end NYPL\_Data\_Cleansing\_Workflow