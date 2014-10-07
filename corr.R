corr <- function(directory, threshold = 0) {
  corr_data<- NULL
  source("complete.R")
  nobs.frame <- complete(directory,1:332)
  for (i in 1:nrow(nobs.frame)){
    if(nobs.frame[i,"nobs"] > threshold){
        newID <- paste(formatC(i,width=3,flag=0),"csv",sep=".")
        fileName<-paste(directory,newID,sep="\\")
        data <- read.csv(fileName)
        good <- complete.cases(data)
        corr_data <- rbind(corr_data,cor(data[good,"sulfate"],data[good,"nitrate"]))
    }
  }
  if(length(corr_data) > 0){
      as.vector(t(corr_data))
  }
  else{
    0
  }
}

