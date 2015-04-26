---
title: "Cleaning Samsung HAR dataset"
author: "Aleksandr Beloushkin"
date: "Saturday, April 25, 2015"
output: html_document
---
### Initial set of data 

The initial data was collected from the accelerometers from the Samsung Galaxy S
smartphone. A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphone>.

#### This work was originally represented in a following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012).
Vitoria-Gasteiz, Spain. Dec 2012

### Getting  initial data set 

 Initial data was provided as a zip archive containing files of collected data
Original file is available to download by the following link:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

### Original codebook information that was provided in features_info.txt
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

### Archive contains two data sets, named as test and train which divided into
### following files which were used in performing analisys

#### Common data files:
- 'features.txt': List of all features.Represented as two columns space separated 
text data file
- 'activity_labels.txt': Links the class labels with their activity name.Represented
as two columns space separated text data file

#### Test data set:
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Test subjects ID's appropriate to each row of test set.

All files are space separated text

#### Train data set:
- 'train/X_train.txt': Train set.
- 'train/y_train.txt': Train labels.
- 'train/subject_train.txt': Train subjects ID's appropriate to each row of train set.

All files are space separated text.


### Arhive also contains data sets which were not used while doing analysis and making 
### resulting data set

#### Test data set:
- 'test/Inertial Signals/total_acc_x_test.txt': The acceleration signal from the
smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128
element vector. 
- 'test/Inertial Signals/total_acc_y_test.txt': The acceleration signal from the
smartphone accelerometer Y axis in standard gravity units 'g'. Every row shows a 128
element vector. 
- 'test/Inertial Signals/total_acc_z_test.txt': The acceleration signal from the
smartphone accelerometer Z axis in standard gravity units 'g'. Every row shows a 128
element vector. 
- 'test/Inertial Signals/body_acc_x_test.txt': The X-axis body acceleration signal
obtained by subtracting the gravity from the total acceleration
- 'test/Inertial Signals/body_acc_y_test.txt': The Y-axis body acceleration signal
obtained by subtracting the gravity from the total acceleration
- 'test/Inertial Signals/body_acc_y_test.txt': The Z-axis body acceleration signal
obtained by subtracting the gravity from the total acceleration
- 'test/Inertial Signals/body_gyro_x_test.txt': The X-axis angular velocity vector
measured by the gyroscope for each window sample. The units are radians/second. 
- 'test/Inertial Signals/body_gyro_y_test.txt': The Y-axis angular velocity vector
measured by the gyroscope for each window sample. The units are radians/second. 
- 'test/Inertial Signals/body_gyro_z_test.txt': The Z-axis angular velocity vector
measured by the gyroscope for each window sample. The units are radians/second. 

#### Train data set:
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the
smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128
element vector. 
- 'train/Inertial Signals/total_acc_y_train.txt': The acceleration signal from the
smartphone accelerometer Y axis in standard gravity units 'g'. Every row shows a 128
element vector. 
- 'train/Inertial Signals/total_acc_z_train.txt': The acceleration signal from the
smartphone accelerometer Z axis in standard gravity units 'g'. Every row shows a 128
element vector. 
- 'train/Inertial Signals/body_acc_x_train.txt': The X-axis body acceleration signal
obtained by subtracting the gravity from the total acceleration
- 'train/Inertial Signals/body_acc_y_train.txt': The Y-axis body acceleration signal
obtained by subtracting the gravity from the total acceleration
- 'train/Inertial Signals/body_acc_y_train.txt': The Z-axis body acceleration signal
obtained by subtracting the gravity from the total acceleration
- 'train/Inertial Signals/body_gyro_x_train.txt': The X-axis angular velocity vector
measured by the gyroscope for each window sample. The units are radians/second. 
- 'train/Inertial Signals/body_gyro_y_train.txt': The Y-axis angular velocity vector
measured by the gyroscope for each window sample. The units are radians/second. 
- 'train/Inertial Signals/body_gyro_z_train.txt': The Z-axis angular velocity vector
measured by the gyroscope for each window sample. The units are radians/second.


### Resulting set of data

 Resulting data set contains only average values of mean and standart deviation
of measured features grouped by each subject and each activity. Data set has 
180 rows and 68 columns named appropriate to provided features info data file. 

