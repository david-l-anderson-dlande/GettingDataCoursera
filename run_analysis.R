## We will use the dplyr package; this checks for it and, if necessary,
## installs it automatically.
if(!require(dplyr)) {
    install.packages("dplyr"); require(dplyr)}
library(dplyr)



### read appropriate labels in from source
feature_vec <- read.table("./UCI HAR Dataset/features.txt",
                          col.names = c("featurenum", "featurename"))

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                              col.names = c("activitynum", "activityname"))



### read in the data from the test subjects folder
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                            col.names = c("subjectid"))

test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt",
                              col.names = c("activitynum"))

#plus get the names of the activities an a dataframe of right size
test_activities <- mutate(test_activities,
                        activityname =
                        activity_labels[test_activities$activitynum,2])

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt",
                        col.names = as.vector(feature_vec$featurename))




### same as for test folder, above
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.names = c("subjectid"))

train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt",
                              col.names = c("activitynum"))

train_activities <- mutate(train_activities,
                          activityname =
                              activity_labels[train_activities$activitynum,2])

train_data <- read.table("./UCI HAR Dataset/train/X_train.txt",
                        col.names = as.vector(feature_vec$featurename))



### use rbind to create the dataframes with all of the data
all_data <- rbind(test_data, train_data)
all_activities <- rbind(test_activities, train_activities)
all_subjects <- rbind(test_subjects, train_subjects)


### however, we only need the mean and standard deviation columns
meanstd_collist <- grep("mean\\.|std", names(all_data), value = TRUE)
final_data <- all_data[, meanstd_collist]


### tack on the activityname and subjectid columns
final_data$activityname <- all_activities$activityname
final_data$subjectid <- as.factor(all_subjects[,1])


### make the column names pretty
colnames(final_data) <- tolower(colnames(final_data))
colnames(final_data) <- gsub("\\.", "", colnames(final_data))
colnames(final_data) <- gsub("^t", "time", colnames(final_data))
colnames(final_data) <- gsub("^f", "fftof", colnames(final_data))



### clean up junk we no longer need
rm("all_activities", "all_subjects", "test_activities", "test_data",
 "test_subjects", "train_activities", "train_data", "train_subjects",
 "feature_vec", "meanstd_collist", "all_data")


### make the groupings, summarize, print to text file
tidy_data <- group_by(final_data, activityname, subjectid)

final_tidy_data <- summarise_each(tidy_data, funs(mean))

write.table(final_tidy_data, file = "finaltidydata.txt")


