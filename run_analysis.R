##download "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##extract zip file to "C:/Users/jggomez/Desktop/Data Science"

##Getting and cleaning "test" data set

subject.test = read.table("C:/Users/jggomez/Desktop/Data Science/UCI HAR Dataset/test/subject_test.txt")
names(subject.test) <- sub("^V1$", "subject", names(subject.test))
 	##renaming "V1" to "subject" for easy reference and binding "test" data frames later on 
	##NOTE: Y_test and X_test also have V1 column but pertaining to different descriptions

Y.test = read.table("C:/Users/jggomez/Desktop/Data Science/UCI HAR Dataset/test/Y_test.txt")
names(Y.test) <- sub("^V1$", "activityLabel", names(Y.test))
	##renaming "V1" to "activityLabel" for easy reference and binding "test" data frames later on
      ##NOTE: subject_test and X_test also have V1 column but pertaining to different descriptions

X.test = read.table("C:/Users/jggomez/Desktop/Data Science/UCI HAR Dataset/test/X_test.txt")
test.data = cbind(X.test,subject.test,Y.test) 
	##binding the 3 test data frames to create 1 test dataframe


##Getting and cleaning "train" data set
subject.train = read.table("C:/Users/jggomez/Desktop/Data Science/UCI HAR Dataset/train/subject_train.txt")
names(subject.train) <- sub("^V1$", "subject", names(subject.train))
	##renaming "V1" to "subject" for easy reference and binding "train" data frames later on 
	##NOTE: Y_train and X_train also have V1 column but pertaining to different descriptions

Y.train = read.table("C:/Users/jggomez/Desktop/Data Science/UCI HAR Dataset/train/Y_train.txt")
names(Y.train) <- sub("^V1$", "activityLabel", names(Y.train))
	##renaming "V1" to "subject" for easy reference and binding "train" data frames later on 
	##NOTE: subject_train and X_train also have V1 column but pertaining to different descriptions

X.train = read.table("C:/Users/jggomez/Desktop/Data Science/UCI HAR Dataset/train/X_train.txt")
train.data = cbind(X.train,subject.train,Y.train)
	##binding the 3 train data frames to create 1 train dataframe


##NUMBER 1: Merge the train and the test sets to create one data set 

merged.data = rbind(test.data,train.data)

##NUMBER 2: Extract only the measurements on the mean and standard deviation for each measurements

features = read.table("C:/Users/jggomez/Desktop/Data Science/UCI HAR Dataset/features.txt")
	##reading the features table as reference to get columns for mean and standard deviation measurements
features1 <- grep("mean|std",features$V2)
	 ##to find pattern for mean and standard deviation measurements
merged.data1 = merged.data[,c(features1,562,563)] 
	##extracting columns corresponding to mean 
	##and standard deviation measurements, subject, and activity labels

##NUMBER 3: Uses descriptive activity names to name the activities in the data set

merged.data1$activityLabel = sub(1,"WALKING",merged.data1$activityLabel)
		##replacing the class label by the corresponding descriptive activity name 
merged.data1$activityLabel = sub(2,"WALKING_UPSTAIRS",merged.data1$activityLabel)
merged.data1$activityLabel = sub(3,"WALKING_DOWNSTAIRS",merged.data1$activityLabel)
merged.data1$activityLabel = sub(4,"SITTING",merged.data1$activityLabel)
merged.data1$activityLabel = sub(5,"STANDING",merged.data1$activityLabel)
merged.data1$activityLabel = sub(6,"LAYING",merged.data1$activityLabel)


##NUMBER 4 : Appropriately labels the data set with descriptive variable names

features.mean.std <- features[grepl("mean|std",features$V2),] 
	##data frame with the variables and their corresponding descriptive feature vectors/variable names
features.mean.std1 <- transform(features.mean.std, V2 = as.character(V2)) 
	##transforming the column for descriptive variable names into character vector
features.mean.std2 <- features.mean.std1[,2] 
	## for easy indexing in the next step
names(merged.data1)[1:79] <- features.mean.std2[c(1:79)] 
	##renaming columns of the data frame to reflect descriptive variable names


##NUMBER 5: From the data set in step 4, creates a second, independent tidy data set 
		##with the average of each variable for each activity and each subject

merged.data1 <- transform(merged.data1, subject = as.character(subject), 
			activityLabel = as.character(activityLabel)) 
			## converting subject and activityLabel into character vectors
