####Set your working directory to the UCI HAR Dataset

if(!file.exists("activity_labels.txt")){
  stop("Files note found. Please set your working directory to the UCI HAR Dataset.")
}

####STEP 1: Merges the training and the test sets to create one data set.

#Read test and train data
testset<-read.table("test/X_test.txt")
trainset<-read.table("train/X_train.txt")

#Combine test and train data
allset<-rbind(testset,trainset)

#Read test and train subjects and combine
testsubjects<-read.table("test/subject_test.txt")
trainsubjects<-read.table("train/subject_train.txt")
allsubjects<-rbind(testsubjects,trainsubjects)

#Bind subject to data set
allset$Subject<-as.factor(allsubjects$V1)
#names(allset)[names(allset) == "V1"] <- "Subjects"

####STEP 2: Extracts only the measurements on the mean and standard deviation...

#Read feature names
features<-read.table("features.txt", colClasses = "character")
featurenames<-c(features$V2,"Subject")
names(allset)<-featurenames

#Select names that contain the phrase "mean()" or "std()"  and combine them
meannames<-features$V2[grep("mean\\(\\)",features$V2)]
stdnames<-features$V2[grep("std\\(\\)",features$V2)]
namestouse<-c(meannames, stdnames, "Subject")

settouse<-allset[,names(allset) %in% namestouse]

####STEP 3:Uses descriptive activity names to name the activities in the data set
  
#Read test and train activities
testactivities<-read.table("test/y_test.txt")
trainactivities<-read.table("train/y_train.txt")
allactivities<-rbind(testactivities,trainactivities)

#Relabel activity numbers using descriptive names
settouse$Activity<-activitylabels[allactivities$V1]

####STEP 4:Appropriately labels the data set with descriptive variable names.
names(settouse)<-gsub("-mean\\(\\)-","Mean",names(settouse))
names(settouse)<-gsub("-mean\\(\\)","Mean",names(settouse))
names(settouse)<-gsub("-std\\(\\)-","Std",names(settouse))
names(settouse)<-gsub("-std\\(\\)","Std",names(settouse))
names(settouse)<-sub("^t","Time",names(settouse))
names(settouse)<-sub("^f","Frequency",names(settouse))

####STEP 5:Creates a second tidy data set with average of each variable for each activity and each subject.

tidydf<-aggregate(. ~ Subject+Activity, settouse, mean)

