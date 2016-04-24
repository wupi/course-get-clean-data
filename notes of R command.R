# note of frequently used commands


#download and read xls file

download.file(fileurl, destfile = "./dataclean_w1/q1.csv", method = 'curl')
 q3 <- read.xlsx("./dataclean_w1/q3.xlsx", sheetIndex = 1, header = T, rowIndex = 18:23, colIndex = 7:15)
