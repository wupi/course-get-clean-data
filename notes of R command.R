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

#get data from webpage
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con) #close connection


# test performance
system.time(DT[,mean(pwgtp15),by=SEX])

#################
##get data from api
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "f7b3203e7c0ee0ebb480",
                   secret = "027c3815547c4ca371fa9952f426e3c923bc19e5")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)
# to get "datasharing" 
json1 = content(GET("https://api.github.com/users/jtleek/repos"))
myRepo = json1[sapply(json1, function(x) x$name == "datasharing")]
sprintf("Repository created at %s", myRepo[[1]]$created_at)
