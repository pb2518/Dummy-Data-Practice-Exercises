### For qualitative binary non-ordinal data ###
#unpaired so use chi-squared 
#use fishers exact test for smaller sample sizes 
#use SE of proportion and 95% confidence intervals
#Null hypothesis (H0):
	#There is NO true relationship between smoking and lung cancer observed values in the sampled population of 200 people
#Alternative hypothesis (H1): (one-sided as lung cancer can’t cause smoking or vice versa)
	#There IS a true relationship between smoking and lung cancer observed values in the sampled population of 200 people


#load the file to prepare for analysis
d <- read.table("/Users/user/Desktop/data2.txt", header = TRUE, sep = "\t")

#explore data
summary(d)
str(d)

#select columns to analyse without the IDs variable
e <- d[ , c(2,3)]

#calculate frequency table of 200 patients and proportion of phenotypes they display
f <- table(e)

#individual frequency tables displaying number of 0s and 1s for each variable
table(e$smoking)
table(e$Lung_cancer)

#barplots? 
#loop?

#chi-squared analysis of 2 variables
chisq.test(f) #p = 0.02173, df=1, x^2= 5.2674
#fishers exact test analysis of 2 variables
fisher.test(f) #p = 0.01858, odds ratio= 3.906753, 95%CIs=1.209515 - 16.582465

#since the p values are < 0.05 we can conclude there is evidence to reject the null hypothesis, which means evidence of a relationship between smoking and lung cancer.
#chi squared value indicates: > 3.84 critical value 
#odds ratio indicates: > 1 
