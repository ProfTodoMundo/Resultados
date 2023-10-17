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
load("ColsCorrectedChackpoint.RData")
#----------------------------------------------------------------------
View(pEhExvsCDC5)
View(pEhExvsCmasM)
View(pEhExvsEhMyb10)
View(pEhExvsU2AF84)
View(pEhExvsUmasM)
#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

#----------------------------------------------------------------------

