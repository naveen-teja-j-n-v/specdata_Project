pollutantmean <- function(directory, pollutant, id = 1:332){
  totalSum <- 0
  totalCnt <- 0
  for (i in id){
    newId = paste(formatC(i,width=3,flag=0),"csv",sep=".")
    fileName=paste(directory,newId,sep="\\")
    data <- read.csv(fileName)
    good <- complete.cases(data)
    totalSum <- totalSum + (sum(data[good,pollutant]))
    totalCnt <- totalCnt + nrow(data[good,])
  }
  totalSum/totalCnt
}
