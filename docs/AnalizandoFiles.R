#===========================================================================
library(ggplot2);   library(dplyr);         library(readxl);
library(pastecs);   library(sciplot);       library(MASS);
library(gridExtra); library("gplots");      library("lattice");
library(car);       library(gridExtra);     library(lattice);
library(corrplot);  library(readr);         library(readxl);   
library(rvest);     library(RSQLite);       library(DBI);    
library(xml2);      library(RCurl);         library(devtools);
library(ggplot2);   library(datasets);      library(dplyr);
library(sciplot);   library(scatterplot3d); library("car")
library(psych);     library("gplots");      library("plotrix")
library(gplots);    library(moments);       library(univariateML)
library("fitdistrplus"); library("MASS");   library("survival")
library(readr)
#===========================================================================
#setwd("~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Files")
setwd("~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Files") # MacBook pro
#===========================================================================
#ruta_carpeta <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Files"
#===========================================================================
Mis_archivos <- list.files(pattern = "\\.csv$", full.names = TRUE)
print(Mis_archivos)
nombres_archivos <- basename(Mis_archivos)
print(nombres_archivos)
#----------------------------------------------------------------------
pEhExvsCDC5 <- read_csv("pEhExvsCDC5.csv");         pEhExvsCmasM <- read_csv("pEhExvsCmasM.csv")
pEhExvsEhMyb10 <- read_csv("pEhExvsEhMyb10.csv");   pEhExvsU2AF84 <- read_csv("pEhExvsU2AF84.csv")
pEhExvsUmasM <- read_csv("pEhExvsUmasM.csv") 
#----------------------------------------------------------------------
View(pEhExvsCDC5)
View(pEhExvsCmasM)
View(pEhExvsEhMyb10)
View(pEhExvsU2AF84)
View(pEhExvsUmasM)
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsCDC5); print(nombres_col)
summary(pEhExvsCDC5)
colnames(pEhExvsCDC5) <- c("GenId", "baseMean","log2FoldChange","lfcSE",
                           "stat", "pvalue", "padj", "CDC5_1", "CDC5_2",
                           "CDC5_3", "pEhEx_1", "pEhEx_2", "pEhEx_3",
                           "CDC5_1.1", "CDC5_2.1", "CDC5_3.1", "pEhEx_1.1",
                           "pEhEx_2.1", "pEhEx_3.1", "Certeza", "DE")
write.csv(pEhExvsCDC5,"pEhExvsCDC5.csv")
View(pEhExvsCDC5)
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsCmasM); print(nombres_col)
summary(pEhExvsCmasM)
colnames(pEhExvsCmasM) <- c("GenId", "baseMean","log2FoldChange","lfcSE",
                            "stat", "pvalue", "padj", "CDC5_1", "CDC5_2",
                            "CDC5_3", "pEhEx_1", "pEhEx_2", "pEhEx_3",
                            "CDC5_1.1", "CDC5_2.1", "CDC5_3.1", "pEhEx_1.1",
                            "pEhEx_2.1", "pEhEx_3.1", "Certeza", "DE")
write.csv(pEhExvsCmasM,"pEhExvsCmasM.csv")
View(pEhExvsCmasM)
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsEhMyb10); print(nombres_col)
summary(pEhExvsEhMyb10)
colnames(pEhExvsEhMyb10) <- c("GenId", "baseMean","log2FoldChange","lfcSE",
                              "stat", "pvalue", "padj", "CDC5_1", "CDC5_2",
                              "CDC5_3", "pEhEx_1", "pEhEx_2", "pEhEx_3",
                              "CDC5_1.1", "CDC5_2.1", "CDC5_3.1", "pEhEx_1.1",
                              "pEhEx_2.1", "pEhEx_3.1", "Certeza", "DE")
