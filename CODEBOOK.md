Codebook
========

Study Design
------------

_NOTE: this section is taken directly from the readme contained in the raw data (`./UCI HAR Dataset/README.txt`).  It is based on Anquita, et al (2012)_ [1]

> "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details."

Data Description
----------------

There are two datasets created in this analysis.  The first (`tidy_data.txt`) is a tidied subset of the raw data gathered by Anquita, et al (2012).  The second (`tidy_summary.txt`) records the averages for each variable, by `subject` (participant id) and `activity`.

The datasets contain a subset of the 561 variables measured in the original dataset.  The complete set of variables are described in the original dataset (`./UCI HAR Dataset/features_info.txt`).  The following descriptions are a quote from that document:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> * tBodyAcc-XYZ
> * tGravityAcc-XYZ
> * tBodyAccJerk-XYZ
> * tBodyGyro-XYZ
> * tBodyGyroJerk-XYZ
> * tBodyAccMag
> * tGravityAccMag
> * tBodyAccJerkMag
> * tBodyGyroMag
> * tBodyGyroJerkMag
> * fBodyAcc-XYZ
> * fBodyAccJerk-XYZ
> * fBodyGyro-XYZ
> * fBodyAccMag
> * fBodyAccJerkMag
> * fBodyGyroMag * 
> * fBodyGyroJerkMag

In the original data set, a variety of calculations were performed on the raw data.  In our subset, we only retained the `mean` and `std` (standard deviation) calculations.  Therefore, for each of the above variables, there is a column in our data set for `mean` and one for `std`.  For example, 

* tBodyAcc-mean()-X
* tBodyAcc-std()-X

represent the mean and standard deviation, respectively, of the body acceleration in the X direction.

The rows in the tidy data sets are indexed by `subject` (the number assigned to the volunteer) and `activity_name`, one of the six activities described above (e.g. WALKING, WALKING_UPSTAIRS, and so on).  In `tidy_data.txt`, each row represents a calculated mean or standard deviation for each measurement type, over a specified window of time.  In `tidy_summary.txt`, each row represents the mean of all calculations (mean or standard deviation) for that particular subject and activity - so there is exactly one row for each subject-activity pair.

References
----------

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012