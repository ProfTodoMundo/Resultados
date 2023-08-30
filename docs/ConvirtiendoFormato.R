# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>
library(ShortRead)
library(GenomicAlignments)
library(Rsamtools)
# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>
setwd("~/Nextcloud/CMartinezRectoria/Resultados/ArchivosFASTQ")
# Ruta de la carpeta que contiene los archivos fastq.gz
carpeta <- "~/Nextcloud/CMartinezRectoria/Resultados/ArchivosFASTQ"
# Obtener la lista de archivos fastq.gz en la carpeta
archivos <- list.files(carpeta, pattern = ".fastq.gz$", full.names = TRUE)
# << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >> << >>
# Tiempo de espera entre iteraciones (en segundos)
wtime <- 0.25 * 60  # 15 segundos
# Leer y descomprimir los archivos
for (i in seq_along(archivos)) {
  archivo <- archivos[i]
  # Obtener el nombre del archivo sin la extensión .gz
  archivo_descomprimido <- gsub(".fastq.gz$", ".fastq", archivo)
  # Leer y descomprimir el archivo
  fq <- readFastq(archivo, param = ScanBamParam(gz = TRUE))
  # Guardar el archivo descomprimido
  writeFastq(fq, archivo_descomprimido, compress = FALSE)
  # Imprimir el nombre del archivo descomprimido y el número de iteración
  cat("Iteración", i, "- Archivo descomprimido:", archivo_descomprimido, "\n")
  # Pausa entre iteraciones
  if (i < length(archivos)) {
    Sys.sleep(wtime)
  }
}
