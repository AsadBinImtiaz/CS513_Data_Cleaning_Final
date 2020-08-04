# CS513_Data_Cleaning_Final
CS513 Repository for Data-Clorox Team
Author
Asad Bin Imtiaz/Muhammad Rafay

## Introduction

This repository contain the final project and report for CS513: Theory and practice of Data Cleaning course offered at University of Illinois Urbana Champagne in Summer 2020. 

In this project data wrangling, standardization and provenance workflow was performed for the The New York Public Library (NYPL), What's on the menu? dataset. The analysis and findings are part of Final Project for CS513: Theory and Practice of Data Cleaning Course from the university of Illinois, wherein the NYPL dataset was used to create an end-to-end data wrangling and provenance workflow, together with data landscape analysis and findings, using data provenance and data cleansing techniques learned in the class. The project includes a report which summarizes the methods and tools, as well as the analysis and findings carried out for the project work,

## Tools

Following tools were used in this project:

1> **OpenRefine**  : An open source and powerful tool for cleaning and profiling data
2> **SQLLite**     : An free to use small, full-featured SQL database.
3> **Python3**     : Pandas library with Python 3.
4> **YesWorkflow** : An open source workflow anotation and provenance management tool.
5> **or2yw**       : An open source tool for generating provenance from OpenRefine audit logs.

Other tools used for project but not required to reproduce the data transformation are:

1> DB-Visualizer Pro 9.2 
2> Teradata 14 Data warehousing solution

## Project Goal

The goal of this project was to use open souce and freely available tools to clean the NYPL data to make it available for many more use cases.

## Project Tasks

The project work was divided into multiple tasks. Below is the task breakdown:

•	Overview and initial assessment of the dataset.
•	Data cleaning with Open-Refine.
•	Data cleaning with other tools.
•	Developing a relational schema.
•	Creating a workflow model.
•	Developing provenance.

## Project Setup

The project directories are set up hierarchically. The raw data is present in the root project directory in a subdirectory called Data/. The Artifacts/ directory in the root project directory is for any artifacts, such as images generated by the data wrangling tasks. The Tools/ directory contains executable tools used for data cleaning (such as SQLLite) so that workflow could be started without any installations.

Each of the above 6 tasks has a subdirectory in the Tasks/ directory. The project is set up in a directory structure where each of the above 6 tasks has their Data/ directories, under the Tasks/<Task_Name>/ directory in the project root directory. The First task, takes the data from the Raw Data directory in the root project folder (<Root>/Data/) and stores processed data in its local directory (<Root>/Tasks/<Task_Name>/Data/). Each subsequent task takes the data from the preceding task’s Data directory and stores it in its own Data directory after processing.
  
