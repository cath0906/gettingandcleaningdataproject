## Introduction

This code book contains the methodology on how the tidy dataset (final_data.csv) was created as part of the course project of Getting and Cleaning Data of Johns Hopkins University module in Coursera.
Source of data was from the Human Activity Recognition Using Smartphones Dataset. Data was collected using Samsung Galaxy S smartphones.

It also attempts to describe the variables or data that were used as well as the variables of the resulting tidy dataset.


## Data Used from the Human Activity Recognition Using Smartphones Dataset 
**Referred from the README file available in UCI HAR Dataset.**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

**For each record it is provided:**

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

**Referred from the Feature Selection file available in UCI HAR Dataset**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
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

### Only the following datasets available were used in this course project:
- 'features.txt': List of all features. Contains 561 names of features
- 'activity_labels.txt': Links the class labels with their activity name. Contains 6 records of activities performed by the subjects
- 'train/X_train.txt': Training set. Contains the data collected from the training set.
- 'train/y_train.txt': Training labels. Contains the activities performed by the training set.
- 'test/X_test.txt': Test set. Contains the data collected from the test set.
- 'test/y_test.txt': Test labels. Contains the activities performed by the test set.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 



## Methodology on the creation of the final tidy dataset
**The following are the steps that were followed to comply with the requirements of the course project.**

### Step 1: Reading of text files
1.1 All the eight (8) datasets mentioned above were read using read.table function.
1.2 Dimensions of the eight (8) created data frames were checked to determine how all the data fit together to come up with a "complete" big dataset (train plus test datasets)

