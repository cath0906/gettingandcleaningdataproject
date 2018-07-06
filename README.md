###Getting and Cleaning Data Course Project
*Author: CAJasareno*

This repo contains the requirements in the final project of Getting and Cleaning Data module of Johns Hopkins University in Coursera. 
The project aims to assess the understanding of the students on how to work with different types of data, how to collect those data and
how to effectively clean the collected data for easier use.


##Instructions for the Project (as posted in Coursera)

**An R script (called run_analysis.R) will be created which will do the following:**
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**The project will be reviewed (via peer review) based on the following criteria:**
1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.


###Data Source: UCI Human Activity Recognition
The data that was used to complete this project came from the UCI Human Activity Recognition Using Smartphones Data Set.
Available data from this source was collected by recording the activities of daily living (ADL) of 30 subjects with waist-mounted smartphone embedded with inertial sensors.
Further information regarding the data source can be found in this link: *http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones*


###run_analysis.R
As part of the requirements, run_analysis.R script was created to clean the provided data which will be used for later analysis.
The script should be saved or downloaded in the folder where the UCI HAR Dataset folder is saved for it run correctly.

After running the source function to call run_analysis, just run the code below to get the final tidy dataset:
>run_analysis()

The function run_analysis will output the final tidy dataset in the form of a dataframe.

*Notes:*
*The methodology on how the datasets were merged and cleaned is available in the code book.*
*In-depth description of the UCI HAR Dataset is also documented in the code book*