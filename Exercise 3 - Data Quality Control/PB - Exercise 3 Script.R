#load the file data.txt to prepare for analysis
b <- read.table("/Users/user/Desktop/data.txt", header = TRUE, sep = " ")

#check data is a datframe
class(b)
#check dimensions 1000 rows and 4 columns
dim(b)

#check summary of data to see if variables are characters or numeric and any abnormal max or min values for variables compared to rest of data (however limited view)
summary(b)

#creat a loop to select each numeric column, plot frequency distrubution, calculate mean, sd, extreme value range outside 3*sd range, remove rows with those values
names <- names(b)
classes <- sapply(b,class)

for(i in 1:ncol(b)) #for each column starting from the first column 
{
	print(paste("Loop", i, sep = " ")) #print which loop we are on as the script runs to keep track  and if there are problems where it stops will indicate where it went wrong
	if(classes[i] == "numeric") #if the column is classed as a numeric variable
	{
		jpeg(paste("Hisogram for", names[i], ".jpg", sep = " ")) #make a named jpeg image - it will automatically save in my documents
		hist(b[ ,i], main = paste("Distrubution:", names[i], sep = " "), breaks = 50) #of named histogram with smaller intervals of 50
		dev.off() #to close the file before next loop which is essential
	
	means=mean(b[ ,i]) #for each column calculate mean
	print(means) #show this mean value for that column in loop
	sds=sd(b[ , i]) #for each column calculate sd
	print(sds) #print this mean value for that column in loop 
	
	r <- which(b[ i] > means+3*sds | b[,i] < means-3*sds) #which values in that selected column are greater than 3*sd or less than 3*sd?
	print(r) #print the row location of each of these values outside the extreme value range 
	
	c <- b[-r, ] #remove these rows that have extreme values from the column variable in the loop
	write.table(c, paste("QC table for ",names[i],".txt",sep=""), quote = FALSE, sep = " ", row.names = FALSE, col.names = TRUE)	#save final output table for each column to folder
	
	}
}

#how to rename file and assign path to save it in correct location - using "/Users/user/Desktop/" and paste("QC table for",names[i],".txt",sep="")
#the final outputs need to be combined or is there a way to just select that column for the final output - use c <- b[-r, i]
#confirm normalilty using shapiro-Wilk test for normailty
shapiro.test(b$height) ##can't use this as sample size must be > 3 and < 5000 ##
#check distrubution using boxplot and visualise outliers, useful for comparing distubutions
boxplot(b$height)
#a boxplot that does not display the values outside the max and min 
boxplot(b$height, outline = FALSE)
?boxplot #to change colours etc. for display
#surely I should calculate standard errors and 95% confidencee intervals? as: mean +/- 1.96*SE


###OR XX ADAPTED VERSION###
for(i in 1:ncol(b))
{
	print(paste("loop_",i,sep=""))
	if (classes[i]=="numeric")
	{
		jpeg(paste("img",i,".jpg",sep=""))
		hist(b[ ,i],main=paste("distribution:",names[i],sep=""),breaks = 50)
		dev.off()
	
	means=mean(b[ ,i])
	sds=sd(b[ ,i])
	print(means)
	print(sds)
	
	r_max<-which(b[,i]>means+3*sds)
	r_min<-which(b[,i]<means-3*sds)
	print(r_max)
	print(r_min)
	
	r<-c(r_max,r_min)
	
	c<-b[-r,] #remove failed samples
	write.table(c,paste("QC table for",names[i],".txt",sep=""),col.names=FALSE, row.names=FALSE,quote=FALSE)

	}

}