#### Variables in resulting data set
        - subject: ID of a particular subject, from 1 to 30
        - activity: Name of a particular kind of activity from activity_labels data. 
        - timeBodyAcc-mean()-X : mean of time frame body component X-axis accelerometer signal 
        - timeBodyAcc-mean()-Y : mean of time frame body component Y-axis accelerometer signal 
        - timeBodyAcc-mean()-Z : mean of time frame body component Z-axis accelerometer signal 
        - timeBodyAcc-std()-X : standart deviation of time frame body component 
                                X-axis accelerometer signal 
        - timeBodyAcc-std()-Y : standart deviation of time frame body component 
                                Y-axis accelerometer signal 
        - timeBodyAcc-std()-Z : standart deviation of time frame body component
                                Z-axis accelerometer signal 
        - timeGravityAcc-mean()-X : mean of time frame gravity component X-axis
                                accelerometer signal
        - timeGravityAcc-mean()-Y : mean of time frame gravity component Y-axis
                                accelerometer signal
        - timeGravityAcc-mean()-Z : mean of time frame gravity component Z-axis
                                accelerometer signal
        - timeGravityAcc-std()-X : standart deviation of time frame gravity component
                                X-axis accelerometer signal
        - timeGravityAcc-std()-Y : standart deviation of time frame gravity component
                                Y-axis accelerometer signal
        - timeGravityAcc-std()-Z : standart deviation of time frame gravity component
                                Z-axis accelerometer signal
        - timeBodyAccJerk-mean()-X : mean of time frame Jerk accelerometer signal 
                                X-axis body component
        - timeBodyAccJerk-mean()-Y : mean of time frame Jerk accelerometer signal
                                Y-axis body component
        - timeBodyAccJerk-mean()-Z : mean of time frame Jerk accelerometer signal
                                Z-axis body component
        - timeBodyAccJerk-std()-X : standart deviation of time frame Jerk accelerometer
                                signal X-axis body component
        - timeBodyAccJerk-std()-Y : standart deviation of time frame Jerk accelerometer
                                signal Y-axis body component
        - timeBodyAccJerk-std()-Z : standart deviation of time frame Jerk signal Y-axis
                                body component
        - timeBodyGyro-mean()-X : mean of time frame body component X-axis gyroscope signal
        - timeBodyGyro-mean()-Y : mean of time frame body component Y-axis gyroscope signal
        - timeBodyGyro-mean()-Z : mean of time frame body component Z-axis gyroscope signal
        - timeBodyGyro-std()-X : standart deviation of time frame body component X-axis
                                gyroscope signal
        - timeBodyGyro-std()-Y : standart deviation of time frame body component Y-axis
                                gyroscope signal
        - timeBodyGyro-std()-Z : standart deviation of time frame body component Z-axis
                                gyroscope signal
        - timeBodyGyroJerk-mean()-X : mean of time frame Jerk gyroscope signal 
                                X-axis body component
        - timeBodyGyroJerk-mean()-Y : mean of time frame Jerk gyroscope signal 
                                Y-axis body component
        - timeBodyGyroJerk-mean()-Z : mean of time frame Jerk gyroscope signal 
                                Z-axis body component
        - timeBodyGyroJerk-std()-X : standart deviation of time frame Jerk gyroscope signal 
                                X-axis body component
        - timeBodyGyroJerk-std()-Y : standart deviation of time frame Jerk gyroscope signal 
                                Y-axis body component
        - timeBodyGyroJerk-std()-Z : standart deviation of time frame Jerk gyroscope signal 
                                Z-axis body component
        - timeBodyAccMag-mean() : mean of the Euclidean norm calulated magnitude of
                                three-dimensional accelerometer signal, body component
        - timeBodyAccMag-std() : standart deviation of the Euclidean norm calulated 
                                magnitude of three-dimensional accelerometer signal,
                                body component
        - timeGravityAccMag-mean() : mean of the Euclidean norm calulated magnitude of
                                three-dimensional accelerometer signal, gravity component
        - timeGravityAccMag-std() : standart deviation of the Euclidean norm calulated 
                                magnitude ofthree-dimensional accelerometer signal, 
                                gravity component
        - timeBodyAccJerkMag-mean() : mean of the Euclidean norm calulated magnitude of
                                three-dimensional Jerk accelerometer signal,
                                body component
        - timeBodyAccJerkMag-std() : standart deviation of the Euclidean norm calulated 
                                magnitude of three-dimensional Jerk accelerometer signal, 
                                body component
        - timeBodyGyroMag-mean() : mean of the Euclidean norm calulated magnitude of
                                three-dimensional gyroscope signal, body component
        - timeBodyGyroMag-std() : standart deviation of the Euclidean norm calulated 
                                magnitude of three-dimensional gyroscope signal,
                                body component
        - timeBodyGyroJerkMag-mean() : mean of the Euclidean norm calulated magnitude of
                                three-dimensional Jerk gyroscope signal,
                                body component
        - timeBodyGyroJerkMag-std() : standart deviation of the Euclidean norm calulated 
                                magnitude of three-dimensional Jerk gyroscope signal,
                                body component
        - fouriertransfBodyAcc-mean()-X : mean of result of fast fourier transform 
                                        of X-axis accelerometer signal,
                                        body component
        - fouriertransfBodyAcc-mean()-Y : mean of result of fast fourier transform 
                                        of Y-axis accelerometer signal,
                                        body component
        - fouriertransfBodyAcc-mean()-Z : mean of result of fast fourier transform 
                                        of Z-axis accelerometer signal,
                                        body component
        - fouriertransfBodyAcc-std()-X : standart deviation of result of fast fourier
                                        transform of X-axis accelerometer signal,
                                        body component
        - fouriertransfBodyAcc-std()-Y : standart deviation of result of fast fourier
                                        transform of Y-axis accelerometer signal,
                                        body component
        - fouriertransfBodyAcc-std()-Z : standart deviation of result of fast fourier
                                        transform of Z-axis accelerometer signal,
                                        body component
        - fouriertransfBodyAccJerk-mean()-X : mean of result of fast fourier transform of
                                        Jerk accelerometer signal, 
                                        X-axis body component
        - fouriertransfBodyAccJerk-mean()-Y : mean of result of fast fourier transform of
                                        Jerk accelerometer signal, 
                                        Y-axis body component
        - fouriertransfBodyAccJerk-mean()-Z : mean of result of fast fourier transform of
                                        Jerk accelerometer signal, 
                                        Y-axis body component
        - fouriertransfBodyAccJerk-std()-X : standart deviation of result of fast fourier
                                        transform of Jerk accelerometer signal, 
                                        X-axis body component
        - fouriertransfBodyAccJerk-std()-Y : standart deviation of result of fast fourier
                                        transform of Jerk accelerometer signal, 
                                        Y-axis body component
        - fouriertransfBodyAccJerk-std()-Z : standart deviation of result of fast fourier
                                        transform of Jerk accelerometer signal, 
                                        Z-axis body component
        - fouriertransfBodyGyro-mean()-X : mean of result of fast fourier transform 
                                        of X-axis gyroscope signal,
                                        body component
        - fouriertransfBodyGyro-mean()-Y : mean of result of fast fourier transform 
                                        of Y-axis gyroscope signal,
                                        body component
        - fouriertransfBodyGyro-mean()-Z : mean of result of fast fourier transform 
                                        of Z-axis gyroscope signal,
                                        body component
        - fouriertransfBodyGyro-std()-X : standart deviation of result of fast fourier
                                        transform of X-axis gyroscope signal,
                                        body component
        - fouriertransfBodyGyro-std()-Y : standart deviation of result of fast fourier
                                        transform of Y-axis gyroscope signal,
                                        body component
        - fouriertransfBodyGyro-std()-Z : standart deviation of result of fast fourier
                                        transform of Z-axis gyroscope signal,
                                        body component
        - fouriertransfBodyAccMag-mean() : mean of the Euclidean norm calulated 
                                        magnitude of three-dimensional FFT transformed 
                                        accelerometer signal,
                                        body component
        - fouriertransfBodyAccMag-std() : standart deviation of the Euclidean norm calulated 
                                        magnitude of three-dimensional FFT transformed 
                                        accelerometer signal,
                                        body component
        - fouriertransfBodyBodyAccJerkMag-mean() : mean of the Euclidean norm calulated 
                                        magnitude of three-dimensional FFT transformed 
                                        Jerk accelerometer signal,
                                        body component
        - fouriertransfBodyBodyAccJerkMag-std() : standart deviation of the Euclidean norm
                                        calulated  magnitude of three-dimensional FFT 
                                        transformed Jerk accelerometer signal,
                                        body component
        - fouriertransfBodyBodyGyroMag-mean() : mean of the Euclidean norm calulated 
                                        magnitude of three-dimensional FFT transformed 
                                        gyroscope signal,
                                        body component
        - fouriertransfBodyBodyGyroMag-std() : standart deviation of the Euclidean norm
                                        calulated  magnitude of three-dimensional FFT 
                                        transformed gyroscope signal,
                                        body component
        - fouriertransfBodyBodyGyroJerkMag-mean() : mean of the Euclidean norm
                                        calulated  magnitude of three-dimensional FFT 
                                        transformed Jerk gyroscope signal,
                                        body component
        - fouriertransfBodyBodyGyroJerkMag-std() : standart deviation of the Euclidean norm
                                        calulated  magnitude of three-dimensional FFT 
                                        transformed Jerk gyroscope signal,
                                        body component



