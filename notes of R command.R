# note of frequently used commands

#download and read xls file
download.file(fileurl, destfile = "./dataclean_w1/q1.csv", method = 'curl')
q3 <- read.xlsx("./dataclean_w1/q3.xlsx", sheetIndex = 1, header = T, rowIndex = 18:23, colIndex = 7:15)


#download and read xml files
#transform to data frame
#caution: pay attention to which level of xml would you like to read
library(XML)
fileurl<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
doc <- xmlTreeParse(fileurl, useInternalNodes = T)
rootNode <- xmlRoot(doc)
doc_df <- xmlToDataFrame(doc)


# test performance
system.time(DT[,mean(pwgtp15),by=SEX])