write.csv(pEhExvsEhMyb10,"pEhExvsEhMyb10.csv")
View(pEhExvsEhMyb10)
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsU2AF84); print(nombres_col)
summary(pEhExvsU2AF84)
colnames(pEhExvsU2AF84) <- c("GenId", "baseMean","log2FoldChange","lfcSE",
                             "stat", "pvalue", "padj", "CDC5_1", "CDC5_2",
                             "CDC5_3", "pEhEx_1", "pEhEx_2", "pEhEx_3",
                             "CDC5_1.1", "CDC5_2.1", "CDC5_3.1", "pEhEx_1.1",
                             "pEhEx_2.1", "pEhEx_3.1", "Certeza", "DE")
write.csv(pEhExvsU2AF84,"pEhExvsU2AF84.csv")
View(pEhExvsU2AF84)
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsUmasM); print(nombres_col)
summary(pEhExvsUmasM)
colnames(pEhExvsUmasM) <- c("GenId", "baseMean","log2FoldChange","lfcSE",
                            "stat", "pvalue", "padj", "CDC5_1", "CDC5_2",
                            "CDC5_3", "pEhEx_1", "pEhEx_2", "pEhEx_3",
                            "CDC5_1.1", "CDC5_2.1", "CDC5_3.1", "pEhEx_1.1",
                            "pEhEx_2.1", "pEhEx_3.1", "Certeza", "DE")
write.csv(pEhExvsUmasM,"pEhExvsUmasM.csv")
View(pEhExvsUmasM)
#----------------------------------------------------------------------
save.image("ColsCorrectedChackpoint.RData")
#----------------------------------------------------------------------
setwd("~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Files") # MacBook pro
load("ColsCorrectedChackpoint.RData")
#----------------------------------------------------------------------
View(pEhExvsCDC5)
View(pEhExvsCmasM)
View(pEhExvsEhMyb10)
View(pEhExvsU2AF84)
View(pEhExvsUmasM)
#----------------------------------------------------------------------
nbreaks <- 10
#----------------------------------------------------------------------
data1 <- pEhExvsCDC5
Log2pEhExvsCDC5 <- data1$log2FoldChange
head(Log2pEhExvsCDC5,5)
summary(data1)
npEhExvsCDC5    <- length(Log2pEhExvsCDC5)
hist(Log2pEhExvsCDC5, breaks = nbreaks, col= rainbow(25,0.3), 
     main = ' Log2 pEhExvsCDC5')
meanL2pEhExvsCDC5 <- mean(Log2pEhExvsCDC5)
StdDevL2pEhExvsCDC5 <- sd(Log2pEhExvsCDC5)
NormLog2pEhExvsCDC5 <- (Log2pEhExvsCDC5-meanL2pEhExvsCDC5)/StdDevL2pEhExvsCDC5
tst<- NormLog2pEhExvsCDC5
hist(tst, breaks = nbreaks, col= 1:5, 
     main = 'Normalized Log2 pEhExvsCDC5',
     xlab='pEhExvsCDC5',
     ylab= 'Frequency pEhExvsCDC5')
#----------------------------------------------------------------------
fw1<-fitdist(tst, "norm")
plotdist(tst, histo = TRUE, demp = TRUE)
#----------------------------------------------------------------------
nnorm.f <- fitdist(tst,"norm")
summary(nnorm.f)
par(mfrow=c(2,2))
denscomp(nnorm.f,legendtext = 'Dist Normal')
qqcomp(nnorm.f,legendtext = 'Dist Normal')
cdfcomp(nnorm.f,legendtext = 'Dist Normal')
ppcomp(nnorm.f,legendtext = 'Dist Normal')
#----------------------------------------------------------------------
probs <- c();
probs[8] = 0.175;  probs[9] = 0.825; 
probs[7] = 0.15;   probs[10] = 0.85;   
probs[6] = 0.125;  probs[11] = 0.875; 
probs[5] = 0.1;    probs[12] = 0.9;    
probs[4] = 0.075;  probs[13] = 0.925; 
probs[3] = 0.05;   probs[14] = 0.95;   
probs[2] = 0.025;  probs[15] = 0.975; 
probs[1] = 0.005;  probs[16] = 0.995;  
#----------------------------------------------------------------------
CuantilesData <- quantile(tst,prob = probs)
CuantilesModel <- qnorm(probs, mean=0, sd=1)
Cuantilillos <- t(CuantilesModel)
colnames(Cuantilillos) <- c('0.5%','2.5%','5%','7.5%',
                            '10%','12.5%','15%','17.5%',
                            '82.5%','85%','87.5%','90%',
                            '92.5%','95%','97.5%','99.5%')
