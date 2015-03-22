## Getting and Cleaning Data - Course Project
##### Last Updated: *2015-03-21*

### Overview
The purpose of this course project is defined on the [*Getting and Cleaning Data* course assignment page](https://class.coursera.org/getdata-012/human_grading/view/courses/973499/assessments/3) as follows: 

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

As such, this project is composed of the following items: 
    1. `AverageActivity.txt` - A tidy data set resulting from the analysis
    2. `run_analysis.R` - The R script leveraged to generate the tidy data set from the input data. 
    3. `CodeBook.md` - Describes the variables, the data, and transformations to create the resulting data set
    4. `README.md` (this) file, describing the contents of the Getting and Cleaning Data Course Project. 

All of the above files are hosted on GitHub, [here](!!!! GITHUB LINK HERE !!!!). 

### Usage
* Download project files noted above to working directory. 
* Downloadand/unzip the input data to `data` sub-directory in working directory as indicated in [Initial Conditions]. 
* To generate `AverageActivity.txt` in working directory, execute the following: 
```r
source("run_analysis.R")
```

* To load an already-generated `AverageActivity.txt` into R (assumes file in working directory):  

```r
library(plyr)
avgActivity <- tbl_df(read.table("AverageActivity.txt"))
```

### Background
The [input data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) initially consisted of 561 attributes across 10299 multivariate, time-series instances. Note that the data-set-indicated attribute names can be found alongside the downloaded dataset in `features.txt` (part of the original data download, and not part of this analysis package - please see the `README.txt` file in the input data download for additional information). 

### Initial Conditions
For the purposes of this analysis, the compressed datafile containing the [input data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) has been extracted to a `data` sub-directory so that the directory structure is as follows: 

* /*Working Directory*
    - `README.md` (this file)
    - `CodeBook.md`
    - `run_analysis.R`
    - /`data` (containing the input data)
        + `activity_labels.txt`
        + `features.txt`
        + `features_info.txt`
        + `README.txt`
        + /`test`
            * `subject_test.txt`
            * `X_test.txt`
            * `y_test.txt`
        + /`train`
            * `subject_train.txt`
            * `X_train.txt`
            * `y_train.txt`


### Notes
* The author has extensive experience with databases - this was the primary driving reason for leveraging the [`dplyr`/`tidyr`](http://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf) packages so heavily. 
* Much credit and thanks to David Hood for his [excellent thread](https://class.coursera.org/getdata-012/forum/thread?thread_id=9) containing insight into this project. 
* Please see the individual files for additional details on the data manipulation and resulting fields. 

### Data Citation
Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.

