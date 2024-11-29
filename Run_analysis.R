# Load required library
library(dplyr)

# Set file location
data_dir <- "C:/Users/HP/Downloads/UCI HAR Dataset"

# Load feature and activity labels
features <- read.table(file.path(data_dir, "features.txt"), col.names = c("index", "feature"))
activities <- read.table(file.path(data_dir, "activity_labels.txt"), col.names = c("id", "activity"))

# Extract mean and standard deviation features
mean_std_features <- grep("-(mean|std)\\(\\)", features$feature)
selected_features <- features[mean_std_features, 2]

# Load and combine training and test datasets
x_train <- read.table(file.path(data_dir, "train", "X_train.txt"))
y_train <- read.table(file.path(data_dir, "train", "y_train.txt"))
subject_train <- read.table(file.path(data_dir, "train", "subject_train.txt"))

x_test <- read.table(file.path(data_dir, "test", "X_test.txt"))
y_test <- read.table(file.path(data_dir, "test", "y_test.txt"))
subject_test <- read.table(file.path(data_dir, "test", "subject_test.txt"))

# Merge data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Subset data for mean and standard deviation
x_data <- x_data[, mean_std_features]
colnames(x_data) <- selected_features

# Apply descriptive activity names
y_data[, 1] <- activities[y_data[, 1], 2]
colnames(y_data) <- "Activity"

# Label subject data
colnames(subject_data) <- "Subject"

# Combine all data
complete_data <- cbind(subject_data, y_data, x_data)

# Create a tidy dataset with the average of each variable for each activity and subject
tidy_data <- complete_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

# Write tidy data to a file
write.table(tidy_data, file.path(data_dir, "tidy_dataset.txt"), row.name = FALSE)

# Print completion message
cat("Tidy dataset created and saved as 'tidy_dataset.txt' in the dataset directory.")
