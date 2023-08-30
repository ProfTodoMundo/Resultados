#setwd("~/Desktop/MiGithub/Resultados/docs")
setwd("~/Documents/GitHub/Resultados/docs")
ruta_carpeta <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/DESeq2_Results"
# Obtener la lista de archivos TXT en la carpeta
archivos_txt <- list.files(ruta_carpeta, pattern = "\\.txt$", full.names = TRUE)
# Imprimir la lista de archivos TXT
print(archivos_txt)
# Obtener solo los nombres de los archivos TXT sin la ruta
nombres_archivos <- basename(archivos_txt)
# Imprimir la lista de nombres de archivos TXT
print(nombres_archivos)
#------------------------------------------------------------------------------------------
# SE COPIAN LOS ARCHIVOS A UN DIRECTORIO DE RESPALDO PARA VALIDAR LAS OPERACIONES
#------------------------------------------------------------------------------------------
ruta_origen <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/DESeq2_Results"
ruta_destino <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
archivos_en_origen <- list.files(ruta_origen, full.names = TRUE)
# Copiar cada archivo al directorio de destino
for (archivo in archivos_en_origen) {
  file.copy(from = archivo, to = ruta_destino)
  cat("Archivo", basename(archivo), "copiado.\n")
}
#------------------------------------------------------------------------------------------
# Clasificacion de los archivos segun su ultimo prefijo
# #------------------------------------------------------------------------------------------
ruta_carpeta_tempo <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
archivos_txt <- list.files(ruta_carpeta_tempo, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos <- basename(archivos_txt)
print(nombres_archivos)
#------------------------------------------------------------------------------------------
## indices_abundances
#------------------------------------------------------------------------------------------
indices_abundances <- grep("Abundances", nombres_archivos)
nombres_con_abundances <- nombres_archivos[indices_abundances]
print(nombres_con_abundances)
n1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances/"
for(archivo in nombres_con_abundances){
  nombre_abundance <- archivo; print(nombre_abundance)
  ruta_origen <- paste0(n1,nombre_abundance); print(ruta_origen)
  ruta_destino <- paste0(m1,nombre_abundance); print(ruta_destino)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(ruta_origen)
}
#------------------------------------------------------------------------------------------
## indices_TOP
#------------------------------------------------------------------------------------------
indices_TOP <- grep("TOP", nombres_archivos)
nombres_con_TOP <- nombres_archivos[indices_TOP]
print(nombres_con_TOP)
n1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/TOP/"
for(archivo in nombres_con_TOP){
  nombre_TOP <- archivo; print(nombre_TOP)
  ruta_origen <- paste0(n1,nombre_TOP); print(ruta_origen)
  ruta_destino <- paste0(m1,nombre_TOP); print(ruta_destino)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(ruta_origen)
}
#------------------------------------------------------------------------------------------
## indices_logFC
#------------------------------------------------------------------------------------------
indices_logFC <- grep("logFC", nombres_archivos)
nombres_con_logFC <- nombres_archivos[indices_logFC]
print(nombres_con_logFC)
n1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/logFC/"
for(archivo in nombres_con_logFC){
  nombre_logFC <- archivo; print(nombre_logFC)
  ruta_origen <- paste0(n1,nombre_logFC); print(ruta_origen)
  ruta_destino <- paste0(m1,nombre_logFC); print(ruta_destino)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(ruta_origen)
}
#------------------------------------------------------------------------------------------
## indices_Intersect
#------------------------------------------------------------------------------------------
indices_Intersect <- grep("Intersect", nombres_archivos)
nombres_con_Intersect <- nombres_archivos[indices_Intersect]
print(nombres_con_Intersect)
n1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Intersect/"
for(archivo in nombres_con_Intersect){
  nombre_Intersect <- archivo; print(nombre_Intersect)
  ruta_origen <- paste0(n1,nombre_Intersect); print(ruta_origen)
  ruta_destino <- paste0(m1,nombre_Intersect); print(ruta_destino)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(ruta_origen)
}
#------------------------------------------------------------------------------------------
## indices_pval
#------------------------------------------------------------------------------------------
indices_pval <- grep("pval", nombres_archivos)
nombres_con_pval <- nombres_archivos[indices_pval]
print(nombres_con_pval)
n1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/pval/"
for(archivo in nombres_con_pval){
  nombre_pval <- archivo; print(nombre_pval)
  ruta_origen <- paste0(n1,nombre_pval); print(ruta_origen)
  ruta_destino <- paste0(m1,nombre_pval); print(ruta_destino)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(ruta_origen)
}
#------------------------------------------------------------------------------------------
## indices_plot
#------------------------------------------------------------------------------------------
# Primero los PNG
#------------------------------------------------------------------------------------------
ruta_carpeta_tempo <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
archivos_png <- list.files(ruta_carpeta_tempo, pattern = "\\.png$", full.names = TRUE)
# Imprimir la lista de archivos png
print(archivos_png)
# Obtener solo los nombres de los archivos png sin la ruta
nombres_archivos <- basename(archivos_png)
# Imprimir la lista de nombres de archivos png
print(nombres_archivos)

indices_plot <- grep("plot", nombres_archivos)
nombres_con_plot <- nombres_archivos[indices_plot]
print(nombres_con_plot)
n1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/plot/"
for(archivo in nombres_con_plot){
  nombre_plot <- archivo; print(nombre_plot)
  ruta_origen <- paste0(n1,nombre_plot); print(ruta_origen)
  ruta_destino <- paste0(m1,nombre_plot); print(ruta_destino)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(ruta_origen)
}
#------------------------------------------------------------------------------------------
# Ahora los tipo pdf
#------------------------------------------------------------------------------------------
#ruta_carpeta_tempo <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
archivos_pdf <- list.files(ruta_carpeta_tempo, pattern = "\\.pdf$", full.names = TRUE)
# Imprimir la lista de archivos pdf
print(archivos_pdf)
# Obtener solo los nombres de los archivos pdf sin la ruta
nombres_archivos <- basename(archivos_pdf)
# Imprimir la lista de nombres de archivos png
print(nombres_archivos)
indices_plot <- grep("plot", nombres_archivos)
nombres_con_plot <- nombres_archivos[indices_plot]
print(nombres_con_plot)
n1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/plot/"
for(archivo in nombres_con_plot){
  nombre_plot <- archivo; print(nombre_plot)
  ruta_origen <- paste0(n1,nombre_plot); print(ruta_origen)
  ruta_destino <- paste0(m1,nombre_plot); print(ruta_destino)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(ruta_origen)
}
#------------------------------------------------------------------------------------------
# Finalmente los archivos restantes
#------------------------------------------------------------------------------------------
ruta_carpeta_tempo <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
archivos_txt <- list.files(ruta_carpeta_tempo, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos <- basename(archivos_txt)
print(nombres_archivos)
n1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Documents/GitHub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Files/"
for(archivo in nombres_archivos){
  nombre_archivo <- archivo; print(nombre_archivo)
  ruta_origen <- paste0(n1,nombre_archivo); print(ruta_origen)
  ruta_destino <- paste0(m1,nombre_archivo); print(ruta_destino)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(ruta_origen)
}
