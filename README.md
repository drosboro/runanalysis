Run Analysis
======================

"Getting and Cleaning Data" Course Project

Codebook
--------

This script uses the raw data found in `./UCI HAR Dataset/` and generates two tidy data sets: `tidy_data.txt` and `tidy_summary.txt`.  Descriptions of these two files can be found in `./CODEBOOK.md`.

Generating the Tidy Data Sets Yourself
--------------------------------------

To generate the data sets described in CODEBOOK.md, simply:

1. Clone this repository
2. Set your R working directory to your clone directory
3. Ensure that you have the `dplyr` package installed 
>    `install.packages("dplyr")`
4. Source the run_analysis.R file in R 
>    `source("run_analysis.R")`

Description of run_analysis.R
-----------------------------

The `run_analysis.R` script does the following actions to tidy the raw data:

1. loads all of the data files (except for the Inertial Signals files, which were unneeded for this analysis) into R objects
2. combines the data from the `train` and `test` directories
3. adds descriptive column labels (from the `features.txt` file in the raw data)
4. adds column with descriptions for each activity (from the `activity_labels.txt` file in the raw data)
4. discards the columns from the raw data which are not used in this analysis
5. combines the data from the various types of files (e.g. X, Y, and subject) into a single table
6. writes the combined table to file (`tidy_data.txt`)
7. creates a summary dataset by calculating for each numerical variable, grouped by `subject` and `activity`
8. writes the summary data set to file (`tidy_summary.txt`)

Comments in the `run_analysis.R` file mirror this description.
