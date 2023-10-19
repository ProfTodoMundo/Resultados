#----------------------------------------------------------------------
#setwd("C:/HeathMaps/Resultados-main/Resultados-main/docs/TerceroDiffExpAllResults/GraficosAdicionales")
setwd("~/Desktop/MiGithub/Resultados/docs/TerceroDiffExpAllResults/GraficosAdicionales/")
#----------------------------------------------------------------------
#setwd("C:/HeathMaps/Resultados-main/Resultados-main/docs/TerceroDiffExpAllResults/GraficosAdicionales")
load("ColsCorrectedChackpoint.RData")
#----------------------------------------------------------------------
View(pEhExvsCDC5)
#----------------------------------------------------------------------
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
cdc5_norm     <- (cdc5_prom-mean(cdc5_prom))/mean(cdc5_prom); 
pehex_norm    <- (pehex_prom-mean(pehex_prom))/mean(pehex_prom);
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

#----------------------------------------------------------------------
log2cdc5       <- log2(cdc5_prom+1)
log2pehex      <- log2(pehex_prom+1)
dtp1           <- cbind(log2pehex,log2cdc5); View(dtp1)
colnames(dtp1) <- c("control","EhCDC5-Like")
boxplot(dtp1,col = rainbow(ncol(dtp1)))