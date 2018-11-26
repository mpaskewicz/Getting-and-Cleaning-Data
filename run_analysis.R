# Download and unzip data files

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
path <- getwd()
download.file(url, path, mode = "wb")
unzip("dataset.zip")

# Load activity labels & features for measures of mean and standard deviation

activity_labels <- fread(file.path(path, "UCI HAR Dataset/activity_labels.txt"),col.names = c("classlabel", "activityname"))
features <- fread(file.path(path, "UCI HAR Dataset/features.txt"),col.names = c("index", "featurename"))
features_sorted <- grep("(mean|std)\\(\\)", features[, featurename])
measures <- features[features_sorted,featurename]
measures <- gsub('[()]', "", measures)

# Load the training & testing datasets

train <- fread(file.path(path, "UCI HAR Dataset/train/X_train.txt"))[,featuressorted, with = FALSE]
data.table::setnames(train, colnames(train), measures)
train_activities <- fread(file.path(path, "UCI HAR Dataset/train/Y_train.txt"), col.names = "activity")
train_subjects <- fread(file.path(path, "UCI HAR Dataset/train/subject_train.txt"), col.names = "subjectID")
train <- cbind(train_subjects, train_activities, train)

test <- fread(file.path(path, "UCI HAR Dataset/test/X_test.txt")[,featuressorted, with = FALSE]
data.table::setnames(test, colnames(train), measures)
test_activities <- fread(file.path(path, "UCI HAR Dataset/test/Y_test.txt"), col.names = "activity")
test_subjects <- fread(file.path(path, "UCI HAR Dataset/test/subject_test.txt"), col.names = "subjectID")
test <- cbind(test_subjects, test_activities, test)

# Merge training and testing data

combined <- rbind(train, test)

# Provide more descriptive labels activity column

combined[["activity"]] <- factor(combined[, activity], levels = activity_labels[["classlabel"]], labels = activity_labels[["activityname"]])
combined[["subjectID"]] <- as.factor(combined[, subjectID])

# Aggregate means to reduce redundancy of observations

combined <- reshape2::melt(data = combined, id = c("subjectID", "activity"))
combined <- reshape2::melt(data = combined, id = c("subjectID", "activity"))

# Create final tidy data file

data.table::fwrite(x = combined, file = "tidy_data.txt", quote = FALSE)

