% The R script for conversion of a positionscan output file obtained from FoldX. 

setwd("")
df <-read.csv("positionscan.txt", sep="\t", header=FALSE)

tmp<-data.frame(
    X=df$V2,
    ind=rep(1:21, nrow(df)/21)
)

z<-unstack(tmp, X~ind)

a=df$V1[1:21]
colnames(z)=substr(a,6,6)

b<-df$V1
rownames(z)<-substr(b[seq(1, nrow(df), 21)],1,5)

write.table(z, file="pssm.txt")
