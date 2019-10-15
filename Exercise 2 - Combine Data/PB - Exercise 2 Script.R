#check latest versions of R
module avail R

#load R module
module load R/3.4.0

R

#set working directory
setwd("C:/Users/user/Desktop/tomerge")

#load the first file data1_sex.txt to combine additional data to and assign to variable 'a'
a <- read.table("/Users/user/Desktop/tomerge/data1_sex.txt", header = TRUE, sep = "\t")

# create for loop to load each remaining file and merge to the first file 'a' 
all <- dir(path = "C:/Users/user/Desktop/tomerge/", pattern = ".txt")	#list all the .txt files in that folder directory and assign to 'all'
for(i in 2:length(all)){	#for every file starting from the second file in that folder	
	file <- read.table(all[i], header = TRUE, sep = "\t") #consecutively load each file from folder for merging
	a <- merge(a, file, by = "sample_ID", all = TRUE, sort = FALSE) #merge files by sample_ID, retaining all column values and filling blanks with NAs, keeping sample IDs in order  with NAs at bottom
}

write.table(a, "/Users/user/Desktop/finished.txt", quote = FALSE, sep = " ", row.names = FALSE, col.names = TRUE)	#save final output table to folder  