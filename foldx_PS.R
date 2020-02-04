
df <-read.csv("positionscan.txt", sep="\t", header=FALSE)

#replace rows if necessary
#new data to be replaced
# df_rep <-read.csv("positionscan2.txt", sep="\t", header=FALSE)

# df[match(df_rep$V1, df$V1), ] <- df_rep
# df

#transpose and reformat
tmp <- data.frame(
  X=df$V2,
  ind=rep(1:21, nrow(df)/21)
)
z<-unstack(tmp, X~ind)

#Colnames and rownames
a <-as.character(df$V1[1:21])
colnames(z)=substr(a, nchar(a), nchar(a))
colnames(z)[21]<-'H'
z[1]<- NULL
z=z[,order(colnames(z))]

b <-as.character(df$V1)
substrLeft <- function(b, n){
 substr(b, 1, nchar(b)-n)
}

b<-substrLeft(b, 1)

b<-gsub("VAL","V",b)
b<-gsub("ALA","B",b)
b<-gsub("CYS","C",b)
b<-gsub("ASP","D",b)
b<-gsub("GLU","E",b)
b<-gsub("PHE","F",b)
b<-gsub("GLY","G",b)
b<-gsub("HIS","H",b)
b<-gsub("ILE","I",b)
b<-gsub("LEU","L",b)
b<-gsub("MET","M",b)
b<-gsub("LYS","K",b)
b<-gsub("ASN","N",b)
b<-gsub("PRO","P",b)
b<-gsub("ARG","R",b)
b<-gsub("SER","S",b)
b<-gsub("THR","T",b)
b<-gsub("TYR","Y",b)
b<-gsub("TRP","W",b)
b<-gsub("GLN","Q",b)
b<-gsub("H1S","H",b)
b<-gsub("H2S","H",b)
b<-gsub("A","",b)
b<-gsub("B","A",b)

rownames(z)<-b[seq(1,nrow(df),21)]

write.table(z, file="positionscan_reformatted.txt", quote=FALSE)