Cuantilillos <- t(Cuantilillos)
colnames(Cuantilillos) <- c('Cuantiles Ajuste')
#----------------------------------------------------------------------
CuantilesA <- matrix(0,8,2)
CuantilesD <- matrix(0,8,2)
colnames(CuantilesA) <- c('LimInf','LimSup')
colnames(CuantilesD) <- c('LimInf','LimSup')
rownames(CuantilesA) <- c('65','70','75','80','85','90','95','99')
rownames(CuantilesD) <- c('65','70','75','80','85','90','95','99')
#----------------------------------------------------------------------
CuantilesA[1,1] <-CuantilesData[8]; CuantilesA[1,2] <-CuantilesData[9]
CuantilesA[2,1] <-CuantilesData[7]; CuantilesA[2,2] <-CuantilesData[10]
CuantilesA[3,1] <-CuantilesData[6]; CuantilesA[3,2] <-CuantilesData[11]
CuantilesA[4,1] <-CuantilesData[5]; CuantilesA[4,2] <-CuantilesData[12]
CuantilesA[5,1] <-CuantilesData[4]; CuantilesA[5,2] <-CuantilesData[13]
CuantilesA[6,1] <-CuantilesData[3]; CuantilesA[6,2] <-CuantilesData[14]
CuantilesA[7,1] <-CuantilesData[2]; CuantilesA[7,2] <-CuantilesData[15]
#----------------------------------------------------------------------
CuantilesA[8,1] <-CuantilesData[1]; CuantilesA[8,2] <-CuantilesData[16]
CuantilesD[1,1] <-Cuantilillos[8];  CuantilesD[1,2] <-Cuantilillos[9]
CuantilesD[2,1] <-Cuantilillos[7];  CuantilesD[2,2] <-Cuantilillos[10]
CuantilesD[3,1] <-Cuantilillos[6];  CuantilesD[3,2] <-Cuantilillos[11]
CuantilesD[4,1] <-Cuantilillos[5];  CuantilesD[4,2] <-Cuantilillos[12]
CuantilesD[5,1] <-Cuantilillos[4];  CuantilesD[5,2] <-Cuantilillos[13]
CuantilesD[6,1] <-Cuantilillos[3];  CuantilesD[6,2] <-Cuantilillos[14]
CuantilesD[7,1] <-Cuantilillos[2];  CuantilesD[7,2] <-Cuantilillos[15]
CuantilesD[8,1] <-Cuantilillos[1];  CuantilesD[8,2] <-Cuantilillos[16]
#----------------------------------------------------------------------
print(CuantilesD)
print(CuantilesA)
#----------------------------------------------------------------------
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col= rainbow(1,0.7),
     main = 'Normalized Log2 Basal Expresion - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesA[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesA[2,1], lty=2, col="darkblue"); # 70% INFERIOR
