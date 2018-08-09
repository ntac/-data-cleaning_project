library(dplyr)
library(plyr)
path<-"C:/Leprojet/"
Xtrain<-"UCI HAR Dataset/train/X_train.txt"
act_train<-"UCI HAR Dataset/train/Y_train.txt"
subj_train<-"UCI HAR Dataset/train/subject_train.txt"
Xtest<-"UCI HAR Dataset/test/X_test.txt"
act_test<-"UCI HAR Dataset/test/Y_test.txt"
subj_test<-"UCI HAR Dataset/test/subject_test.txt"
col_names<-"UCI HAR Dataset/features.txt"

act_label<-"UCI HAR Dataset/activity_labels.txt"


# 1 -1 getting the training data
 
  #a- reding the files
  
  data_train <-read.table(paste0(path,Xtrain), header = FALSE)
  act_train  <-read.table(paste0(path,act_train), header = FALSE)
  id_train   <-read.table(paste0(path,subj_train), header = FALSE)
  
   #b- merging the activities and ID with data 
  train_set<-cbind(rename(act_train,c("V1"="act")),rename(id_train,c("V1"="Id")),data_train) %>%
             mutate(source="train")

# 1 -2 getting the test data

  #a- reding the files
  data_test <-read.table(paste0(path,Xtest), header = FALSE)
  act_test  <-read.table(paste0(path,act_test), header = FALSE)
  id_test   <-read.table(paste0(path,subj_test), header = FALSE)
  
  #b- merging the activities and ID with data
  test_set<-cbind(rename(act_test,c("V1"="act")),rename(id_test,c("V1"="Id")),data_test) %>%
           mutate(source="test")
  
# 1 -3 Combining the two datasets
   full_data0<-rbind(train_set,test_set)
   
# 2- keepping only the means and std colums
   cols   <-read.table(paste0(path,col_names), header = FALSE)
   good_cols<-cols[grep("(*mean()*)|(*std()*)",cols[,2]),]
  
   fd<- select(full_data0,paste0("V",good_cols[,1]))    #selecting the columns

# 4- stepping to Question 4 , to label the variables as needed   
   cols_v<-as.matrix(good_cols)
 #removing speicial characters on column names    
   cols_v[,2]<-gsub("-","",sub("^t","time", sub("^f","freq",  gsub("\\(\\)","", cols_v[,2]))))
   k<-1
   repeat { 
           names(fd)[k]<-cols_v[k,2]
           k<-k+1
           if(k > length(cols_v[,1]) ) {
             break
             }
    
      }            #setting the colnames
   
   full_data<-cbind(select(full_data0,Id,act,source),fd)
   
 # 3- labelings correctly the activities
   
   act_data_lbl   <-read.table(paste0(path,act_label), header = FALSE)
   full_data$activitylbl<-act_data_lbl[match(full_data$act,act_data_lbl$V1),"V2"]
   full_data<- select(full_data,-act)
   
 # 5- Computing the means of the variables
  dat<-full_data  %>%
       group_by(source,Id,activitylbl)   %>%
       summarize_each(funs(mean))
  
  #rwiting the data to a txt

 write.table(dat,file=paste0(path,"finaldata.txt"), sep = " ", row.name=FALSE )
 write.table(data.frame(names( dat)),file=paste0(path,"columns.txt"), sep = " ", row.name=FALSE, col.names = F)
             
   
             