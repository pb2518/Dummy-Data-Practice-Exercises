setwd("/rdsgpfs/general/user/pb2518/home/")

a<-read.table("data1.txt",sep="\t",header=TRUE)

###method1##################################
out<-matrix("NA",nrow(a),1)#loop by row

for (i in 1:nrow(a))
{

out[i,1]<-any(is.na(a[i,]))#any NA value present in a row?

}
b<-cbind(a,out)

out_clean<-a[which(b[,8]==FALSE),]
out_na<-a[which(b[,8]==TRUE),]

percentage<-nrow(out_na)/nrow(a)#calculate percentage

print(paste(nrow(out_clean),nrow(out_na),percentage,sep=","))



###method2####################################################

out1<- vector()#define a empty vector
for (j in 2:ncol(a))#loop by column
{
x<-which(is.na(a[,j])==TRUE)
out1<-c(out1,x)
}

out2<-unique(out1)
out_clean<-a[-c(out2),]
out_na<-a[c(out2),]

percentage<-nrow(out_na)/nrow(a)#calculate percentage

print(paste(nrow(out_clean),nrow(out_na),percentage,sep=","))