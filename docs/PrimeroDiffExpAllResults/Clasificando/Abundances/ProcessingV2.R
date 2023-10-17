#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
setwd("~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances")
load('CheackPointOne.RData')
#----------------------------------------------------------------------
View(pEhExvsCDC5);
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
nbreaks <- 10
#----------------------------------------------------------------------
data1 <- pEhExvsCDC5;       View(data1)
sample1   <- data1$pEhEx_1; sample2   <- data1$pEhEx_2; sample3   <- data1$pEhEx_3;
samplevs1 <- data1$CDC5_1;  samplevs2 <- data1$CDC5_2;  samplevs3 <- data1$CDC5_3;
#----------------------------------------------------------------------
log2sample1 <- log2(sample1+1);         log2sample2 <- log2(sample2+1)
log2sample3 <- log2(sample3+1);         log2samplevsCDC51 <- log2(samplevs1+1)
log2samplevsCDC52 <- log2(samplevs2+1); log2samplevsCDC53 <- log2(samplevs3+1)
data1 <- cbind(data1, log2sample1,log2sample2,log2sample3,
               log2samplevsCDC51,log2samplevsCDC52,log2samplevsCDC53)
View(data1)
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
save.image('CheckPointTwo.RData')
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
setwd("~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances")
load('CheckPointTwo.RData')
#----------------------------------------------------------------------
library(ggplot2);library(dplyr);library("fitdistrplus");
library("MASS");library("survival")
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
# Analisis de Data1
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
View(data1)
#===========================================================================
log2sample1 <- data1$log2sample1; print(mean(log2sample1)); print(sd(log2sample1))
#===========================================================================
head(log2sample1,5)
summary(data1)
ndata1    <- length(log2CDC51)
hist(log2sample1, breaks = nbreaks, col= rainbow(25,0.3), 
     main = 'Log2 sample1')
meanlog2sample1 <- mean(log2sample1); print(meanlog2sample1)
StdDevlog2sample1 <- sd(log2sample1); print(StdDevlog2sample1)
Normlog2sample1 <- (log2sample1-meanlog2sample1)/StdDevlog2sample1; print(Normlog2sample1)
#===========================================================================
tst<- Normlog2sample1
#===========================================================================
hist(tst, breaks = nbreaks, col= 1:5, 
     main = 'Normalized Log2sample1',
     xlab='pEhEx1',
     ylab= 'Frequency pEhEx')
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
print(Cuantilillos)
#----------------------------------------------------------------------
CuantilesA <- matrix(0,8,2)
CuantilesD <- matrix(0,8,2)
colnames(CuantilesA) <- c('LimInf','LimSup')
colnames(CuantilesD) <- c('LimInf','LimSup')
rownames(CuantilesA) <- c('65','70','75','80','85','90','95','99')
rownames(CuantilesD) <- c('65','70','75','80','85','90','95','99')
CuantilesA[1,1] <-CuantilesData[8]; CuantilesA[1,2] <-CuantilesData[9]
CuantilesA[2,1] <-CuantilesData[7]; CuantilesA[2,2] <-CuantilesData[10]
CuantilesA[3,1] <-CuantilesData[6]; CuantilesA[3,2] <-CuantilesData[11]
CuantilesA[4,1] <-CuantilesData[5]; CuantilesA[4,2] <-CuantilesData[12]
CuantilesA[5,1] <-CuantilesData[4]; CuantilesA[5,2] <-CuantilesData[13]
CuantilesA[6,1] <-CuantilesData[3]; CuantilesA[6,2] <-CuantilesData[14]
CuantilesA[7,1] <-CuantilesData[2]; CuantilesA[7,2] <-CuantilesData[15]
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
col_sequence <- rainbow(n = 7, alpha = 0.35, start = 0, end = 1)
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2 pEhEx - DATA', lty = 9)
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
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2   pEhEx - ADJUSTED', lty=9)
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
##subsection{Grafica Cuantiles del $65\%$ y $80\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2  pEhEx - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesA[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesA[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesA[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2  BaseMean - ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesD[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesD[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesD[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
#----------------------------------------------------------------------
# #subsection{Grafica Cuantiles del $70\%$ y $85\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence, 
     main = 'Normalized Log2 pEhEx - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesA[2,2], lty=2, col="darkblue")