names(merged.data1)[1:79] <- c(1:79) 
			## remaining variable names in sequential numbers for indexing in the later code

library(dplyr)
subject1 <- filter(merged.data1,subject=="1")
subject1 <- subject1[,1:79]
subject1.mean = apply(subject1, 2, mean)
			##getting the average of each column or variable for subject1
			##NOTE: subject1 corresponds to the volunteer tagged as "1" who performed the activities
 
subject2 <- filter(merged.data1,subject=="2")
subject2 <- subject2[,1:79]
subject2.mean = apply(subject2, 2, mean)

subject3 <- filter(merged.data1,subject=="3")
subject3 <- subject3[,1:79]
subject3.mean = apply(subject3, 2, mean)

subject4 <- filter(merged.data1,subject=="4")
subject4 <- subject4[,1:79]
subject4.mean = apply(subject4, 2, mean)

subject5 <- filter(merged.data1,subject=="5")
subject5 <- subject5[,1:79]
subject5.mean = apply(subject5, 2, mean)

subject6 <- filter(merged.data1,subject=="6")
subject6 <- subject6[,1:79]
subject6.mean = apply(subject6, 2, mean)

subject7 <- filter(merged.data1,subject=="7")
subject7 <- subject7[,1:79]
subject7.mean = apply(subject7, 2, mean)

subject8 <- filter(merged.data1,subject=="8")
subject8 <- subject8[,1:79]
subject8.mean = apply(subject8, 2, mean)

subject9 <- filter(merged.data1,subject=="9")
subject9 <- subject9[,1:79]
subject9.mean = apply(subject9, 2, mean)

subject10 <- filter(merged.data1,subject=="10")
subject10 <- subject10[,1:79]
subject10.mean = apply(subject10, 2, mean)

subject11 <- filter(merged.data1,subject=="11")
subject11 <- subject11[,1:79]
subject11.mean = apply(subject11, 2, mean)

subject12 <- filter(merged.data1,subject=="12")
subject12 <- subject12[,1:79]
subject12.mean = apply(subject12, 2, mean)

subject13 <- filter(merged.data1,subject=="13")
subject13 <- subject13[,1:79]
subject13.mean = apply(subject13, 2, mean)

subject14 <- filter(merged.data1,subject=="14")
subject14 <- subject14[,1:79]
subject14.mean = apply(subject14, 2, mean)

subject15 <- filter(merged.data1,subject=="15")
subject15 <- subject15[,1:79]
subject15.mean = apply(subject15, 2, mean)

subject16 <- filter(merged.data1,subject=="16")
subject16 <- subject16[,1:79]
subject16.mean = apply(subject16, 2, mean)

subject17 <- filter(merged.data1,subject=="17")
subject17 <- subject17[,1:79]
subject17.mean = apply(subject17, 2, mean)

subject18 <- filter(merged.data1,subject=="18")
subject18 <- subject18[,1:79]
subject18.mean = apply(subject18, 2, mean)

subject19 <- filter(merged.data1,subject=="19")
subject19 <- subject19[,1:79]
subject19.mean = apply(subject19, 2, mean)

subject20 <- filter(merged.data1,subject=="20")
subject20 <- subject20[,1:79]
subject20.mean = apply(subject20, 2, mean)

subject21 <- filter(merged.data1,subject=="21")
subject21 <- subject21[,1:79]
subject21.mean = apply(subject21, 2, mean)

subject22 <- filter(merged.data1,subject=="22")
subject22 <- subject22[,1:79]
subject22.mean = apply(subject22, 2, mean)

subject23 <- filter(merged.data1,subject=="23")
subject23 <- subject23[,1:79]
subject23.mean = apply(subject23, 2, mean)

subject24 <- filter(merged.data1,subject=="24")
subject24 <- subject24[,1:79]
subject24.mean = apply(subject24, 2, mean)

subject25 <- filter(merged.data1,subject=="25")
subject25 <- subject25[,1:79]
subject25.mean = apply(subject25, 2, mean)

subject26 <- filter(merged.data1,subject=="26")
subject26 <- subject26[,1:79]
subject26.mean = apply(subject26, 2, mean)

subject27 <- filter(merged.data1,subject=="27")
subject27 <- subject27[,1:79]
subject27.mean = apply(subject27, 2, mean)

subject28 <- filter(merged.data1,subject=="28")
subject28 <- subject28[,1:79]
subject28.mean = apply(subject28, 2, mean)