### Processing of data

Resulting data set was obtained by running provided R script run_analysis.R
        Instruction for it's usage provided in a README file. Here is described 
        how that script works in details. 
        
The script does all the needed operations with data, from loading from the 
provided link to write result data table into a text comma separated file. 

To provide processing more reproducible and understandable helper functions 
were written and included into the script run_analysis.R

        - file.crdownload
        - file.unpack
        - file.getdfname
        - file.getworkname
        - get_cnames

Their full description and usage given in comments of run_analysis.R file. 
Because there are two similar datasets to get before combination all code 
for preparation of dataset put in prepare_dataset function. 

Function prepare_dataset reads needed files and combines data into a single 
data table, for given data add to X needed data from other sources 
activity labels, y, subject... uses names of needed data files from the
environment. 
parameters:
 - kindofdataset - character may be only "test" or "train"" in this case

```{r}
prepare_dataset <- function(kindofdataset = "test") {
        
        if (!(kindofdataset %in% c("test","train"))) {
                stop(paste("wrong kind of dataset!",kindofdataset))
                return(NA)
        }        
        
        features <- read.table(file.getworkname(features_df,
                                                unpackdir,
                                                kindofdataset), 
                               stringsAsFactors = FALSE) 
        
        X <- read.table(file.getworkname(X_df,
                                         unpackdir,
                                         kindofdataset), 
                        stringsAsFactors = FALSE)
        
        # set column names of X using features data frame
        colnames(X) <- as.vector(features[,2])
        
        # doing the same with subjects participated in experiment
        subjects <-  read.table(file.getworkname(subject_df,
                                                 unpackdir,
                                                 kindofdataset),
                                stringsAsFactors = FALSE)
                                
        # binding column of subject ID's to the right side  of X data frame                       
        X <- cbind(X,subjects$V1)
        colnames(X)[length(colnames(X))] <- "subject"
        
        y <- read.table(file.getworkname(y_df,
                                         unpackdir,
                                         kindofdataset), 
                        stringsAsFactors = FALSE)
        
        # binding activity column to the right side of X data frame
        X <- cbind(X,y$V1)
        colnames(X)[length(colnames(X))] <- "activity_id"
        
        factivelabels <- read.table(file.getworkname(activity_labels_df,
                                                     unpackdir,
                                                     kindofdataset),
                                    stringsAsFactors = FALSE) 
        
        ## applying appropriated labels to activities in our dataset
        X$activity <- sapply(X$activity_id, 
                             function(x) {factivelabels[x,2]})
        
        colnames(X)[length(colnames(X))] <- "activity"
        
        X        
}
```

