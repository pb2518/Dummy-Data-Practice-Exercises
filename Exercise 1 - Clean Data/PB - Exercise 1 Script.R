#check latest versions of R
module avail R

#load R module
module load R/3.4.0

R

#input data that you saved to home directory
#use ?read.table to check line requirements
read.table("/rdsgpfs/general/user/pb2518/home/data1.txt", header = TRUE, sep = "\tclass")

#assign this to a vector
dummy_data <- read.table("/rdsgpfs/general/user/pb2518/home/data1.txt", header = TRUE, sep = "\t")

#check data is a dataframe
class(dummy_data)

#check dimensions
dim(dummy_data)

#load dplyr package for glimpse
library(dplyr)
glimpse(dummy_data)

#view top 15 rows 
head(dummy_data, n=15)

#are there any N/As?
any(is.na(dummy_data))

#see what columns they are in
summary(dummy_data)

1. better way

#find rows with no missing values (complete cases TRUE)
complete.cases(dummy_data)

#use that to select all rows that do not have complete cases i.e FALSE
a <- complete.cases(dummy_data)
b <- which (a == FALSE)

#remove all those rows from the dataset
dummy_data[-b, ]

#assign dummy_data wihtout N/As to a new vector
clean_dummy_data <- dummy_data[-b, ]

OR

2. 
#remove rows with N/As and keep complete cases
na.omit(dummy_data)

#assign dummy_data without N/As to new vector
clean_dummy_data <- na.omit(dummy_data)


#to calculate the percentage of NA rows in dummy data (so the number of ows containing atleast one NA over the total number of rows, x100)
(length(b)/nrow(dummy_data))*100

#output new clean data table and save to home directory as new file name
write.table(clean_dummy_data, "/rdsgpfs/general/user/pb2518/home/data1clean.txt", quote = FALSE, sep = " ", row.names = FALSE, col.names = TRUE)


#define vector for the data removed
c <- dummy_data[b, ]

#output data table of NA data that has been removed

write.table(c, "/rdsgpfs/general/user/pb2518/home/removeddata.txt", quote = FALSE, sep = " ", row.names = FALSE, col.names = TRUE)

#output data table of NA data that has been removed but trying to replace NAs with none 
write.table(c, "/rdsgpfs/general/user/pb2518/home/removeddata2.txt", quote = FALSE, sep = " ", na = "none", row.names = FALSE, col.names = TRUE)


