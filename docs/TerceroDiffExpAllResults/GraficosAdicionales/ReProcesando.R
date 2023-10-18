#----------------------------------------------------------------------
setwd("~/Desktop/MiGithub/Resultados/docs/TerceroDiffExpAllResults/GraficosAdicionales/")
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
setwd("~/Desktop/MiGithub/Resultados/docs/TerceroDiffExpAllResults/GraficosAdicionales/")
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

dataCDC5 <- as.data.frame(pEhExvsCDC5[,"log2FoldChange"])
dataEhMyb10 <- as.data.frame(pEhExvsEhMyb10[,"log2FoldChange"])

n1 <- length(dataCDC5[[1]])
n2 <- length(dataEhMyb10[[1]])
# Asegúrate de que ambos conjuntos de datos tengan la misma longitud
n <- min(n1,n2)

dataCDC5_sampled <- sample(dataCDC5[[1]], size = n)
dataEhMyb10_sampled <- sample(dataEhMyb10[[1]], size = n)
dataSampled <- cbind(dataCDC5_sampled,dataEhMyb10_sampled); View(dataSampled)
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
# Crear un dataframe con los datos muestreados y etiquetas
data_df <- data.frame(
  Conjunto_de_Datos = rep(c("CDC5", "EhMyb10"), each = n),
  Valor = c(dataCDC5_sampled, dataEhMyb10_sampled)
)

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

