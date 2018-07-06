## Course Project: Getting and Cleaning Data
## Author: CAJasareno

## The following function will merge the test and train data from UCI Human Activity Recognition Using Smartphones Dataset, 
## and create a  final tidy dataset in the end.

## If you don't have yet the data needed for this function, please download first the data using download.file in this url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Note that you have to save/download this script where the "UCI HAR Dataset" is saved and change directory before you source this function
## Retain the sub-folders of train and test


run_analysis <- function() {

	## read data
	activity <- read.table("activity_labels.txt")                  ##dataset for activity labels
	features <- read.table("features.txt",stringsAsFactors=FALSE)  ##name of features
	xtest <- read.table("./test/X_test.txt")                       ##test data
	ytest <- read.table("./test/y_test.txt")                       ##test labels/activity
	subtest <- read.table("./test/subject_test.txt")               ##subject test data; identifies the subject who performs the activity in the test
	xtrain <- read.table("./train/X_train.txt")                    ##train data
	ytrain <- read.table("./train/y_train.txt")                    ##train labels/activity
	subtrain <- read.table("./train/subject_train.txt")            ##subject test data; identifies the subject who performs the activity in the test

	## make a list of feature names
	featnames <- features[,2]

	## assign column names of xtest and xtrain using featnames
	colnames(xtest) <- featnames
	colnames(xtrain) <- featnames

	## select features with name contains mean and/or std
	sel.featname <- grep("[Mm]ean|[Ss]td",features$V2,value=TRUE)

	## filter features in xtest and xtrain; will contain only the features with name contains mean and/or std
	xtest <- xtest[sel.featname]
	xtrain <- xtrain[sel.featname]

	## add column name in activity dataset for easier merging
	colnames(activity) <- c("activitycode","activityname")

	## rename column name of ytest and ytrain for easier merging
	colnames(ytest) <- c("activitycode")
	colnames(ytrain) <- c("activitycode")

	## add index in ytest and ytrain; needed for sorting
	ytest$index <- seq.int(nrow(ytest))
	ytrain$index <- seq.int(nrow(ytrain))

	## merge activity dataset to ytest and ytrain to add labels to the records/activity
	ytest2 <- merge(x=ytest, y=activity, by="activitycode")
	ytrain2 <- merge(x=ytrain, y=activity, by="activitycode")

	## sort ytest and ytrain by index to retain original form
	ytest <- ytest2[order(ytest2$index),]
	ytrain <- ytrain2[order(ytrain2$index),]		

	## rename column name of subtest and subtrain for easier merging
	colnames(subtest) <- c("subject")
	colnames(subtrain) <- c("subject")

	## merge all test datasets
	testdata <- cbind(subtest, ytest, xtest)
	
	## merge all train datasets
	traindata <- cbind(subtrain, ytrain, xtrain)
	
	## merge train and test datasets to create a table containing all records
	har.data <- rbind(testdata, traindata)
	har.data$index <- NULL  ##remove index column

	## substitute names of features for easier description
	var.names <- names(har.data)
	var.names <- sub("^t","time",var.names) ##for features with time domain signals
	var.names <- sub("^f","freq",var.names) ##for features with frequency domain signals
	colnames(har.data) <- var.names         ##other names of features were retained to avoid misnaming of features

	## create an independent tidy dataset by getting mean of each features group by "subject" and "activity"
	data.agg <- aggregate(har.data[4:89], by = list(har.data[,"activityname"],har.data[,"subject"]), FUN = function(x){mean(x,rm.na=TRUE)})

	## rename column names
	new_name <- paste("MeanOf_",names(data.agg),sep="")
	colnames(data.agg) <- new_name
	colnames(data.agg)[1] <- "activity"
	colnames(data.agg)[2] <- "subject"

	## final tidy dataset
	final.data <- data.agg[,c(2,1,3:ncol(data.agg))]	

	##return final dataset
	final.data 
}