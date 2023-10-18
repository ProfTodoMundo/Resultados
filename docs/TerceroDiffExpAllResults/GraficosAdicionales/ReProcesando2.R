#----------------------------------------------------------------------
setwd("C:/HeathMaps/Resultados-main/Resultados-main/docs/TerceroDiffExpAllResults/GraficosAdicionales")
#setwd("~/Desktop/MiGithub/Resultados/docs/TerceroDiffExpAllResults/GraficosAdicionales/")
#----------------------------------------------------------------------
Mis_archivos <- list.files(pattern = "\\.csv$", full.names = TRUE)
print(Mis_archivos)
nombres_archivos <- basename(Mis_archivos)
print(nombres_archivos)
#----------------------------------------------------------------------
library(readr)
library(ggplot2)
#----------------------------------------------------------------------
pEhExvsCDC5 <- read_csv("pEhExvsCDC5.csv");         pEhExvsCmasM <- read_csv("pEhExvsCmasM.csv")
pEhExvsEhMyb10 <- read_csv("pEhExvsEhMyb10.csv");   pEhExvsU2AF84 <- read_csv("pEhExvsU2AF84.csv")
pEhExvsUmasM <- read_csv("pEhExvsUmasM.csv") 
#----------------------------------------------------------------------
View(pEhExvsCDC5);      View(pEhExvsCmasM)
View(pEhExvsEhMyb10);   View(pEhExvsU2AF84);  View(pEhExvsUmasM)
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsCDC5); print(nombres_col)
summary(pEhExvsCDC5)
colnames(pEhExvsCDC5) <- c("GenId", "baseMean","log2FoldChange","lfcSE",
                           "stat", "pvalue", "padj", "CDC5_1", "CDC5_2",
                           "pEhEx_1", "pEhEx_2","CDC5_1.1", "CDC5_2.1",
                           "pEhEx_1.1","pEhEx_2.1", "Certeza", "DE")
write.csv(pEhExvsCDC5,"pEhExvsCDC5corr.csv")
View(pEhExvsCDC5)
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsCmasM); print(nombres_col)
summary(pEhExvsCmasM)
colnames(pEhExvsCmasM) <- c("GenId", "baseMean","log2FoldChange","lfcSE",
                            "stat", "pvalue", "padj", "CMasM_1", "CMasM_2",
                            "pEhEx_1", "pEhEx_2", "CMasM_1.1", "CMasM_2.1",
                            "pEhEx_1.1","pEhEx_2.1", "Certeza", "DE")
write.csv(pEhExvsCmasM,"pEhExvsCmasMcorr.csv")
View(pEhExvsCmasM)
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsEhMyb10); print(nombres_col)
summary(pEhExvsEhMyb10)
colnames(pEhExvsEhMyb10) <- c("GenId", "baseMean","log2FoldChange","lfcSE",
                              "stat", "pvalue", "padj", "EhMyb10_1", "EhMyb10_2",
                              "pEhEx_1", "pEhEx_2","EhMyb10_1.1", "EhMyb10_2.1",
                              "pEhEx_1.1","pEhEx_2.1", "Certeza", "DE")
write.csv(pEhExvsEhMyb10,"pEhExvsEhMyb10corr.csv")
View(pEhExvsEhMyb10)
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsU2AF84); print(nombres_col)
summary(pEhExvsU2AF84)
colnames(pEhExvsU2AF84) <- c("Num","GenId", "baseMean","log2FoldChange","lfcSE",
                             "stat", "pvalue", "padj", "U2AF84_1", "U2AF84_2",
                             "pEhEx_1", "pEhEx_2","U2AF84_1.1", "U2AF84_2.1",
                             "pEhEx_1.1","pEhEx_2.1", "Certeza", "DE")
write.csv(pEhExvsU2AF84,"pEhExvsU2AF84corr.csv")
View(pEhExvsU2AF84)
pEhExvsU2AF84<- pEhExvsU2AF84[,2:18]; View(pEhExvsU2AF84)
write.csv(pEhExvsU2AF84,"pEhExvsU2AF84corr.csv")
#----------------------------------------------------------------------
nombres_col <- colnames(pEhExvsUmasM); print(nombres_col)
summary(pEhExvsUmasM)
colnames(pEhExvsUmasM) <- c("GenId", "baseMean","log2FoldChange","lfcSE",
                            "stat", "pvalue", "padj", "UmasM_1", "UmasM_2",
                            "pEhEx_1", "pEhEx_2","UmasM_1.1", "UmasM_2.1", 
                            "pEhEx_1.1","pEhEx_2.1", "Certeza", "DE")
