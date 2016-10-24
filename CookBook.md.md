run_anaysis_mean

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

The set of columns are:
variable: shows the variable/feature measured in the row
subject1.mean: shows the average of the corresponding variable per row for subject “1”
subject2.mean: shows the average of the corresponding variable per row for subject “2”
subject3.mean: shows the average of the corresponding variable per row for subject “3”
subject4.mean: shows the average of the corresponding variable per row for subject “4”
subject5.mean: shows the average of the corresponding variable per row for subject “5”
subject6.mean: shows the average of the corresponding variable per row for subject “6”
subject7.mean: shows the average of the corresponding variable per row for subject “7”
subject8.mean: shows the average of the corresponding variable per row for subject “8”
subject9.mean: shows the average of the corresponding variable per row for subject “9”
subject10.mean: shows the average of the corresponding variable per row for subject “10”
subject11.mean: shows the average of the corresponding variable per row for subject “11”
subject12.mean: shows the average of the corresponding variable per row for subject “12”
subject13.mean: shows the average of the corresponding variable per row for subject “13”
subject14.mean: shows the average of the corresponding variable per row for subject “14”
subject15.mean: shows the average of the corresponding variable per row for subject “15”
subject16.mean: shows the average of the corresponding variable per row for subject “16”
subject17.mean: shows the average of the corresponding variable per row for subject “17”
subject18.mean: shows the average of the corresponding variable per row for subject “18”
subject19.mean: shows the average of the corresponding variable per row for subject “19”
subject20.mean: shows the average of the corresponding variable per row for subject “20”
subject21.mean: shows the average of the corresponding variable per row for subject “21”
subject22.mean: shows the average of the corresponding variable per row for subject “22”
subject23.mean: shows the average of the corresponding variable per row for subject “23”
subject24.mean: shows the average of the corresponding variable per row for subject “24”
subject25.mean: shows the average of the corresponding variable per row for subject “25”
subject26.mean: shows the average of the corresponding variable per row for subject “26”
subject27.mean: shows the average of the corresponding variable per row for subject “27”
subject28.mean: shows the average of the corresponding variable per row for subject “28”
subject29.mean: shows the average of the corresponding variable per row for subject “29”
subject30.mean: shows the average of the corresponding variable per row for subject “30”
WALKING.mean: shows the average of the corresponding variable per row for activity “WALKING”
WALKING_UPSTAIRS.mean: shows the average of the corresponding variable per row for activity “WALKING_UPSTAIRS”
WALKING_DOWNSTAIRS.mean: shows the average of the corresponding variable per row for activity “WALKING_DOWNSTAIRS”
SITTING.mean: shows the average of the corresponding variable per row for activity “SITTING”
STANDING.mean: shows the average of the corresponding variable per row for activity “STANDING”
LAYING.mean: shows the average of the corresponding variable per row for activity “LAYING”





