library(dplyr)

# Working directory should contain subdir, which is the unzipped data set
subdir <- "UCI HAR Dataset"

# Load all data files
subject_test_file <- paste(subdir, "test/subject_test.txt", sep="/")
subject_train_file <- paste(subdir, "train/subject_train.txt", sep="/")
x_test_file <- paste(subdir, "test/X_test.txt", sep="/")
x_train_file <- paste(subdir, "train/X_train.txt", sep="/")
y_test_file <- paste(subdir, "test/Y_test.txt", sep="/")
y_train_file <- paste(subdir, "train/Y_train.txt", sep="/")
features_file <- paste(subdir, "features.txt", sep="/")
activity_file <- paste(subdir, "activity_labels.txt", sep="/")

subject_test <- read.table(subject_test_file)
subject_train <- read.table(subject_train_file)
x_test <- read.table(x_test_file)
x_train <- read.table(x_train_file)
y_test <- read.table(y_test_file)
y_train <- read.table(y_train_file)
features <- read.table(features_file)
activities <- read.table(activity_file)

# Combine test and train data into single objects
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
subject_data <- rbind(subject_test, subject_train)

# Add descriptive column labels
names(y_data) <- c("activity_label")
names(subject_data) <- c("subject")
names(x_data) <- features$V2

# Add "activity_name" column to data, with descriptive activity name from activities.txt
for (i in seq_len(nrow(y_data))) {
  y_data$activity_name[i] <- as.character(factor(activities$V2[y_data$activity_label[i]]))
}

# Only keep mean and sd columns for each measurement
cols_to_keep <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)
x_subset <- x_data[, cols_to_keep]

# Create master dataset
dataset <- cbind(subject_data, y_data, x_subset)

# Free up memory by getting rid of temporary objects
rm(features, activities, subject_data, subject_test, subject_train, x_data, x_test, x_train, x_subset, y_data, y_test, y_train)

# Write dataset to disk
write.table(dataset, "tidy_data.txt", row.name=FALSE)

# Create summary data using dplyr
summary_dataset <- group_by(dataset, subject, activity_name) %>% summarise_each(funs(mean), -activity_label)

# Write summary dataset to disk
write.table(summary_dataset, "tidy_summary.txt", row.name=FALSE)