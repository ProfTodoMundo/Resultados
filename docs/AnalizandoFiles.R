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
setwd("~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Files")
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
load("ColsCorrectedChackpoint.RData")
#----------------------------------------------------------------------
View(pEhExvsCDC5)
View(pEhExvsCmasM)
View(pEhExvsEhMyb10)
View(pEhExvsU2AF84)
View(pEhExvsUmasM)
#----------------------------------------------------------------------
#----------------------------------------------------------------------
data1 <- pEhExvsCDC5
Log2data1 <- data1$log2FoldChange
head(Log2data1,5)

