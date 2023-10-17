#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
setwd("~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances")
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
Mis_archivos <- list.files(pattern = "\\.csv$", full.names = TRUE)
print(Mis_archivos)
nombres_archivos <- basename(Mis_archivos)
print(nombres_archivos)
#----------------------------------------------------------------------
pEhExvsCDC5    <- read_csv("pEhExvsCDC5_Abundances.csv"); 
pEhExvsCmasM   <- read_csv("pEhExvsCmasM_Abundances.csv")
pEhExvsEhMyb10 <- read_csv("pEhExvsEhMyb10_Abundances.csv");
pEhExvsU2AF84  <- read_csv("pEhExvsU2AF84_Abundances.csv")
pEhExvsUmasM   <- read_csv("pEhExvsUmasM_Abundances.csv") 
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
View(pEhExvsCDC5);    View(pEhExvsCmasM);  View(pEhExvsEhMyb10)
View(pEhExvsU2AF84);  View(pEhExvsUmasM);
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
nombresvsCDC5 <- colnames(pEhExvsCDC5)
nombres_extendidos <- c('GenId',nombresvsCDC5[-1])
colnames(pEhExvsCDC5) <- nombres_extendidos; View(pEhExvsCDC5)
#----------------------------------------------------------------------
nombresvsCmasM <- colnames(pEhExvsCmasM)
nombres_extendidos <- c('GenId',nombresvsCDC5[-1])
colnames(pEhExvsCmasM) <- nombres_extendidos; View(pEhExvsCmasM)
#----------------------------------------------------------------------
nombresvsEhMyb10 <- colnames(pEhExvsEhMyb10)
nombres_extendidos <- c('GenId',nombresvsCDC5[-1])
colnames(pEhExvsEhMyb10) <- nombres_extendidos; View(pEhExvsEhMyb10)
#----------------------------------------------------------------------
nombresvsU2AF84 <- colnames(pEhExvsU2AF84)
nombres_extendidos <- c('GenId',nombresvsCDC5[-1])
colnames(pEhExvsU2AF84) <- nombres_extendidos; View(pEhExvsU2AF84)
#----------------------------------------------------------------------
nombresvsUmasM <- colnames(pEhExvsUmasM)
nombres_extendidos <- c('GenId',nombresvsUmasM[-1])
colnames(pEhExvsUmasM) <- nombres_extendidos; View(pEhExvsUmasM)
#----------------------------------------------------------------------
save.image('CheackPointOne.RData')