abline(v=CuantilesA[2,2], lty=2, col="darkblue") # 70% SUPERIOR
abline(v=CuantilesA[3,1], lty=2, col="aquamarine4"); # 75% INFERIOR
abline(v=CuantilesA[3,2], lty=2, col="aquamarine4"); # 75% SUPERIOR
abline(v=CuantilesA[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesA[4,2], lty=2, col="green"); # 80% SUPERIOR
abline(v=CuantilesA[5,1], lty=2, col="brown"); # 85% INFERIOR
abline(v=CuantilesA[5,2], lty=2, col="brown"); # 85% SUPERIOR
abline(v=CuantilesA[6,1], lty=2, col="red");  # 90% INFERIOR
abline(v=CuantilesA[6,2], lty=2, col="red"); # 90% SUPERIOR
abline(v=CuantilesA[7,1], lty=2, col="blue");  # 95% INFERIOR
abline(v=CuantilesA[7,2], lty=2, col="blue"); # 95% SUPERIOR
abline(v=CuantilesA[8,1], lty=2, col="orange");  # 99% INFERIOR
abline(v=CuantilesA[8,2], lty=2, col="orange"); # 99% SUPERIOR
legend("topright",
       legend=c("65%","70%","75%","80%","85%","90%","95%","99%"), 
       pch=c(1,2,3,4,5,6,7,8),
       col=c("darkgoldenrod4","darkblue","aquamarine4",
             "green", "brown","red","blue","orange"))
hist(tst, breaks = nbreaks, col= rainbow(1,0.7),
     main = 'Normalized Log2   Basal Expresion - ADJUSTED', lty=9)
#----------------------------------------------------------------------
abline(v=CuantilesD[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesD[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesD[2,1], lty=2, col="darkblue");  # 70% INFERIOR
abline(v=CuantilesD[2,2], lty=2, col="darkblue"); # 70% SUPERIOR
abline(v=CuantilesD[3,1], lty=2, col="aquamarine4");  # 75% INFERIOR
abline(v=CuantilesD[3,2], lty=2, col="aquamarine4"); # 75% SUPERIOR
abline(v=CuantilesD[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesD[4,2], lty=2, col="green"); # 80% SUPERIOR
abline(v=CuantilesD[5,1], lty=2, col="brown");  # 85% INFERIOR
abline(v=CuantilesD[5,2], lty=2, col="brown"); # 85% SUPERIOR
abline(v=CuantilesD[6,1], lty=2, col="red");  # 90% INFERIOR
abline(v=CuantilesD[6,2], lty=2, col="red"); # 90% SUPERIOR
abline(v=CuantilesD[7,1], lty=2, col="blue");  # 95% INFERIOR
abline(v=CuantilesD[7,2], lty=2, col="blue"); # 95% SUPERIOR
abline(v=CuantilesD[8,1], lty=2, col="orange");  # 99% INFERIOR
abline(v=CuantilesD[8,2], lty=2, col="orange"); # 99% SUPERIOR
legend("topright",
       legend=c("65%","70%","75%","80%","85%","90%","95%","99%"), 
       pch=c(1,2,3,4,5,6,7,8),
       col=c("darkgoldenrod4","darkblue","aquamarine4",
             "green", "brown","red","blue","orange"))
#----------------------------------------------------------------------
#\subsection{Grafica Cuantiles del $65\%$ y $80\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col= rainbow(1,0.7),
     main = 'Normalized Log2  Basal Expresion - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesA[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesA[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesA[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
hist(tst, breaks = nbreaks, col= rainbow(1,0.7),
     main = 'Normalized Log2  Basal Expresion - ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesD[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesD[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesD[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
#----------------------------------------------------------------------
# \subsection{Grafica Cuantiles del $70\%$ y $85\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col= rainbow(1,0.7), 
     main = 'Normalized Log2  Basal Expresion-DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[2,1], lty=2, col="darkblue"); abline(v=CuantilesA[2,2], lty=2, col="darkblue")
abline(v=CuantilesA[5,1], lty=2, col="brown"); abline(v=CuantilesA[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
hist(tst, breaks = nbreaks, col= rainbow(1,0.7),
     main = 'Normalized Log2  Basal Expresion-ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesD[2,2], lty=2, col="darkblue")
abline(v=CuantilesD[5,1], lty=2, col="brown"); 
abline(v=CuantilesD[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
#----------------------------------------------------------------------