Firstly, script downloads the file and unpacks it. After that it uses function
prepare_dataset to each of two kinds of data sets presented. Then, binds these
data sets using base::rbind function. 

```{r}
test_data <- prepare_dataset("test")
train_data <- prepare_dataset("train")
all_data <- rbind(test_data,train_data)
```

Then, subset resulting data frame getting only columns which names contain "-mean()"
or "-std()" text pattern in them


```{r}
needed_cols <- get_cnames(all_data,c("subject","activity"),c("-mean()","-std()"))
all_data <- all_data[,c(needed_cols)]
```

And rename columns to make their names more understandable to read. Also, 
clean names of activities from understroke symbol changing it to whitespace. 

```{r}
setnames(result_data,colnames(result_data),sub(colnames(result_data),
                                               pattern = "^t",
                                               replacement = "time"))
setnames(result_data,colnames(result_data),sub(colnames(result_data),
                                               pattern = "^f",
                                               replacement = "fouriertransf"))
result_data$activity  <- sub(result_data$activity,
                             pattern = "_",
                             replacement = " ")
```

After binding two data.frames into one it was summarized using mean() function
grouping by each subject and each activity. To do that data.table package was 
used. Notice that name of combined data frame is all_data.
```{r}
require(data.table)
all_data <- as.data.table(all_data)
needed_cols <- get_cnames(all_data,colpatterns = c("-mean()","-std()"))
result_data <- all_data[,
                        lapply(.SD, mean),
                        by = .(subject, activity),
                        .SDcols = needed_cols
                        ][order(subject,activity)]
```

Result data was written as comma separated text file (.txt) using table.write
function.


