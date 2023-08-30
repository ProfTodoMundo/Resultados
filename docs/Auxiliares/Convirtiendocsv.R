#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
library(readr)
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
#setwd("~/Desktop/MiGithub/Resultados/docs")
setwd("~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances/")
ruta_carpeta <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances/"
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
# Obtener la lista de archivos TXT en la carpeta
archivos_txt <- list.files(ruta_carpeta, pattern = "\\.txt$", full.names = TRUE)
# Imprimir la lista de archivos TXT
print(archivos_txt)
# Obtener solo los nombres de los archivos TXT sin la ruta
nombres_archivos <- basename(archivos_txt)
# Imprimir la lista de nombres de archivos TXT
print(nombres_archivos)
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
# Procesar cada archivo de texto
ruta_carpeta <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances/"
archivos_txt <- list.files(ruta_carpeta, pattern = "\\.txt$", full.names = TRUE)
for (archivo_txt in archivos_txt) {
  bdd <- read.table(archivo_txt, header = TRUE, sep = "\t", quote = "", comment.char = "")
  nombre_csv <- gsub("\\.txt$", ".csv", basename(archivo_txt))
  mibdd <- as.data.frame(bdd);
  #write.csv(mibdd,nombre_csv)
  write.csv(mibdd, file.path(ruta_carpeta, nombre_csv))  # Utilizar file.path para generar la ruta completa
  cat(paste("Archivo convertido:", nombre_csv, "\n"))
}
cat("Conversión completa.\n")
#<<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>><<==>>
