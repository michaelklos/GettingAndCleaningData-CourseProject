## Getting and Cleaning Data - Course Project
##### Last Updated: *2015-03-21*

This file describes the variables, the data, and transformations used to develop the output data set. 

### Initial Setup
The following files were necessary to assemble the initial variables from the *test* and *train* data sets (variable data sources indicated as `variable` <- `fileName`):

* `test.core <- X_test.txt`/ `train.core <- X_train.txt` - Core data set, containing readings across all 561 variables. 
* `test.type <- y_test.txt`/`train.type <- y_train.txt` - The actual test being performed (noted in the original data's `activity_labels.txt`)
* `test.subject <- subject_test.txt`/`train.subject <- subject_train.txt` - The subject (identified by a number, 1-30) who performed a given test

Further, it was necessary to pull in additional data to add back some of the detail that was normalized away: 

* `features <- features.txt` - Contains the column names for all 561 observations. 
* `activities <- activity_labels.txt` - Contains the type of activity indicated in the `y_test.txt`/`y_train.txt` files. 

### Data Transformation Steps
The following steps were performed on the above variables: 

* Add column names manually to `activities`, `test.type`/`train.type`, and `test.subject`/`train.subject`
* Using new column names, insert activity type from `activities` into `test.type`/`train.type`
* Add column names from `features` to `test.core` and `train.core`
* Combine `test.core`, `test.type`, and `test.subject` into a single `test` variable. 
    - Same for the `trial.*` variables to form the `trial` variable
* Combine `test` and `trial` variables, resulting in full dataset, `fullSet`. 
* From `fullSet`, keep only those columns that contain the mean (`mean()` in the column name) or standard deviation (`std()` in the column name). This approach was based on a review of the source `features_info.txt` file. 

### Variables
For the 66 variables in the final dataset, there are a few notes that make interpretation of the variable names more straightforward. 

* Time Domain Signals are denoted with `Time`, Frequency Domain Signals are denoted with `Frequency`
* The type of variable - is indicated in the variable name by `Mean` or `Std Dev` 
* All variables appear 3 times, one for each axis of movement. This is denoted in the variable name as `X Axis`, `Y Axis`, or `Z Axis`. 

* **Definitions**: 
    + `subject` - Identifer (numeric, 1:30) of the subject performing the test
    + `activity` - Type of activity being performed
    + `Time.Body_Acceleration.Mean().X` - Time Domain Signal, Body Acceleration Variable, Mean Calculation, X Axis
    + `Time.Body_Acceleration.Mean().Y` - Time Domain Signal, Body Acceleration Variable, Mean Calculation, Y Axis
    + `Time.Body_Acceleration.Mean().Z` - Time Domain Signal, Body Acceleration Variable, Mean Calculation, Z Axis
    + `Time.Gravity_Acceleration.Mean().X` - Time Domain Signal, Gravity Acceleration Variable, Mean Calculation, X Axis
    + `Time.Gravity_Acceleration.Mean().Y` - Time Domain Signal, Gravity Acceleration Variable, Mean Calculation, Y Axis
    + `Time.Gravity_Acceleration.Mean().Z` - Time Domain Signal, Gravity Acceleration Variable, Mean Calculation, Z Axis
    + `Time.Body_AccelerationJerk.Mean().X` - Time Domain Signal, Body Acceleration Jerk Variable, Mean Calculation, X Axis
    + `Time.Body_AccelerationJerk.Mean().Y` - Time Domain Signal, Body Acceleration Jerk Variable, Mean Calculation, Y Axis
    + `Time.Body_AccelerationJerk.Mean().Z` - Time Domain Signal, Body Acceleration Jerk Variable, Mean Calculation, Z Axis
    + `Time.Body_Gyroscopic.Mean().X` - Time Domain Signal, Body Gyroscopic Variable, Mean Calculation, X Axis
    + `Time.Body_Gyroscopic.Mean().Y` - Time Domain Signal, Body Gyroscopic Variable, Mean Calculation, Y Axis
    + `Time.Body_Gyroscopic.Mean().Z` - Time Domain Signal, Body Gyroscopic Variable, Mean Calculation, Z Axis
    + `Time.Body_GyroscopicJerk.Mean().X` - Time Domain Signal, Body Gyroscopic Jerk Variable, Mean Calculation, X Axis
    + `Time.Body_GyroscopicJerk.Mean().Y` - Time Domain Signal, Body Gyroscopic Jerk Variable, Mean Calculation, Y Axis
    + `Time.Body_GyroscopicJerk.Mean().Z` - Time Domain Signal, Body Gyroscopic Jerk Variable, Mean Calculation, Z Axis
    + `Time.Body_AccelerationMag.Mean()` - Time Domain Signal, Body Acceleration Magnitude Variable, Mean Calculation
    + `Time.Gravity_AccelerationMag.Mean()` - Time Domain Signal, Gravity Acceleration Magnitude Variable, Mean Calculation
    + `Time.Body_AccelerationJerkMag.Mean()` - Time Domain Signal, Body Acceleration Jerk Magnitude Variable, Mean Calculation
    + `Time.Body_GyroscopicMag.Mean()` - Time Domain Signal, Body Gyroscopic Magnitude Variable, Mean Calculation
    + `Time.Body_GyroscopicJerkMag.Mean()` - Time Domain Signal, Body Gyroscopic Jerk Magnitude Variable, Mean Calculation
    + `Frequency.Body_Acceleration.Mean().X` - Frequency Domain Signal, Body Acceleration Variable, Mean Calculation, X Axis
    + `Frequency.Body_Acceleration.Mean().Y` - Frequency Domain Signal, Body Acceleration Variable, Mean Calculation, Y Axis
    + `Frequency.Body_Acceleration.Mean().Z` - Frequency Domain Signal, Body Acceleration Variable, Mean Calculation, Z Axis
    + `Frequency.Body_AccelerationJerk.Mean().X` - Frequency Domain Signal, Body Acceleration Variable, Mean Calculation, X Axis
    + `Frequency.Body_AccelerationJerk.Mean().Y` - Frequency Domain Signal, Body Acceleration Jerk Variable, Mean Calculation, Y Axis
    + `Frequency.Body_AccelerationJerk.Mean().Z` - Frequency Domain Signal, Body Acceleration Jerk Variable, Mean Calculation, Z Axis
    + `Frequency.Body_Gyroscopic.Mean().X` - Frequency Domain Signal, Body Gyroscopic Variable, Mean Calculation, X Axis
    + `Frequency.Body_Gyroscopic.Mean().Y` - Frequency Domain Signal, Body Gyroscopic Variable, Mean Calculation, Y Axis
    + `Frequency.Body_Gyroscopic.Mean().Z` - Frequency Domain Signal, Body Gyroscopic Variable, Mean Calculation, Z Axis
    + `Frequency.Body_AccelerationMag.Mean()` - Frequency Domain Signal, Body Acceleration Magnitude Variable, Mean Calculation
    + `Frequency.Body_Body_AccelerationJerkMag.Mean()` - Frequency Domain Signal, Body Body Acceleration Jerk Magnitude Variable, Mean Calculation
    + `Frequency.Body_Body_GyroscopicMag.Mean()` - Frequency Domain Signal, Body Body Gyroscopic Magnitude Variable, Mean Calculation
    + `Frequency.Body_Body_GyroscopicJerkMag.Mean()` - Frequency Domain Signal, Body Body Gyroscopic Jerk Magnitude Variable, Mean Calculation
    + `Time.Body_Acceleration.Std_Dev().X` - Time Domain Signal, Body Acceleration Variable, Standard Deviation Calculation, X Axis
    + `Time.Body_Acceleration.Std_Dev().Y` - Time Domain Signal, Body Acceleration Variable, Standard Deviation Calculation, Y Axis
    + `Time.Body_Acceleration.Std_Dev().Z` - Time Domain Signal, Body Acceleration Variable, Standard Deviation Calculation, Z Axis
    + `Time.Gravity_Acceleration.Std_Dev().X` - Time Domain Signal, Gravity Acceleration Variable, Standard Deviation Calculation, X Axis
    + `Time.Gravity_Acceleration.Std_Dev().Y` - Time Domain Signal, Gravity Acceleration Variable, Standard Deviation Calculation, Y Axis
    + `Time.Gravity_Acceleration.Std_Dev().Z` - Time Domain Signal, Gravity Acceleration Variable, Standard Deviation Calculation, Z Axis
    + `Time.Body_AccelerationJerk.Std_Dev().X` - Time Domain Signal, Body Acceleration Jerk Variable, Standard Deviation Calculation, X Axis
    + `Time.Body_AccelerationJerk.Std_Dev().Y` - Time Domain Signal, Body Acceleration Jerk Variable, Standard Deviation Calculation, Y Axis
    + `Time.Body_AccelerationJerk.Std_Dev().Z` - Time Domain Signal, Body Acceleration Jerk Variable, Standard Deviation Calculation, Z Axis
    + `Time.Body_Gyroscopic.Std_Dev().X` - Time Domain Signal, Body Gyroscopic Variable, Standard Deviation Calculation, X Axis
    + `Time.Body_Gyroscopic.Std_Dev().Y` - Time Domain Signal, Body Gyroscopic Variable, Standard Deviation Calculation, Y Axis
    + `Time.Body_Gyroscopic.Std_Dev().Z` - Time Domain Signal, Body Gyroscopic Variable, Standard Deviation Calculation, Z Axis
    + `Time.Body_GyroscopicJerk.Std_Dev().X` - Time Domain Signal, Body Gyroscopic Jerk Variable, Standard Deviation Calculation, X Axis
    + `Time.Body_GyroscopicJerk.Std_Dev().Y` - Time Domain Signal, Body Gyroscopic Jerk Variable, Standard Deviation Calculation, Y Axis
    + `Time.Body_GyroscopicJerk.Std_Dev().Z` - Time Domain Signal, Body Gyroscopic Jerk Variable, Standard Deviation Calculation, Z Axis
    + `Time.Body_AccelerationMag.Std_Dev()` - Time Domain Signal, Body Acceleration Magnitude Variable, Standard Deviation Calculation
    + `Time.Gravity_AccelerationMag.Std_Dev()` - Time Domain Signal, Gravity Acceleration Magnitude Variable, Standard Deviation Calculation
    + `Time.Body_AccelerationJerkMag.Std_Dev()` - Time Domain Signal, Body Acceleration Jerk Magnitude Variable, Standard Deviation Calculation
    + `Time.Body_GyroscopicMag.Std_Dev()` - Time Domain Signal, Body Gyroscopic Magnitude Variable, Standard Deviation Calculation
    + `Time.Body_GyroscopicJerkMag.Std_Dev()` - Time Domain Signal, Body Gyroscopic Jerk Magnitude Variable, Standard Deviation Calculation
    + `Frequency.Body_Acceleration.Std_Dev().X` - Frequency Domain Signal, Body Acceleration Variable, Standard Deviation Calculation, X Axis
    + `Frequency.Body_Acceleration.Std_Dev().Y` - Frequency Domain Signal, Body Acceleration Variable, Standard Deviation Calculation, Y Axis
    + `Frequency.Body_Acceleration.Std_Dev().Z` - Frequency Domain Signal, Body Acceleration Variable, Standard Deviation Calculation, Z Axis
    + `Frequency.Body_AccelerationJerk.Std_Dev().X` - Frequency Domain Signal, Body Acceleration Jerk Variable, Standard Deviation Calculation, X Axis
    + `Frequency.Body_AccelerationJerk.Std_Dev().Y` - Frequency Domain Signal, Body Acceleration Jerk Variable, Standard Deviation Calculation, Y Axis
    + `Frequency.Body_AccelerationJerk.Std_Dev().Z` - Frequency Domain Signal, Body Acceleration Jerk Variable, Standard Deviation Calculation, Z Axis
    + `Frequency.Body_Gyroscopic.Std_Dev().X` - Frequency Domain Signal, Body Gyroscopic Variable, Standard Deviation Calculation, X Axis
    + `Frequency.Body_Gyroscopic.Std_Dev().Y` - Frequency Domain Signal, Body Gyroscopic Variable, Standard Deviation Calculation, Y Axis
    + `Frequency.Body_Gyroscopic.Std_Dev().Z` - Frequency Domain Signal, Body Gyroscopic Variable, Standard Deviation Calculation, Z Axis
    + `Frequency.Body_AccelerationMag.Std_Dev()` - Frequency Domain Signal, Body Acceleration Magnitude Variable, Standard Deviation Calculation
    + `Frequency.Body_Body_AccelerationJerkMag.Std_Dev()` - Frequency Domain Signal, Body Body Acceleration Jerk Magnitude Variable, Standard Deviation Calculation
    + `Frequency.Body_Body_GyroscopicMag.Std_Dev()` - Frequency Domain Signal, Body Body Gyroscopic Magnitude Variable, Standard Deviation Calculation
    + `Frequency.Body_Body_GyroscopicJerkMag.Std_Dev()` - Frequency Domain Signal, Body Body Gyroscopic Jerk Magnitude Variable, Standard Deviation Calculation