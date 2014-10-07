complete <- function(directory, id = 1:332){
  count <- numeric(length(id))
  index <- numeric(length(id))
  j <- 1
  for (i in id){
    newId = paste(formatC(i,width=3,flag=0),"csv",sep=".")
    fileName=paste(directory,newId,sep="\\")
    data <- read.csv(fileName)
    good <- complete.cases(data)
    count[j]<-nrow(data[good,])
    index[j]<-i
    j <- j+1    
  }
  data.frame(id=index,nobs=count)
}