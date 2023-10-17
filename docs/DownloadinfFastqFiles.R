setwd("~/Documents/GitHub/Resultados/docs")

# URLs de los archivos a descargar
urls <- c(
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/cdc5_M72h_S21_R1_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/cdc5_M72h_S21_R2_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/CDC572h_S20_R1_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/CDC572h_S20_R2_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/EhMyb1072h_S18_R1_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/EhMyb1072h_S18_R2_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/pEhEx72h_S17_R1_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/pEhEx72h_S17_R2_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/U_M72h_S22_R1_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/U_M72h_S22_R2_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/U2AF8472h_S19_R1_001.fastq.gz",
  "https://rgalindor-ehistolytica-firstrun.s3.us-east-2.amazonaws.com/run/U2AF8472h_S19_R2_001.fastq.gz"
)

# Directorio donde guardar los archivos descargados
download_dir <- "~/Documents/GitHub/Resultados/docs/FastqFiles"

# Función para realizar una descarga
download_file <- function(url, dest_dir) {
  file_name <- basename(url)
  download_path <- file.path(dest_dir, file_name)
  message("Descargando:", file_name)
  download.file(url, destfile = download_path, mode = "wb", quiet = TRUE)
  message("Descargado:", file_name)
}

# Loop para descargar los archivos en bloques de tres
block_size <- 3
for (i in seq(1, length(urls), block_size)) {
  end_idx <- min(i + block_size - 1, length(urls))
  urls_block <- urls[i:end_idx]
  
  for (url in urls_block) {
    download_file(url, download_dir)
  }
  
  if (end_idx < length(urls)) {
    message("Esperando 45 segundos...")
    Sys.sleep(45)
  }
}