setwd("~/Desktop/MiGithub/Resultados/docs")
ruta_carpeta <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/DESeq2_Results"
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
ruta_origen <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/DESeq2_Results"
ruta_destino <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
archivos_en_origen <- list.files(ruta_origen, full.names = TRUE)
# Copiar cada archivo al directorio de destino
for (archivo in archivos_en_origen) {
  file.copy(from = archivo, to = ruta_destino)
  cat("Archivo", basename(archivo), "copiado.\n")
}
#------------------------------------------------------------------------------------------
# Clasificacion de los archivos segun su ultimo prefijo
# #------------------------------------------------------------------------------------------
ruta_carpeta_tempo <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
archivos_txt <- list.files(ruta_carpeta_tempo, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos <- basename(archivos_txt)
print(nombres_archivos)
#------------------------------------------------------------------------------------------
## indices_abundances
#------------------------------------------------------------------------------------------
indices_abundances <- grep("Abundances", nombres_archivos)
nombres_con_abundances <- nombres_archivos[indices_abundances]
print(nombres_con_abundances)
n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances/"
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
n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/TOP/"
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
n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/logFC/"
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
n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Intersect/"
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
n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/pval/"
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
ruta_carpeta_tempo <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
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
n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/plot/"
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
#ruta_carpeta_tempo <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
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
n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/plot/"
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
ruta_carpeta_tempo <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
archivos_txt <- list.files(ruta_carpeta_tempo, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos <- basename(archivos_txt)
print(nombres_archivos)
n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Files/"
for(archivo in nombres_archivos){
  nombre_archivo <- archivo; print(nombre_archivo)
  ruta_origen <- paste0(n1,nombre_archivo); print(ruta_origen)
  ruta_destino <- paste0(m1,nombre_archivo); print(ruta_destino)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(ruta_origen)
}
#------------------------------------------------------------------------------------------
# Creacion de las versiones csv de los archivos txt
#------------------------------------------------------------------------------------------
setwd("~/Desktop/MiGithub/Resultados/docs")
#------------------------------------------------------------------------------------------
# Abundances
#------------------------------------------------------------------------------------------
subfolder <- "Abundances"
ruta_carpeta <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/"
ruta_carpeta_subfolder <- paste0(ruta_carpeta,subfolder); print(ruta_carpeta_subfolder)
archivos_txt_subfolder <- list.files(ruta_carpeta_subfolder, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos_subfolder <- basename(archivos_txt_subfolder); print(nombres_archivos_subfolder)
for (archivo in nombres_archivos_subfolder) {
  nombre_archivo <- archivo
  print(nombre_archivo)
  ruta_archivo <- file.path(ruta_carpeta_subfolder, nombre_archivo); print(ruta_archivo)
  # Leer el archivo
  data <- read.table(ruta_archivo, header = TRUE)
  # Crear versión CSV en la misma carpeta
  archivo_csv <- gsub("\\.txt$", ".csv", nombre_archivo)
  ruta_csv_destino <- file.path(ruta_carpeta_subfolder, archivo_csv)
  write.csv(data, file = ruta_csv_destino, row.names = FALSE)
  cat("Versión CSV de", nombre_archivo, "creada.\n")
}
#------------------------------------------------------------------------------------------
# Intersect
#------------------------------------------------------------------------------------------
subfolder <- "Intersect"
ruta_carpeta <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/"
ruta_carpeta_subfolder <- paste0(ruta_carpeta,subfolder); print(ruta_carpeta_subfolder)
archivos_txt_subfolder <- list.files(ruta_carpeta_subfolder, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos_subfolder <- basename(archivos_txt_subfolder); print(nombres_archivos_subfolder)
for (archivo in nombres_archivos_subfolder) {
  nombre_archivo <- archivo
  print(nombre_archivo)
  ruta_archivo <- file.path(ruta_carpeta_subfolder, nombre_archivo); print(ruta_archivo)
  # Leer el archivo
  data <- read.table(ruta_archivo, header = TRUE)
  # Crear versión CSV en la misma carpeta
  archivo_csv <- gsub("\\.txt$", ".csv", nombre_archivo)
  ruta_csv_destino <- file.path(ruta_carpeta_subfolder, archivo_csv)
  write.csv(data, file = ruta_csv_destino, row.names = FALSE)
  cat("Versión CSV de", nombre_archivo, "creada.\n")
}
#------------------------------------------------------------------------------------------
# pval
#------------------------------------------------------------------------------------------
subfolder <- "pval"
ruta_carpeta <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/"
ruta_carpeta_subfolder <- paste0(ruta_carpeta,subfolder); print(ruta_carpeta_subfolder)
archivos_txt_subfolder <- list.files(ruta_carpeta_subfolder, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos_subfolder <- basename(archivos_txt_subfolder); print(nombres_archivos_subfolder)
for (archivo in nombres_archivos_subfolder) {
  nombre_archivo <- archivo
  print(nombre_archivo)
  ruta_archivo <- file.path(ruta_carpeta_subfolder, nombre_archivo); print(ruta_archivo)
  # Leer el archivo
  data <- read.table(ruta_archivo, header = TRUE)
  # Crear versión CSV en la misma carpeta
  archivo_csv <- gsub("\\.txt$", ".csv", nombre_archivo)
  ruta_csv_destino <- file.path(ruta_carpeta_subfolder, archivo_csv)
  write.csv(data, file = ruta_csv_destino, row.names = FALSE)
  cat("Versión CSV de", nombre_archivo, "creada.\n")
}
#------------------------------------------------------------------------------------------
# logFC
#------------------------------------------------------------------------------------------
subfolder <- "logFC"
ruta_carpeta <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/"
ruta_carpeta_subfolder <- paste0(ruta_carpeta,subfolder); print(ruta_carpeta_subfolder)
archivos_txt_subfolder <- list.files(ruta_carpeta_subfolder, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos_subfolder <- basename(archivos_txt_subfolder); print(nombres_archivos_subfolder)
for (archivo in nombres_archivos_subfolder) {
  nombre_archivo <- archivo
  print(nombre_archivo)
  ruta_archivo <- file.path(ruta_carpeta_subfolder, nombre_archivo); print(ruta_archivo)
  # Leer el archivo
  data <- read.table(ruta_archivo, header = TRUE)
  # Crear versión CSV en la misma carpeta
  archivo_csv <- gsub("\\.txt$", ".csv", nombre_archivo)
  ruta_csv_destino <- file.path(ruta_carpeta_subfolder, archivo_csv)
  write.csv(data, file = ruta_csv_destino, row.names = FALSE)
  cat("Versión CSV de", nombre_archivo, "creada.\n")
}
#------------------------------------------------------------------------------------------
# TOP
#------------------------------------------------------------------------------------------
subfolder <- "TOP"
ruta_carpeta <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/"
ruta_carpeta_subfolder <- paste0(ruta_carpeta,subfolder); print(ruta_carpeta_subfolder)
archivos_txt_subfolder <- list.files(ruta_carpeta_subfolder, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos_subfolder <- basename(archivos_txt_subfolder); print(nombres_archivos_subfolder)
for (archivo in nombres_archivos_subfolder) {
  nombre_archivo <- archivo
  print(nombre_archivo)
  ruta_archivo <- file.path(ruta_carpeta_subfolder, nombre_archivo); print(ruta_archivo)
  # Leer el archivo
  data <- read.table(ruta_archivo, header = TRUE)
  # Crear versión CSV en la misma carpeta
  archivo_csv <- gsub("\\.txt$", ".csv", nombre_archivo)
  ruta_csv_destino <- file.path(ruta_carpeta_subfolder, archivo_csv)
  write.csv(data, file = ruta_csv_destino, row.names = FALSE)
  cat("Versión CSV de", nombre_archivo, "creada.\n")
}
#------------------------------------------------------------------------------------------
# Files
#------------------------------------------------------------------------------------------
subfolder <- "Files"
ruta_carpeta <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/"
ruta_carpeta_subfolder <- paste0(ruta_carpeta,subfolder); print(ruta_carpeta_subfolder)
archivos_txt_subfolder <- list.files(ruta_carpeta_subfolder, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos_subfolder <- basename(archivos_txt_subfolder); print(nombres_archivos_subfolder)
for (archivo in nombres_archivos_subfolder) {
  nombre_archivo <- archivo
  print(nombre_archivo)
  ruta_archivo <- file.path(ruta_carpeta_subfolder, nombre_archivo); print(ruta_archivo)
  # Leer el archivo
  data <- read.table(ruta_archivo, header = TRUE)
  # Crear versión CSV en la misma carpeta
  archivo_csv <- gsub("\\.txt$", ".csv", nombre_archivo)
  ruta_csv_destino <- file.path(ruta_carpeta_subfolder, archivo_csv)
  write.csv(data, file = ruta_csv_destino, row.names = FALSE)
  cat("Versión CSV de", nombre_archivo, "creada.\n")
}
#------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------
# Directorio base y subdirectorios
#------------------------------------------------------------------------------------------
library(readr)
#----------------------------------------------------------------------
setwd("~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando")
subfolders <- c("Abundances", "Intersect", "logFC","Files","pval","TOP")  
#----------------------------------------------------------------------
# Ruta a la carpeta principal
carpeta_principal <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando"
# Crear una lista para almacenar los datos de cada subfolder
listas_por_subfolder <- list()
# Iterar a través de los subfolders
for (subfolder in subfolders) {
  ruta_subfolder <- file.path(carpeta_principal, subfolder)
  archivos_csv <- list.files(path = ruta_subfolder, pattern = "\\.csv$", full.names = TRUE)
  contenido_subfolder <- lapply(archivos_csv, read.csv)
  # Guardar la lista con el nombre lista_nombresubfolder en un archivo .RData en el subfolder
  nombre_archivo <- paste0("lista_", subfolder, ".RData")
  save(contenido_subfolder, file = file.path(ruta_subfolder, nombre_archivo))
  # Almacenar la ruta al archivo .RData en la lista de subfolders
  listas_por_subfolder[[subfolder]] <- file.path(ruta_subfolder, nombre_archivo)
}
#----------------------------------------------------------------------
# Ruta completa al archivo donde se almacenará listas_por_subfolder.RData
ruta_archivo_listas <- file.path(carpeta_principal, "listas_PrimeroDiffExpAnalysis.RData")
# Guardar la variable listas_por_subfolder en el archivo .RData
save(listas_por_subfolder, file = ruta_archivo_listas)
#----------------------------------------------------------------------
# Ruta completa al archivo .RData
setwd("~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando")
# Ruta completa al archivo .RData
ListaPrincipal <- "listas_PrimeroDiffExpAnalysis.RData"
# Cargar el contenido del archivo .RData
load(ListaPrincipal)

print(listas_por_subfolder)
# Iterar a través de las claves de las subcarpetas en listas_por_subfolder
for (subfolder in names(listas_por_subfolder)) {
  ruta_archivo <- listas_por_subfolder[[subfolder]]
  # Cargar el contenido del archivo .RData
  load(ruta_archivo)
  # Imprimir un resumen del contenido de la sublista
  cat("Resumen del contenido en el subfolder:", subfolder, "\n")
  for (i in seq_along(contenido_subfolder)) {
    cat("Elemento", i, ":\n")
    print(summary(contenido_subfolder[[i]]))
    cat("\n")
  }
}
#----------------------------------------------------------------------
#
# Crear un archivo de texto para almacenar los resultados
archivo_resultados <- file("ResultsFirstAnalysis.txt", open = "wt")

for (subfolder in names(listas_por_subfolder)) {
  ruta_archivo <- listas_por_subfolder[[subfolder]]
  # Cargar el contenido del archivo .RData
  load(ruta_archivo)
  # Escribir el encabezado del subfolder en el archivo de resultados
  writeLines(paste("Resumen del contenido en el subfolder:", subfolder), archivo_resultados)
  for (i in seq_along(contenido_subfolder)) {
    # Escribir el encabezado del elemento en el archivo de resultados
    writeLines(paste("Elemento", i, ":"), archivo_resultados)
    # Capturar el resumen en lugar de imprimirlo directamente
    resumen <- capture.output(summary(contenido_subfolder[[i]]))
    # Escribir el resumen en el archivo de resultados
    writeLines(resumen, archivo_resultados)
    writeLines("", archivo_resultados)  # Línea en blanco para separar los resúmenes
  }
}
# Cerrar el archivo de resultados
close(archivo_resultados)