subject29 <- filter(merged.data1,subject=="29")
subject29 <- subject29[,1:79]
subject29.mean = apply(subject29, 2, mean)

subject30 <- filter(merged.data1,subject=="30")
subject30 <- subject30[,1:79]
subject30.mean = apply(subject30, 2, mean)

WALKING <- filter(merged.data1,activityLabel=="WALKING")
WALKING <- WALKING[,1:79]
WALKING.mean = apply(WALKING, 2, mean)
		##getting the average of each column or variable for  WALKING
		
WALKING_UPSTAIRS <- filter(merged.data1,activityLabel=="WALKING_UPSTAIRS")
WALKING_UPSTAIRS <- WALKING_UPSTAIRS[,1:79]
WALKING_UPSTAIRS.mean = apply(WALKING_UPSTAIRS, 2, mean)

WALKING_DOWNSTAIRS <- filter(merged.data1,activityLabel=="WALKING_DOWNSTAIRS")
WALKING_DOWNSTAIRS <- WALKING_DOWNSTAIRS[,1:79]
WALKING_DOWNSTAIRS.mean = apply(WALKING_DOWNSTAIRS, 2, mean)

SITTING <- filter(merged.data1,activityLabel=="SITTING")
SITTING <- SITTING[,1:79]
SITTING.mean = apply(SITTING, 2, mean)

STANDING <- filter(merged.data1,activityLabel=="STANDING")
STANDING <- STANDING[,1:79]
STANDING.mean = apply(STANDING, 2, mean)

LAYING <- filter(merged.data1,activityLabel=="LAYING")
LAYING <- LAYING[,1:79]
LAYING.mean = apply(LAYING, 2, mean)

variable = features.mean.std2[c(1:79)] 
	##From NUMBER 4; will use to insert column with the descriptive variable names
run_analysis_mean = data.frame(variable,subject1.mean,subject2.mean,subject3.mean,subject4.mean,subject5.mean,
					subject6.mean,subject7.mean,subject8.mean,subject9.mean,subject10.mean,
					subject11.mean,subject12.mean,subject13.mean,subject14.mean,subject15.mean,
					subject16.mean,subject17.mean,subject18.mean,subject19.mean,subject20.mean,
					subject21.mean,subject22.mean,subject23.mean,subject24.mean,subject25.mean,
					subject26.mean,subject27.mean,subject28.mean,subject29.mean,subject30.mean,
					WALKING.mean,WALKING_UPSTAIRS.mean,WALKING_DOWNSTAIRS.mean,
					SITTING.mean,STANDING.mean,LAYING.mean)

write.table(run_analysis_mean, "run_analysis_mean.txt", sep="\t", row.names=FALSE, col.names=FALSE)
	##writing the run_analysis_mean data frame to the working directory

FOR CHECKING:
s <- split(merged.data1, merged.data1$subject)
merged.data2 = lapply(s, function(x) {
	colMeans(x[, c(1:79)])
		})

s1 <- split(merged.data1, merged.data1$activityLabel)
merged.data3 = lapply(s1, function(x) {
	colMeans(x[, c(1:79)])
		})

##sample run

> tail(merged.data3$WALKING_DOWNSTAIRS)
         74          75          76          77          78          79 
-0.28952583 -0.36123099  0.06717279 -0.43800729 -0.48644298  0.09575882 

> tail(merged.data3$SITTING)
         74          75          76          77          78          79 
-0.96429611 -0.95164174 -0.07643955 -0.98533563 -0.98449136  0.17773859 

> tail(merged.data3$STANDING)
         74          75          76          77          78          79 
-0.94790850 -0.93063670 -0.18370513 -0.97488598 -0.97346106  0.08486504 

> tail(merged.data3$LAYING)
         74          75          76          77          78          79 
-0.95485446 -0.94211571 -0.02936529 -0.97796824 -0.97664822  0.16572813 


> tail(run_analysis_mean)
 WALKING_DOWNSTAIRS.mean SITTING.mean STANDING.mean LAYING.mean
74             -0.28952583  -0.96429611   -0.94790850 -0.95485446
75             -0.36123099  -0.95164174   -0.93063670 -0.94211571
76              0.06717279  -0.07643955   -0.18370513 -0.02936529
77             -0.43800729  -0.98533563   -0.97488598 -0.97796824
78             -0.48644298  -0.98449136   -0.97346106 -0.97664822
79              0.09575882   0.17773859    0.08486504  0.16572813

