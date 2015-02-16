## INERTIAL SIGNALS FOLDER: RAW DATA for: X, Y, Z Total Acceleration, X, Y, Z Gravitational Acceleration, X, Y, Z, angular velocity. Each row is a 128 element vector (window)
## X_TRAIN/TEST.txt: 561 other variables (over a window of 128 readings)
## Y_TRAIN/TEST.txt: Activity label (1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING
## SUBJECT_TRAIN/TEST.txt: Subject identifier (1 of 30 subjects)

create_tidy_data_set<-function (work_dir=getwd()) { ##asking for the user's working directory. Defaults to the working directory set in R.
        
        setwd(work_dir)
        
        ## Uncomment following code excerpt if you wish to download file and unzip in working directory and record time of download.
        ## Otherwise function assumes you have extracted the data in your working directory, under /UCI HAR Dataset
               
        #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "assignment.zip") 
        #dtime<-Sys.time()
        #unzip(zipfile = "assignment.zip")
       
        ##Merge the TEST and TRAIN data sets.
        
        file.append(file1="X_all.txt",file2="./UCI HAR Dataset/test/X_test.txt")
        file.append(file1="X_all.txt",file2="./UCI HAR Dataset/train/X_train.txt")
        file.append(file1="y_all.txt",file2="./UCI HAR Dataset/test/y_test.txt")
        file.append(file1="y_all.txt",file2="./UCI HAR Dataset/train/y_train.txt")
        file.append(file1="subject_all.txt",file2="./UCI HAR Dataset/test/subject_test.txt")
        file.append(file1="subject_all.txt",file2="./UCI HAR Dataset/train/subject_train.txt")
        
        ## Extract only the data that we are interested in and store it to data frame "x".
        
        feature_names<-as.character(read.table("./UCI HAR Dataset/features.txt")$V2) #obtain headers
        keep_mean<-grepl(pattern = "mean",feature_names) #obtain columns with mean in their name
        keep_std<-grepl(pattern = "std",feature_names) #obtain columns with std (standard deviation) in their name
        keep<-keep_mean|keep_std #combine to obtain columns that contain either mean or std in their name
        l<-keep
        l[which(keep)]=NA
        l[which(!keep)]="NULL"
        x<-read.table("X_all.txt",colClasses = l) #extract *only* the variables that have mean or std in their name
        y<-read.table("y_all.txt") #extract activity records
        j<-factor(y$V1) #convert activity records to factors to allow manipulation
        g<-read.table("./UCI HAR Dataset/activity_labels.txt") #obtain activity names
        levels(j)<-g$V2 #transform activity records from numerals to descriptive activity names
        y<-j
        subjects<-read.table("subject_all.txt") #extract subject records
        x<-cbind(subjects,y,x) #combine subjects, activities, variables to get finalized data set. 
        headers<-c("Subject","Activity",feature_names[keep])
        colnames(x)<-headers #adding descriptive headers to data frame
        
        
        ##Creating new tidy dataset with average of each measured variable (mean and std only), for each activity and each subject.
        
        s<-split(x,list(x$Subject,x$Activity)) #Split the data frame by activity and then by subject.
        z<-data.frame(matrix(ncol = length(headers), nrow = length(names(s)))) # initialize the new data frame that will host our new dataset
        z[,1]<-rep(levels(y),each=length(levels(as.factor(subjects$V1)))) #populating the first column "Activity"
        z[,2]<-1:length(levels(as.factor(subjects$V1))) #populating the second column "Subject"
        for (i in 1:length(names(s))) { #Populating remaining columns, i corresponds to rows and k to columns
                for (k in 3:ncol(x)) { 
                        z[i,k]<-mean(s[[i]][[k]],na.rm = TRUE) #calculate the average of each variable and store it in the respective location
                }
        }
        colnames(z)<-headers #adding descriptive headers to the new data frame
        write.table(z,"tidy.txt",row.name=FALSE) #create dataset, i.e. store data frame to file 
        z
}
