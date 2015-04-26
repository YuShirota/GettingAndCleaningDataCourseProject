###------------------- run_analysis.R----------------------------------------###
#This script does the following. 
# Downloads file containing datasets from address:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Joins the activity and subject data to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set which
# contain the average of each variable for each activity and each subject.


###------------------- helper functions to process data ---------------------###

## function file.crdownload downloads file and puts a date into separate R file
## to know when file was downloaded. If file already exists, shows that date
## parameters:
## fileUrl -  character, url of file to download
## destdir -  character, relative(to working directory) path to directory in
##      which downloaded file will be placed
## destfile -  charactername of file which will be saved on disk
## extension - characterfile ext. name, after .

file.crdownload <- function(fileUrl,destdir, destfile, extension) {
        
        if (!file.exists(destdir)) {
                dir.create(destdir)
        }        
        
        destfilename <- paste("./",destdir,"/",destfile, sep = "")
        
        if (!file.exists(destfilename)) {
                
                download.file(fileUrl,destfilename)
                dateDownload <- date()
                dump(dateDownload, file =  gsub(x = destfilename,
                                                pattern = extension,
                                                replacement = ".R"))        
                
        } else {
                
                datefile <- gsub(destfilename,extension,".R")
                if(file.exists(datefile)) {
                        source(datefile)
                        print(paste("file",destfile, "downloaded", dateDownload))
                }
                
        }
        
        
}

## file.unpack is a function which unpacks a file into needed subdirectory
## and returns structure of folders and files in that directory after 
## unpacking to provide easier further processing using these files
## in list are only txt files
## parameters:
## filename - character. Name of packed file
## dir - character. Relative(to working directory) path to catalog in which
## file will be unpacked

file.unpack <- function(filename, dir) {
        
        if (!file.exists(dir)) {
                dir.create(dir)
        }    
        
        # unpzip file to created directory
        unzip(filename,exdir = dir)
        # without empty subdirectories
        list.files(unpackdir,recursive = TRUE)
        
}

## function file.getdfname gets a needed file name from list, using appropriate
## file name from the environment, kind of datafile(test or train) and list 
## of files
## parameters:
## loffiles - list(), contains file names that were found in unpack directory
## dir - character, unpack directory, to what zip file was unpacked
## kindofdataset - character, may be "test" or "train
file.getdfname <- function(loffiles,kindofdatafile, kindofdataset = "test") {
        
        if (!(kindofdataset %in% c("test","train"))) {
                stop(paste("wrong kind of dataset!",kindofdataset))
                return("")
        }
        searchpattern <- paste0("/",kindofdatafile,".txt")        
        searchresult <- loffiles[grep(pattern = searchpattern,loffiles)]
        if(length(searchresult) > 0)                 
                return(searchresult)
        
        searchpattern <- paste0("/",kindofdatafile,"_", kindofdataset, ".txt")
        return(loffiles[grep(pattern = searchpattern,loffiles)])
        
}

## function file.getworkname adds relative path (to the data directory) 
## to file name after getting it from the list
## parameters:
## dfname - character, name of data file (in unpacked folder), from the list
## dir - character, unpack directory, to where zip file was unpacked
## kindofdataset - character, may be "test" or "train"

file.getworkname <- function(dfname,dir,kindofdataset = "test") {
        
        fworkname <- paste0("./",
                            dir,
                            "/",
                            file.getdfname(loffiles,dfname,kindofdataset))
        
        fworkname
}

## function prepare_dataset reads needed files and combines data into a single 
## data table, for given data add to X needed data from other sources 
## activity labels, y, subject... uses names of needed data files from the
## environment. 
## parameters:
## kindofdataset - may be test or train in this case
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
        X <- cbind(X,subjects$V1)
        colnames(X)[length(colnames(X))] <- "subject"
        
        y <- read.table(file.getworkname(y_df,
                                         unpackdir,
                                         kindofdataset), 
                        stringsAsFactors = FALSE)
        
        # binding activity column to the left side of X data frame
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

