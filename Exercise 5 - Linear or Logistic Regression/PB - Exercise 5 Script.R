###FOR ONE Y AND MULTIPLE X'S CONSECUTIVELY###

##load the file to prepare for analysis
k <- read.table("/Users/user/Desktop/data3.txt", header = TRUE, sep = "\t")

#explore data
summary(k)
str(k)
head(k)


#go through the two columns of interest and remove rows with NA values
#check assumptions for logistic regression?

#perform multiple logistic regression between disease and each variable
L <- glm(formula = disease ~ sex + age + height + BMI + GT, family = binomial(link = logit), data = k)
L

summary(L) 

#### DESIGN LOOP FOR ALL POSSIBLE PAIRS OF COLUMNS ########
#The double loop structure just gives you two column numbers, and you can use the number to pick the data and carry out an association test. 
#Here is a simple design example

a<-data.frame(matrix(sample(1:10, 10),10,10)) #define a matrix contain 10 rows and 10 columns of data



for (i in 1:ncol(a))
{

	for (j in (i+1):ncol(a))
	{
			#if () you can add a condition selection, based on data type. e.g: choose logistic or linear regression.
			#{
			print(paste("column combination: ",i," and ",j,sep=""))
			out<-glm(formula = a[,i]~a[,j],data=a)
			#}
			
	
	}

}