### Step 2: Cleaning of Column Names of Datasets 
2.1 It was a requirement in the project to extract only the measurements on the mean and standard deviation for each measurement in the "complete" dataset (item #2).
2.2 Before proceeding in the merging the create the "complete" dataset, column names were first filtered (for datasets containing the measurements) or renamed for easier merging.
2.3 Column names of X_train and X_test datasets were assigned using features.txt file. Then the column names containing "mean" or "std" were filtered using grep function.
2.4 Columns of activity_labels were renamed "activitycode" and "activityname"
2.5 Columns of y_test and y_train were renamed "activitycode". An index column was also to the datasets that will be used later in the merging with activity_labels.
2.6 Columns of subject_train and subject_test were renamed "subject"

### Step 3: Merge activity_labels with y_train and y_test
3.1 Another requirement in the course project is to use descriptive activity names to name the activities in the dataset. 
3.1 Using merge function, description of the activities inside y_train and y_test was obtained (via "activitycode" column)
3.2 After merging, y_train and y_test were sorted using index column to retain the original format of the datasets

### Step 4: Merge all datasets to create "complete" dataset
4.1 Now that all the datasets are clean, merging will now proceed.
4.2 Combine first all train datasets using cbind function: subject_train first, followed by y_train and then x_train
4.3 Next is to combine all test datasets using again the cbind function: subject_test first, followed by y_test and then x_test
4.4 Now that all the train and test datasets are combined, append train and test datasets using rbind function

### Step 5: Substitute names of features for easier description
5.1 It is also required to appropriately labels the dataset with descriptive variable names.
5.2 Using sub function, features with time domain signals, not included the estimated features, (starts with "t") were changed to "time".
5.3 Using sub function, features with frequency domain signals, not included the estimated features, (starts with "f") were changed to "freq".
5.4 Note that other names of features were retained to avoid misnaming of features

### Step 6: Create a tidy dataset with average a each variable for each "activity" and "subject"
6.1 From the cleaned "complete" dataset created from Steps 1-4, mean/average of all the features group by "activity" and "subject" was done using the aggregate function
6.2 The final tidy dataset contains 180 records (30 subjects by 6 activities) and 88 columns (86 mean of features including "subject" and "activity" columns)
6.3 Note that to separate it from the "complete" dataset from Step 5, all the names of the features of the tidy dataset were added with "MeanOf" at the start.



## Final Output: Tidy Dataset
The final tidy dataset is the combination of the test and training datasets, which only contains features with names containing either "mean" or "std". 
From the combination of training and test datasets called "complete" dataset, every subject (30 of them) performed six (6) activities. And the mean of those measurements/features were calculated. 
The output dataset contains 180 rows (30 subjects x 6 activities), and 88 columns (86 mean of features including "subject" and "activity" columns).

All features whose means were calculated were added with *"MeanOf"* at the start of the name. Since the mean was calculated for all the features, their units are the units of their parent variables - so please refer to the above section.

**Columns available in the final tidy dataset**


subject: Integer, representing 1 of 30 test subjects.

activity: Character, representing 1 of 6 different activities performed by the subject.

MeanOf_tBodyAcc-mean()-X

MeanOf_tBodyAcc-mean()-Y

MeanOf_tBodyAcc-mean()-Z

MeanOf_tBodyAcc-std()-X

MeanOf_tBodyAcc-std()-Y

MeanOf_tBodyAcc-std()-Z

MeanOf_tGravityAcc-mean()-X

MeanOf_tGravityAcc-mean()-Y

MeanOf_tGravityAcc-mean()-Z

MeanOf_tGravityAcc-std()-X

MeanOf_tGravityAcc-std()-Y

MeanOf_tGravityAcc-std()-Z

MeanOf_tBodyAccJerk-mean()-X

MeanOf_tBodyAccJerk-mean()-Y

MeanOf_tBodyAccJerk-mean()-Z

MeanOf_tBodyAccJerk-std()-X

MeanOf_tBodyAccJerk-std()-Y

MeanOf_tBodyAccJerk-std()-Z

MeanOf_tBodyGyro-mean()-X

MeanOf_tBodyGyro-mean()-Y

MeanOf_tBodyGyro-mean()-Z

MeanOf_tBodyGyro-std()-X

MeanOf_tBodyGyro-std()-Y

MeanOf_tBodyGyro-std()-Z

MeanOf_tBodyGyroJerk-mean()-X

MeanOf_tBodyGyroJerk-mean()-Y

MeanOf_tBodyGyroJerk-mean()-Z

MeanOf_tBodyGyroJerk-std()-X

MeanOf_tBodyGyroJerk-std()-Y

MeanOf_tBodyGyroJerk-std()-Z

MeanOf_tBodyAccMag-mean()

MeanOf_tBodyAccMag-std()

MeanOf_tGravityAccMag-mean()

MeanOf_tGravityAccMag-std()

MeanOf_tBodyAccJerkMag-mean()

MeanOf_tBodyAccJerkMag-std()

MeanOf_tBodyGyroMag-mean()

MeanOf_tBodyGyroMag-std()

MeanOf_tBodyGyroJerkMag-mean()

MeanOf_tBodyGyroJerkMag-std()

MeanOf_fBodyAcc-mean()-X

MeanOf_fBodyAcc-mean()-Y

MeanOf_fBodyAcc-mean()-Z

MeanOf_fBodyAcc-std()-X

MeanOf_fBodyAcc-std()-Y

MeanOf_fBodyAcc-std()-Z

MeanOf_fBodyAcc-meanFreq()-X

MeanOf_fBodyAcc-meanFreq()-Y

MeanOf_fBodyAcc-meanFreq()-Z

MeanOf_fBodyAccJerk-mean()-X

MeanOf_fBodyAccJerk-mean()-Y

MeanOf_fBodyAccJerk-mean()-Z

MeanOf_fBodyAccJerk-std()-X

MeanOf_fBodyAccJerk-std()-Y

MeanOf_fBodyAccJerk-std()-Z

MeanOf_fBodyAccJerk-meanFreq()-X

MeanOf_fBodyAccJerk-meanFreq()-Y

MeanOf_fBodyAccJerk-meanFreq()-Z

MeanOf_fBodyGyro-mean()-X

MeanOf_fBodyGyro-mean()-Y

MeanOf_fBodyGyro-mean()-Z

MeanOf_fBodyGyro-std()-X

MeanOf_fBodyGyro-std()-Y

MeanOf_fBodyGyro-std()-Z

MeanOf_fBodyGyro-meanFreq()-X

MeanOf_fBodyGyro-meanFreq()-Y

MeanOf_fBodyGyro-meanFreq()-Z

MeanOf_fBodyAccMag-mean()

MeanOf_fBodyAccMag-std()

MeanOf_fBodyAccMag-meanFreq()

MeanOf_fBodyBodyAccJerkMag-mean()

MeanOf_fBodyBodyAccJerkMag-std()

MeanOf_fBodyBodyAccJerkMag-meanFreq()

MeanOf_fBodyBodyGyroMag-mean()

MeanOf_fBodyBodyGyroMag-std()

MeanOf_fBodyBodyGyroMag-meanFreq()

MeanOf_fBodyBodyGyroJerkMag-mean()

MeanOf_fBodyBodyGyroJerkMag-std()

MeanOf_fBodyBodyGyroJerkMag-meanFreq()

MeanOf_angle(tBodyAccMean,gravity)

MeanOf_angle(tBodyAccJerkMean),gravityMean)

MeanOf_angle(tBodyGyroMean,gravityMean)

MeanOf_angle(tBodyGyroJerkMean,gravityMean)

MeanOf_angle(X,gravityMean)

MeanOf_angle(Y,gravityMean)

MeanOf_angle(Z,gravityMean)


*The whole process of creating the tidy dataset from the UCI HAR datasets was coded and documented in run_analysis.R script.*


*The script will export the final tidy dataset in your working directory in a text file format (final_tidy_data.txt)*
