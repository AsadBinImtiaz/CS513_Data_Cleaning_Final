#!/bin/bash
echo "Start of Cleanup"

rm -r Data/*.csv > /dev/null 2>&1

cd Tasks

cd "01_Initial_Assesment"
rm -r Data/*.csv > /dev/null 2>&1
rm -r Data/*.db  > /dev/null 2>&1
cd ..

cd "02_OpenRefine_Cleansing"
rm -r Data/*.csv > /dev/null 2>&1
cd ..

cd "03_Data_Cleansing_Other_Tools"
rm -r Data/*.csv > /dev/null 2>&1
cd ..

cd "04_Developing_Relational_Schema"
rm -r Data/*.csv > /dev/null 2>&1
cd ..

cd "05_Workflow_Model"
rm -r Data/*.csv > /dev/null 2>&1
rm -r Data/*.zip > /dev/null 2>&1
cd ..

cd "06_Data_Provenance"
rm -r Data/*.csv > /dev/null 2>&1
rm -r Data/*.zip > /dev/null 2>&1
cd ..

echo "End of Cleanup"

cd ..