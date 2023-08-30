# Cargar paquetes
library(ShortRead)
library(Biostrings)
library(ggplot2)
# Cambiar el directorio de trabajo
setwd("~/Nextcloud/CMartinezRectoria/Resultados/ArchivosFASTQ")
# Ruta del archivo FASTQ
file_path <- "cdc5_M72h_S21_R1_001.fastq"
# Leer el archivo FASTQ
fastq_data <- readDNAStringSet(file_path, format = "fastq")
fq <- readFastq('cdc5_M72h_S21_R1_001.fastq')
# Obtener el número de secuencias, longitudes y promedio de longitud
num_sequences <- length(fastq_data)
sequence_lengths <- width(fastq_data)
average_length <- mean(sequence_lengths)
# Seleccionar una muestra de secuencias
sample_sequences <- fastq_data[1:100]
sample_names <- names(sample_sequences)
# Imprimir las secuencias de muestra
for (i in seq_along(sample_sequences)) {
  cat(">", sample_names[i], "\n", toString(sample_sequences[i]), "\n")
}
# Visualizar las primeras líneas y hacer un resumen
head(fq)
summary(fq)
# Leer las secuencias de ADN
reads <- sread(fq)
head(reads)
head(fastq_data)
# Obtener las longitudes de las secuencias
widths <- as.data.frame(reads@ranges@width)
# Graficar el histograma de longitudes
ggplot(widths) +
  geom_histogram(aes(x = reads@ranges@width))
# Obtener las puntuaciones de calidad
quals <- quality(fq)
numqscores <- as(quals, 'matrix')
# Calcular el promedio de puntuaciones de calidad
avgscore <- rowMeans(numqscores, na.rm = TRUE)
avgscore <- as.data.frame(avgscore)
# Graficar el histograma de puntuaciones de calidad promedio
ggplot(avgscore) +
  geom_histogram(aes(x = avgscore))