# function get_cnames gets column names from result of function colnames()
# for a data frame which are in fixedcols parameter or found by using
# grep() function which takes patterns from bytemplatecols parameter
# parameters:
# df - data frame for select columns using function
# fixedcols - character vector containing column names to take anyway
# colpatterns - character vector containing patterns to select column names 

get_cnames <- function(df, fixedcols = character(), colpatterns = character()) {
        
        if(length(fixedcols) == 0 & length(colpatterns) == 0)
                return(as.character())
        
        dfcolnames <- colnames(df)
        cnames <- character()
        bypatternnames <- character()
        
        # for fixed cols it is very simple...
        for (i in fixedcols) {
                cnames <- c(cnames, i)
        }
        
        # for template cols first we need to union all result from grep patterns
        for (i in colpatterns) {
                colnames <- grep(i,dfcolnames,
                                 fixed = TRUE,value=TRUE) 
                bypatternnames <- union(bypatternnames, colnames)
        }
        
        # then, to prevent the order of columns being the same as in dataframe, 
        # add needed columns to cnames vector in cycle along colnames of df 
        for (i in dfcolnames){
                if (i %in% bypatternnames)
                        cnames <- c(cnames,i)
        }
        
        cnames 
        
}

###---------------------------main processing -------------------------------###

## set initial values for further processing with data files 

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

destdir      <- "data"
destfile     <- "HAR_Dataset.zip"
resultfile   <- "result_data.txt"
extension    <- ".zip"
unpackdir    <- paste0(destdir,"/","unpacked")
destfilename <- paste0("./",destdir,"/",destfile)


## download needed data and unpacking into a directory (unpackdir),getting files
file.crdownload(fileUrl,destdir, destfile, extension)
loffiles <- file.unpack(destfilename, unpackdir)

## Appropriated names of data files (.txt extension and test/train suffixes
## are omitted, we will add appropriate while processing data)
## Also used as parts of file names when passing to file.getdfname function
subject_df <- "subject"
activity_labels_df <-"activity_labels"
features_df <- "features"
X_df <- "X"
y_df <- "y"


## get test data and train data, make initial preparations before union of them
test_data <- prepare_dataset("test")
train_data <- prepare_dataset("train")

rm(loffiles)
## row binding test and train datasets into one large dataset
all_data <- rbind(test_data,train_data)
rm(test_data, train_data)

## subsetting, get only columns with mean() and std(), parsing names for do that
needed_cols <- get_cnames(all_data,c("subject","activity"),c("-mean()","-std()"))
all_data <- all_data[,c(needed_cols)]

## making a resulting dataset, to do that using power of data.table package
require(data.table)

all_data <- as.data.table(all_data)

## only data columns( without activity and subject), to summarize their values
needed_cols <- get_cnames(all_data,colpatterns = c("-mean()","-std()"))
result_data <- all_data[,
                        lapply(.SD, mean),
                        by = .(subject, activity),
                        .SDcols = needed_cols
                        ][order(subject,activity)]

## This line must be commented if it's needed to show data transformation knitting
## CodeBook.md file
rm(all_data)

## rename columns (and activity values) to make them more readable
setnames(result_data,colnames(result_data),sub(colnames(result_data),
                                               pattern = "^t",
                                               replacement = "time"))
setnames(result_data,colnames(result_data),sub(colnames(result_data),
                                               pattern = "^f",
                                               replacement = "fouriertransf"))
result_data$activity  <- sub(result_data$activity,
                             pattern = "_",
                             replacement = " ")

## write the result data table to csv file
write.table(result_data,
            file = paste0("./",destdir,"/",resultfile),
            sep = ",",
            row.name = FALSE)

print( paste0("result data set created as file result_data.txt in ",
              getwd(),
              "/",
              destdir,
              " directory"))
###--------------------------------------------------------------------------###