## Getting and Cleaning Data Course Project

The main purpose of this project is to get a tidy data set with average values of different data which was taken using Samsung smartphones accelerometers, 
for each kind of activity for every test subject. 

All test and train data are placed at the web and available for download by link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This file represents data collected from the accelerometers of Samsung Galaxy S
smartphone used by 30 subjects while doing 6 different kinds of activities
(LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, WALKING UPSTAIRS)
 
### Files included in project
README.md       -   readme markdown text file.

CodeBook.md     -   markdown text file than describes the variables, the data, and 
                    another work performed to clean up the data

run_analisys.R  -   R script that does all operations to make tidy data set from
                    data represented at the web. 
                    
### Software requirements
R version 3.1.3 (2015-03-09)
data.table package version 1.9.4
RStudio version 0.98.1102 (optional)

### Usage of data analysis script
1. Run R console or RStudio.
2. Check/set working directory using getwd()/setwd() commands. For 
work with data represended working directory check free disk space, must
have at least 100 Mb in it. 
3. Load run_analysis.R script using open file command.
4. Run run_analysis.R script using Run All command.
5. After completion of all operations script will print a message
to console ""result data set created as file result_data.txt in <your directory>"
for easier getting a result data file. 