write.csv(pEhExvsUmasM,"pEhExvsUmasMcorr.csv")
View(pEhExvsUmasM)
#----------------------------------------------------------------------
save.image("ColsCorrectedChackpoint.RData")
#----------------------------------------------------------------------
#----------------------------------------------------------------------
#setwd("~/Desktop/MiGithub/Resultados/docs/TerceroDiffExpAllResults/GraficosAdicionales/")
setwd("C:/HeathMaps/Resultados-main/Resultados-main/docs/TerceroDiffExpAllResults/GraficosAdicionales")
load("ColsCorrectedChackpoint.RData")
#----------------------------------------------------------------------
View(pEhExvsCDC5)
View(pEhExvsCmasM)
View(pEhExvsEhMyb10)
View(pEhExvsU2AF84)
View(pEhExvsUmasM)
#----------------------------------------------------------------------
# Carga la biblioteca ggplot2
library(ggplot2)
library(tidyr)
#----------------------------------------------------------------------
dataCDC5 <- as.data.frame(pEhExvsCDC5); View(dataCDC5)
#----------------------------------------------------------------------
cdc51 <- dataCDC5[,8]; head(cdc51)
cdc52 <- dataCDC5[,9]; head(cdc52)
pehex1 <- dataCDC5[,10]; head(pehex1)
pehex2 <- dataCDC5[,11]; head(pehex2)
#----------------------------------------------------------------------
cdc5_prom      <- (cdc51+cdc52)/2;   head(cdc5_prom)
pehex_prom     <- (pehex1+pehex2)/2; head(pehex_prom)
log2cdc5       <- log2(cdc5_prom+1)
log2pehex      <- log2(pehex_prom+1)
dtp1           <- cbind(log2pehex,log2cdc5); View(dtp1)
colnames(dtp1) <- c("control","EhCDC5-Like")
boxplot(dtp1,col = rainbow(ncol(dtp1)))
#----------------------------------------------------------------------
cdc5_qnorm     <- (cdc5_prom-mean(cdc5_prom))
pehex_qnorm    <- (pehex_prom-mean(pehex_prom))
log2cdc5qnorm  <- log2(cdc5_qnorm+1)
log2pehexqnorm <- log2(pehex_qnorm+1)
dtp2           <- cbind(log2pehexqnorm,log2cdc5qnorm); View(dtp2)
colnames(dtp2) <- c("control","EhCDC5-Like")
boxplot(dtp2,col = rainbow(ncol(dtp2)))
#----------------------------------------------------------------------
cdc5_norm     <- (cdc5_prom-mean(cdc5_prom))/sd(cdc5_prom)
pehex_norm    <- (pehex_prom-mean(pehex_prom))/sd(pehex_prom)
log2cdc5norm   <- log2(cdc5_norm+1)
log2pehexnorm  <- log2(pehex_norm+1)
dtp3           <- cbind(log2pehexnorm,log2cdc5norm); View(dtp3)
colnames(dtp3) <- c("control","EhCDC5-Like")
boxplot(dtp3,col = rainbow(ncol(dtp3)))
#----------------------------------------------------------------------




cdc5_prom <- (cdc51+cdc52)/2;    head(cdc5_prom)
cdc5Norm  <- (cdc5_prom-mean(cdc5_prom))/sd(cdc5_prom)
Log2cdc5  <- log2(cdc5Norm+1);   head(Log2cdc5)
pehex_prom <- (pehex1+pehex2)/2; head(pehex_prom)
pehexNorm <- (pehex_prom-mean(pehex_prom))/sd(pehex_prom)
Log2pehex <- log2(pehexNorm+1); head(Log2pehex)

DTP <- cbind(Log2cdc5,Log2pehex);
boxplot(DTP)
#----------------------------------------------------------------------
cdc5_prom <- (cdc51+cdc52)/2;    head(cdc5_prom)
cdc5Norm  <- (cdc5_prom-mean(cdc5_prom))
Log2cdc5  <- log2(cdc5Norm+1);   head(Log2cdc5)
pehex_prom <- (pehex1+pehex2)/2; head(pehex_prom)
pehexNorm <- (pehex_prom-mean(pehex_prom))
Log2pehex <- log2(pehexNorm+1); head(Log2pehex)
DTP <- cbind(Log2cdc5,Log2pehex);
boxplot(DTP)
#----------------------------------------------------------------------
cdc5_prom <- (cdc51+cdc52)/2;    head(cdc5_prom)
cdc5Norm  <- (cdc5_prom-mean(cdc5_prom))/sd(cdc5_prom)
Log2cdc5  <- log2(cdc5Norm+1);   head(Log2cdc5)
pehex_prom <- (pehex1+pehex2)/2; head(pehex_prom)
pehexNorm <- (pehex_prom-mean(pehex_prom))/sd(pehex_prom)
Log2pehex <- log2(pehexNorm+1); head(Log2pehex)
DTP <- cbind(Log2cdc5,Log2pehex);
boxplot(DTP)
#----------------------------------------------------------------------

