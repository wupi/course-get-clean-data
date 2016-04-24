# note of frequently used commands


#download and read xls file

download.file(fileurl, destfile = "./dataclean_w1/q1.csv", method = 'curl')
 q3 <- read.xlsx("./dataclean_w1/q3.xlsx", sheetIndex = 1, header = T, rowIndex = 18:23, colIndex = 7:15)

 
 #download and read xml files
 #transform to data frame
 library(XML)
 fileurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
 doc <- xmlTreeParse(fileurl, useInternalNodes = T)
 rootNode <- xmlRoot(doc)
 
 # To extract the XML-values from the document, use xmlSApply:
 docvalue <- xmlSApply(xmltop, function(x) xmlSApply(x, xmlValue))
 
 # Finally, get the data in a data-frame and have a look at the first rows and columns
 plantcat_df <- data.frame(t(docvalue),row.names=NULL)
 