abline(v=CuantilesA[5,1], lty=2, col="brown"); 
abline(v=CuantilesA[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2  pEhEx - ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesD[2,2], lty=2, col="darkblue")
abline(v=CuantilesD[5,1], lty=2, col="brown"); 
abline(v=CuantilesD[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
#----------------------------------------------------------------------

#===========================================================================
#===========================================================================
log2sample2 <- data1$log2sample2
log2sample2 <- data1$log2sample2; print(mean(log2sample2)); print(sd(log2sample2))
#===========================================================================
head(log2sample2,5)
summary(data1)
ndata1    <- length(log2CDC51)
hist(log2sample2, breaks = nbreaks, col= rainbow(25,0.3), 
     main = 'Log2 sample2')
meanlog2sample2 <- mean(log2sample2); print(meanlog2sample2)
StdDevlog2sample2 <- sd(log2sample2); print(StdDevlog2sample2)
Normlog2sample2 <- (log2sample2-meanlog2sample2)/StdDevlog2sample2; print(Normlog2sample2)
#===========================================================================
tst<- Normlog2sample2
#===========================================================================
hist(tst, breaks = nbreaks, col= 1:5, 
     main = 'Normalized Log2sample1',
     xlab='pEhEx1',
     ylab= 'Frequency pEhEx')
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
print(Cuantilillos)
#----------------------------------------------------------------------
CuantilesA <- matrix(0,8,2)
CuantilesD <- matrix(0,8,2)
colnames(CuantilesA) <- c('LimInf','LimSup')
colnames(CuantilesD) <- c('LimInf','LimSup')
rownames(CuantilesA) <- c('65','70','75','80','85','90','95','99')
rownames(CuantilesD) <- c('65','70','75','80','85','90','95','99')
CuantilesA[1,1] <-CuantilesData[8]; CuantilesA[1,2] <-CuantilesData[9]
CuantilesA[2,1] <-CuantilesData[7]; CuantilesA[2,2] <-CuantilesData[10]
CuantilesA[3,1] <-CuantilesData[6]; CuantilesA[3,2] <-CuantilesData[11]
CuantilesA[4,1] <-CuantilesData[5]; CuantilesA[4,2] <-CuantilesData[12]
CuantilesA[5,1] <-CuantilesData[4]; CuantilesA[5,2] <-CuantilesData[13]
CuantilesA[6,1] <-CuantilesData[3]; CuantilesA[6,2] <-CuantilesData[14]
CuantilesA[7,1] <-CuantilesData[2]; CuantilesA[7,2] <-CuantilesData[15]
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
col_sequence <- rainbow(n = 7, alpha = 0.35, start = 0, end = 1)
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2 pEhEx - DATA (sample 2)', lty = 9)
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
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2   pEhEx - ADJUSTED (sample 2)', lty=9)
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
##subsection{Grafica Cuantiles del $65\%$ y $80\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2  pEhEx - DATA (sample 2)', lty=9)
#===========================================================================
abline(v=CuantilesA[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesA[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesA[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesA[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2  BaseMean - ADJUSTED (sample 2)', lty=9)
#===========================================================================
abline(v=CuantilesD[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesD[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesD[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesD[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
#----------------------------------------------------------------------
# #subsection{Grafica Cuantiles del $70\%$ y $85\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence, 
     main = 'Normalized Log2 pEhEx - DATA (sample 2)', lty=9)
#===========================================================================
abline(v=CuantilesA[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesA[2,2], lty=2, col="darkblue")
abline(v=CuantilesA[5,1], lty=2, col="brown"); 
abline(v=CuantilesA[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2  pEhEx - ADJUSTED (sample 2)', lty=9)
#===========================================================================
abline(v=CuantilesD[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesD[2,2], lty=2, col="darkblue")
abline(v=CuantilesD[5,1], lty=2, col="brown"); 
abline(v=CuantilesD[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
#----------------------------------------------------------------------
#===========================================================================
#===========================================================================
log2sample3 <- data1$log2sample3
log2sample3 <- data1$log2sample3; print(mean(log2sample3)); print(sd(log2sample3))
#===========================================================================
head(log2sample3,5)
summary(data1)
ndata1    <- length(log2CDC51)
hist(log2sample3, breaks = nbreaks, col= rainbow(25,0.3), 
     main = 'Log2 sample2')
meanlog2sample3 <- mean(log2sample3); print(meanlog2sample3)
StdDevlog2sample3 <- sd(log2sample3); print(StdDevlog2sample3)
Normlog2sample3 <- (log2sample3-meanlog2sample3)/StdDevlog2sample3; print(Normlog2sample3)
#===========================================================================
tst<- Normlog2sample3
#===========================================================================
hist(tst, breaks = nbreaks, col= 1:5, 
     main = 'Normalized Log2sample1',
     xlab='pEhEx1',
     ylab= 'Frequency pEhEx')
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
print(Cuantilillos)
#----------------------------------------------------------------------
CuantilesA <- matrix(0,8,2)
CuantilesD <- matrix(0,8,2)
colnames(CuantilesA) <- c('LimInf','LimSup')
colnames(CuantilesD) <- c('LimInf','LimSup')
rownames(CuantilesA) <- c('65','70','75','80','85','90','95','99')
rownames(CuantilesD) <- c('65','70','75','80','85','90','95','99')
CuantilesA[1,1] <-CuantilesData[8]; CuantilesA[1,2] <-CuantilesData[9]
CuantilesA[2,1] <-CuantilesData[7]; CuantilesA[2,2] <-CuantilesData[10]
CuantilesA[3,1] <-CuantilesData[6]; CuantilesA[3,2] <-CuantilesData[11]
CuantilesA[4,1] <-CuantilesData[5]; CuantilesA[4,2] <-CuantilesData[12]
CuantilesA[5,1] <-CuantilesData[4]; CuantilesA[5,2] <-CuantilesData[13]
CuantilesA[6,1] <-CuantilesData[3]; CuantilesA[6,2] <-CuantilesData[14]
CuantilesA[7,1] <-CuantilesData[2]; CuantilesA[7,2] <-CuantilesData[15]
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
col_sequence <- rainbow(n = 7, alpha = 0.35, start = 0, end = 1)
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2 pEhEx - DATA (sample 3)', lty = 9)
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
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2   pEhEx - ADJUSTED (sample 3)', lty=9)
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
##subsection{Grafica Cuantiles del $65\%$ y $80\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2  pEhEx - DATA (sample 2)', lty=9)
#===========================================================================
abline(v=CuantilesA[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesA[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesA[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesA[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2  BaseMean - ADJUSTED (sample 3)', lty=9)
#===========================================================================
abline(v=CuantilesD[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesD[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesD[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesD[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
#----------------------------------------------------------------------
# #subsection{Grafica Cuantiles del $70\%$ y $85\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence, 
     main = 'Normalized Log2 pEhEx - DATA (sample 3)', lty=9)
#===========================================================================
abline(v=CuantilesA[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesA[2,2], lty=2, col="darkblue")
abline(v=CuantilesA[5,1], lty=2, col="brown"); 
abline(v=CuantilesA[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2  pEhEx - ADJUSTED (sample 3)', lty=9)
#===========================================================================
abline(v=CuantilesD[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesD[2,2], lty=2, col="darkblue")
abline(v=CuantilesD[5,1], lty=2, col="brown"); 
abline(v=CuantilesD[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
#----------------------------------------------------------------------
#===========================================================================
#===========================================================================
log2vsCDC51 <- data1$log2samplevsCDC51
log2vsCDC51 <- data1$log2samplevsCDC51; print(mean(log2vsCDC51)); print(sd(log2vsCDC51))
#===========================================================================
head(log2vsCDC51,5)
summary(data1)
ndata1    <- length(log2CDC51)
hist(log2vsCDC51, breaks = nbreaks, col= rainbow(25,0.3), 
     main = 'Log2vsCDC51')
meanlog2vsCDC51 <- mean(log2vsCDC51); print(meanlog2vsCDC51)
StdDevlog2vsCDC51 <- sd(log2vsCDC51); print(StdDevlog2vsCDC51)
Normlog2vsCDC51 <- (log2vsCDC51-meanlog2vsCDC51)/StdDevlog2vsCDC51; print(Normlog2vsCDC51)
#===========================================================================
tst<- Normlog2vsCDC51
#===========================================================================
hist(tst, breaks = nbreaks, col= 1:5, 
     main = 'Normalized Log2vsCDC51',
     xlab='pEhEx1',
     ylab= 'Frequency pEhEx')
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
print(Cuantilillos)
#----------------------------------------------------------------------
CuantilesA <- matrix(0,8,2)
CuantilesD <- matrix(0,8,2)
colnames(CuantilesA) <- c('LimInf','LimSup')
colnames(CuantilesD) <- c('LimInf','LimSup')
rownames(CuantilesA) <- c('65','70','75','80','85','90','95','99')
rownames(CuantilesD) <- c('65','70','75','80','85','90','95','99')
CuantilesA[1,1] <-CuantilesData[8]; CuantilesA[1,2] <-CuantilesData[9]
CuantilesA[2,1] <-CuantilesData[7]; CuantilesA[2,2] <-CuantilesData[10]
CuantilesA[3,1] <-CuantilesData[6]; CuantilesA[3,2] <-CuantilesData[11]
CuantilesA[4,1] <-CuantilesData[5]; CuantilesA[4,2] <-CuantilesData[12]
CuantilesA[5,1] <-CuantilesData[4]; CuantilesA[5,2] <-CuantilesData[13]
CuantilesA[6,1] <-CuantilesData[3]; CuantilesA[6,2] <-CuantilesData[14]
CuantilesA[7,1] <-CuantilesData[2]; CuantilesA[7,2] <-CuantilesData[15]
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
col_sequence <- rainbow(n = 7, alpha = 0.35, start = 0, end = 1)
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC51 pEhEx - DATA', lty = 9)
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
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC51   pEhEx - ADJUSTED', lty=9)
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
##subsection{Grafica Cuantiles del $65\%$ y $80\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC51  pEhEx - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesA[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesA[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesA[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC51  - ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesD[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesD[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesD[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
#----------------------------------------------------------------------
# #subsection{Grafica Cuantiles del $70\%$ y $85\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence, 
     main = 'Normalized Log2vsCDC51 pEhEx - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesA[2,2], lty=2, col="darkblue")
abline(v=CuantilesA[5,1], lty=2, col="brown"); 
abline(v=CuantilesA[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC51  pEhEx - ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesD[2,2], lty=2, col="darkblue")
abline(v=CuantilesD[5,1], lty=2, col="brown"); 
abline(v=CuantilesD[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
#----------------------------------------------------------------------


#===========================================================================
#===========================================================================
log2vsCDC52 <- data1$log2samplevsCDC52
log2vsCDC52 <- data1$log2samplevsCDC52; print(mean(log2vsCDC52)); print(sd(log2vsCDC52))
#===========================================================================
head(log2vsCDC52,5)
summary(data1)
ndata1    <- length(log2CDC52)
hist(log2vsCDC52, breaks = nbreaks, col= rainbow(25,0.3), 
     main = 'Log2vsCDC52')
meanlog2vsCDC52 <- mean(log2vsCDC52); print(meanlog2vsCDC52)
StdDevlog2vsCDC52 <- sd(log2vsCDC52); print(StdDevlog2vsCDC52)
Normlog2vsCDC52 <- (log2vsCDC52-meanlog2vsCDC52)/StdDevlog2vsCDC52; print(Normlog2vsCDC52)
#===========================================================================
tst<- Normlog2vsCDC52
#===========================================================================
hist(tst, breaks = nbreaks, col= 1:5, 
     main = 'Normalized Log2vsCDC52',
     xlab='pEhEx1',
     ylab= 'Frequency pEhEx')
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
print(Cuantilillos)
#----------------------------------------------------------------------
CuantilesA <- matrix(0,8,2)
CuantilesD <- matrix(0,8,2)
colnames(CuantilesA) <- c('LimInf','LimSup')
colnames(CuantilesD) <- c('LimInf','LimSup')
rownames(CuantilesA) <- c('65','70','75','80','85','90','95','99')
rownames(CuantilesD) <- c('65','70','75','80','85','90','95','99')
CuantilesA[1,1] <-CuantilesData[8]; CuantilesA[1,2] <-CuantilesData[9]
CuantilesA[2,1] <-CuantilesData[7]; CuantilesA[2,2] <-CuantilesData[10]
CuantilesA[3,1] <-CuantilesData[6]; CuantilesA[3,2] <-CuantilesData[11]
CuantilesA[4,1] <-CuantilesData[5]; CuantilesA[4,2] <-CuantilesData[12]
CuantilesA[5,1] <-CuantilesData[4]; CuantilesA[5,2] <-CuantilesData[13]
CuantilesA[6,1] <-CuantilesData[3]; CuantilesA[6,2] <-CuantilesData[14]
CuantilesA[7,1] <-CuantilesData[2]; CuantilesA[7,2] <-CuantilesData[15]
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
col_sequence <- rainbow(n = 7, alpha = 0.35, start = 0, end = 1)
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC52 pEhEx - DATA', lty = 9)
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
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC52   pEhEx - ADJUSTED', lty=9)
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
##subsection{Grafica Cuantiles del $65\%$ y $80\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC52  pEhEx - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesA[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesA[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesA[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC52  - ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesD[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesD[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesD[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
#----------------------------------------------------------------------
# #subsection{Grafica Cuantiles del $70\%$ y $85\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence, 
     main = 'Normalized Log2vsCDC52 pEhEx - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesA[2,2], lty=2, col="darkblue")
abline(v=CuantilesA[5,1], lty=2, col="brown"); 
abline(v=CuantilesA[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC52  pEhEx - ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesD[2,2], lty=2, col="darkblue")
abline(v=CuantilesD[5,1], lty=2, col="brown"); 
abline(v=CuantilesD[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
#----------------------------------------------------------------------

#===========================================================================
#===========================================================================
log2vsCDC53 <- data1$log2samplevsCDC53
log2vsCDC53 <- data1$log2samplevsCDC53; print(mean(log2vsCDC53)); print(sd(log2vsCDC53))
#===========================================================================
head(log2vsCDC53,5)
summary(data1)
ndata1    <- length(log2CDC53)
hist(log2vsCDC53, breaks = nbreaks, col= rainbow(25,0.3), 
     main = 'Log2vsCDC53')
meanlog2vsCDC53 <- mean(log2vsCDC53); print(meanlog2vsCDC53)
StdDevlog2vsCDC53 <- sd(log2vsCDC53); print(StdDevlog2vsCDC53)
Normlog2vsCDC53 <- (log2vsCDC53-meanlog2vsCDC53)/StdDevlog2vsCDC53; print(Normlog2vsCDC53)
#===========================================================================
tst<- Normlog2vsCDC53
#===========================================================================
hist(tst, breaks = nbreaks, col= 1:5, 
     main = 'Normalized Log2vsCDC53',
     xlab='pEhEx1',
     ylab= 'Frequency pEhEx')
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
print(Cuantilillos)
#----------------------------------------------------------------------
CuantilesA <- matrix(0,8,2)
CuantilesD <- matrix(0,8,2)
colnames(CuantilesA) <- c('LimInf','LimSup')
colnames(CuantilesD) <- c('LimInf','LimSup')
rownames(CuantilesA) <- c('65','70','75','80','85','90','95','99')
rownames(CuantilesD) <- c('65','70','75','80','85','90','95','99')
CuantilesA[1,1] <-CuantilesData[8]; CuantilesA[1,2] <-CuantilesData[9]
CuantilesA[2,1] <-CuantilesData[7]; CuantilesA[2,2] <-CuantilesData[10]
CuantilesA[3,1] <-CuantilesData[6]; CuantilesA[3,2] <-CuantilesData[11]
CuantilesA[4,1] <-CuantilesData[5]; CuantilesA[4,2] <-CuantilesData[12]
CuantilesA[5,1] <-CuantilesData[4]; CuantilesA[5,2] <-CuantilesData[13]
CuantilesA[6,1] <-CuantilesData[3]; CuantilesA[6,2] <-CuantilesData[14]
CuantilesA[7,1] <-CuantilesData[2]; CuantilesA[7,2] <-CuantilesData[15]
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
col_sequence <- rainbow(n = 7, alpha = 0.35, start = 0, end = 1)
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC53 pEhEx - DATA', lty = 9)
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
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC53   pEhEx - ADJUSTED', lty=9)
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
##subsection{Grafica Cuantiles del $65\%$ y $80\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC53  pEhEx - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesA[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesA[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesA[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC51  - ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[1,1], lty=2, col="darkgoldenrod4"); # 65% INFERIOR
abline(v=CuantilesD[1,2], lty=2, col="darkgoldenrod4"); # 65% SUPERIOR
abline(v=CuantilesD[4,1], lty=2, col="green");  # 80% INFERIOR
abline(v=CuantilesD[4,2], lty=2, col="green"); # 80% SUPERIOR
legend("topright",legend=c("65%","80%"), 
       pch=c(1,2),col=c("darkgoldenrod4","green"))
#----------------------------------------------------------------------
# #subsection{Grafica Cuantiles del $70\%$ y $85\%$}
par(mfrow=c(2,1))
hist(tst, breaks = nbreaks, col = col_sequence, 
     main = 'Normalized Log2vsCDC53 pEhEx - DATA', lty=9)
#===========================================================================
abline(v=CuantilesA[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesA[2,2], lty=2, col="darkblue")
abline(v=CuantilesA[5,1], lty=2, col="brown"); 
abline(v=CuantilesA[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
hist(tst, breaks = nbreaks, col = col_sequence,
     main = 'Normalized Log2vsCDC53  pEhEx - ADJUSTED', lty=9)
#===========================================================================
abline(v=CuantilesD[2,1], lty=2, col="darkblue"); 
abline(v=CuantilesD[2,2], lty=2, col="darkblue")
abline(v=CuantilesD[5,1], lty=2, col="brown"); 
abline(v=CuantilesD[5,2], lty=2, col="brown")
legend("topright",legend=c("70%","85%"),
       pch=c(1,2),#3,4,5,6,7,8),
       col=c("brown"))
#----------------------------------------------------------------------

#===========================================================================
#===========================================================================
