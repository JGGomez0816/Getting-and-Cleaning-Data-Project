

run_anaysis_mean

BACKGROUND:

RAW DATA: downloaded zip file from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Extracted zip file to "C:/Users/jggomez/Desktop/Data Science"
Folder Name: UCI HAR Dataset

Description of contents of “UCI HAR Dataset” is available in README.md in the same folder.

The assignment wants to create an independent tidy data set with the average of each variable or feature in merged test and train data sets for each activity and subject.

Descriptive names of feature vectors are available in features.txt in “UCI HAR Dataset”
Descriptive names of activities are available in activity_labels.txt in “UCI HAR Dataset”
Subjects were tagged as 1 to 30 to identify volunteers who performed the activities

CODEBOOK:

Column 1 of subject and Y data sets for both train and test were renamed into “subject” and “activityLabel” for easy reading and to prevent errors in binding data frames in the later code since all tables have “V1” column but pertaining to different descriptions.

Test data was obtained by merging subject, activity labels, and test data sets corresponding to test

Train data was obtained by merging subject, activity labels, and train data sets corresponding to train

NUMBER 1: Merge the train and the test data sets to create one data set 

Test and train data sets were merged using rbind() function to create one merged data set

NUMBER 2: Extract only the measurements on the mean and standard deviation for each measurements

Pattern of the elements in features table with mean or std was identified using grep() function
Columns for the pattern traced in previous step together with the “subject”, “activityLabel” for all rows were extracted from the merged data frame creating a new merged data frame (merged.data1).

NUMBER 3: Uses descriptive activity names to name the activities in the data set

Elements of column activityLabel were replaced by the corresponding activity names as defined in activity_labels.txt in “UCI HAR Dataset”


NUMBER 4 :  Appropriately labels the data set with descriptive variable names 

Data frame with mean and standard deviation measures was extracted from feature.txt in “UCI HAR Dataset”; column 2 (column for descriptive activity names) was transformed into character vector and extracted to create new features.mean.std2 data frame.  This data frame will be used as reference to rename columns of the merged.data1.

Columns 1 to 79 of merged.data1 were renamed to reflect the corresponding descriptive variable name for each column.

NUMBER 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

“subject” and “activityLabel” columns of merged.data1 were transformed into character vectors for correct referencing in the latter code.

Columns 1 to 79 of merged.data1 were renamed in sequential numbers for indexing in the later code.

A.	To get the average of each variable for each subject: 
1.	Data frame containing rows with subject = “1” and columns with variables/features was filtered from merged.data1
2.	Created a 1-column data frame with the average of each variable for subject “1”
3.	Named the column “subject1.mean” for easy reading
4.	Iterated the process for subjects 2 to 30

B.	To get the average of each variable for each activity: 
1.	Data frame containing rows with activity = “WALKING ” and columns with variables/features was filtered from merged.data1
2.	Created a 1-column data frame with the average of each variable for activity “WALKING”
3.	Named the column WALKING.mean for easy reading
4.	Iterated the process for the remaining 5 activity names

A one-column “variable” data frame, was extracted from features.mean.std2 in NUMBER 4 to reflecting the variable/feature in a given row.  

Resulting data frames from “variable”, A, and B were merged to form the final data frame, run_analysis_mean.

The complete list of columns with corresponding descriptions is available in CodeBook.md.
