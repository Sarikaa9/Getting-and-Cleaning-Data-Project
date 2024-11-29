# CodeBook

## Original Dataset
The original dataset was collected from accelerometers on the Samsung Galaxy S smartphone and is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Variables
- `Subject`: ID of the participant (integer, ranging from 1 to 30).
- `Activity`: Activity performed during data collection (e.g., "WALKING", "LAYING").
- Measurement Columns: Each column contains the average of a specific measurement for a combination of subject and activity. Examples include:
  - `tBodyAcc-mean()-X`: Average body acceleration mean in the X-axis.
  - `tGravityAcc-std()-Z`: Standard deviation of gravity acceleration in the Z-axis.

## Transformations
- Merged the training and test datasets into a single dataset.
- Extracted only the measurements for the mean and standard deviation.
- Applied descriptive activity names.
- Labeled the dataset with descriptive variable names.
- Created a tidy dataset with the average of each variable for each subject and activity.