DataToPlot <- cbind(Log2cdc5,Log2pehex,cdc51,cdc52,pehex1,pehex2);
DataToPlot <- as.data.frame(DataToPlot); View(DataToPlot)
boxplot(DataToPlot,col = rainbow(ncol(DataToPlot)))
#----------------------------------------------------------------------
cdc51_norm <- (cdc51-mean(cdc51))/sd(cdc51)
cdc52_norm <- (cdc52-mean(cdc52))/sd(cdc52)
Log2cdc51 <- log2(cdc51_norm+1)
Log2cdc52 <- log2(cdc52_norm+1)
pehex1_norm <- (pehex1-mean(pehex1))/sd(pehex1); 
pehex2_norm <- (pehex2-mean(pehex2))/sd(pehex2);
Log2pehex1 <- log2(pehex1_norm+1)
Log2pehex2 <- log2(pehex2_norm+1)
DataToPlot<- cbind(Log2cdc51,Log2pehex1,Log2cdc52,Log2pehex2,Log2cdc5,Log2pehex)
View(DataToPlot)
boxplot(DataToPlot,col = rainbow(ncol(DataToPlot)))
DataToPlot2 <- DataToPlot[,5:6]; View(DataToPlot2)
boxplot(DataToPlot2,col = rainbow(ncol(DataToPlot2)))
#----------------------------------------------------------------------
boxplot(DataToPlot,
        col = rainbow(ncol(DataToPlot)))




boxplot(DataToPlot, # Datos
        horizontal = FALSE, # Horizontal o vertical
        lwd = 2, # Lines width
        col = rgb(1, 0, 0, alpha = 0.4), # Color
        xlab = "Etiqueta eje X",  # Etiqueta eje X
        ylab = "Etiqueta eje Y",  # Etiqueta eje Y
        main = "Boxplot personalizado en R base", # Título
        notch = TRUE, # Añade intervalos de confianza para la mediana
        border = "black",  # Color del borde del boxplot
#        outpch = 25,       # Símbolo para los outliers
        #outbg = "green",   # Color de los datos atípicos
        whiskcol = "blue", # Color de los bigotes
        whisklty = 2,      # Tipo de línea para los bigotes
        lty = 1) # Tipo de línea (caja y mediana)

# Agregamos una leyenda
legend("topright", legend = "Boxplot", # Posición y título
       fill = rgb(1, 0, 0, alpha = 0.4),  # Color
       inset = c(0.03, 0.05), # Cambiamos los márgenes
       bg = "white") # Color de fondo de la leyenda


dataCDC5_sampled <- sample(dataCDC5[[1]], size = n)
dataEhMyb10_sampled <- sample(dataEhMyb10[[1]], size = n)
dataSampled <- cbind(dataCDC5_sampled,dataEhMyb10_sampled); View(dataSampled)
#----------------------------------------------------------------------
# Crear un dataframe con los datos muestreados y etiquetas
data_df <- data.frame(
  Conjunto_de_Datos = rep(c("CDC5", "EhMyb10"), each = n),
  Valor = c(dataCDC5_sampled, dataEhMyb10_sampled))
# Crear el gráfico con ggplot2
ggplot(data_df, aes(x = Conjunto_de_Datos, y = Valor, fill = Conjunto_de_Datos)) +
  geom_boxplot() +
  labs(title = "Gráfico de Caja y Brazos", x = "Conjunto de Datos", y = "Valor") +
  scale_x_discrete(labels = c("CDC5" = "CDC5", "EhMyb10" = "EhMyb10")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        panel.background = element_rect(fill = "whitesmoke"))
#----------------------------------------------------------------------
#----------------------------------------------------------------------





#----------------------------------------------------------------------
#----------------------------------------------------------------------
boxplot(dataSampled, names = c("CDC5", "EhMyb10"), col = c("blue", "red"), main = "Gráfico de Caja y Brazos",
        xlab = "Conjunto de Datos", ylab = "Valor")
axis(1, at = 1:2, labels = c("CDC5", "EhMyb10"), las = 2, cex.axis = 0.8)

#----------------------------------------------------------------------
# Crea el gráfico de caja y brazos con nombres inclinados en el eje X
boxplot(dataSampled, names = c("", ""), col = c("blue", "red"), main = "Gráfico de Caja y Brazos",
        xlab = "Conjunto de Datos", ylab = "Valor")

# Inclina los nombres en el eje X en 60 grados
axis(1, at = 1:2, labels = c("CDC5", "EhMyb10"), las = 2, cex.axis = 0.8)

#----------------------------------------------------------------------
# Crea el gráfico de caja y brazos con nombres inclinados en el eje X (45 grados)
boxplot(dataSampled, names = c("CDC5", "EhMyb10"), col = c("blue", "red"), main = "Gráfico de Caja y Brazos",
        xlab = "Conjunto de Datos", ylab = "Valor")

# Inclina los nombres en el eje X en 45 grados
axis(1, at = 1:2, labels = c("CDC5", "EhMyb10"), las = 2, cex.axis = 0.8, tck = 0.02)


#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

