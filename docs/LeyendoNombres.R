# Ruta de la carpeta
setwd("~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina")

ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/PrimeroDiffExpAllResults/DataAnalysis_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/PrimeroDiffExpAllResults/DESeq2_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/PrimeroDiffExpAllResults/edgeR_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/PrimeroDiffExpAllResults/limma_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/PrimeroDiffExpAllResults/NOISeq_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/PrimeroDiffExpAllResults/VennDiagram_Results"

ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/SegundoDiffExpAllResults/DataAnalysis_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/SegundoDiffExpAllResults/DESeq2_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/SegundoDiffExpAllResults/edgeR_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/SegundoDiffExpAllResults/limma_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/SegundoDiffExpAllResults/NOISeq_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/SegundoDiffExpAllResults/VennDiagram_Results"

ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/TerceroDiffExpAllResults/DataAnalysis_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/TerceroDiffExpAllResults/DESeq2_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/TerceroDiffExpAllResults/edgeR_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/TerceroDiffExpAllResults/limma_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/TerceroDiffExpAllResults/NOISeq_Results"
ruta_carpeta <- "~/Nextcloud/CMartinezRectoria/ArchivosUNAM/Pagina/TerceroDiffExpAllResults/VennDiagram_Results"


# Lista de archivos en la carpeta
archivos <- list.files(path = ruta_carpeta, full.names = TRUE)

# Extraer nombres con extensiones
nombres_extensiones <- basename(archivos)

# Imprimir los nombres con extensiones
print(nombres_extensiones)
# - - - - - - - - - - - - -- - - - - - - - -- - - - - - - - - - - - - - - - - - -
# Lista de archivos con extensión .txt en la carpeta
archivos_txt <- list.files(path = ruta_carpeta, pattern = "\\.txt$", full.names = TRUE)

# Extraer nombres con extensiones
nombres_TXT <- as.data.frame(basename(archivos_txt))

# Imprimir los nombres con extensiones
print(nombres_TXT)
# - - - - - - - - - - - - -- - - - - - - - -- - - - - - - - - - - - - - - - - - -
# Lista de archivos con extensión .txt en la carpeta
archivos_png <- list.files(path = ruta_carpeta, pattern = "\\.png$", full.names = TRUE)

# Extraer nombres con extensiones
nombres_png <- as.data.frame(basename(archivos_png))

# Imprimir los nombres con extensiones
print(nombres_png)
# - - - - - - - - - - - - -- - - - - - - - -- - - - - - - - - - - - - - - - - - -
# Lista de archivos con extensión .txt en la carpeta
archivos_tiff <- list.files(path = ruta_carpeta, pattern = "\\.tiff$", full.names = TRUE)

# Extraer nombres con extensiones
nombres_tiff <- as.data.frame(basename(archivos_tiff))

# Imprimir los nombres con extensiones
print(nombres_tiff)
