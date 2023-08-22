setwd("~/Desktop/MiGithub/Resultados/docs")
ruta_carpeta <- "PrimeroDiffExpAllResults/DESeq2_Results"

# Obtener la lista de archivos TXT en la carpeta
archivos_txt <- list.files(ruta_carpeta, pattern = "\\.txt$", full.names = TRUE)

# Imprimir la lista de archivos TXT
print(archivos_txt)

# Obtener solo los nombres de los archivos TXT sin la ruta
nombres_archivos <- basename(archivos_txt)

# Imprimir la lista de nombres de archivos TXT
print(nombres_archivos)


# Clasificacion de los archivos segun su ultimo prefijo

ruta_carpeta_tempo <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo"
archivos_txt <- list.files(ruta_carpeta, pattern = "\\.txt$", full.names = TRUE)
nombres_archivos <- basename(archivos_txt)
print(nombres_archivos)


# indices_abundances

indices_abundances <- grep("Abundances", nombres_archivos)
nombres_con_abundances <- nombres_archivos[indices_abundances]
print(nombres_con_abundances)
nombre_abundance <- nombres_con_abundances[1]; print(nombre_abundance)


n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
n2 <- nombre_abundance
n <- paste0(n1,n2); print(n)
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances/"
m <- paste0(m1,n2); print(m)

ruta_origen <- n
ruta_destino <- m

# Copiar el archivo al destino
file.copy(from = ruta_origen, to = ruta_destino)
# Eliminar el archivo de origen después de copiarlo
file.remove(ruta_origen)

n1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Tempo/"
m1 <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/Clasificando/Abundances/"
for(archivo in nombres_con_abundances){
  nombre_abundance <- archivo; print(nombre_abundance)
  ruta_origen <- paste0(n1,nombre_abundance); print(n)
  ruta_destino <- paste0(m1,nombre_abundance); print(m)
  file.copy(from = ruta_origen, to = ruta_destino)
  file.remove(n)
}



## Codigo correcto

 





indices_TOP

indices_logFC

indices_Intersect

indices_pval



"pEhExvsCDC5_Abundances.txt"   
"pEhExvsCmasM_Abundances.txt"  


"pEhExvsCDC5_Intersect.txt"    
"pEhExvsCmasM_Intersect.txt"   



"pEhExvsCDC5_logFC.txt"      
"pEhExvsCmasM_logFC.txt"   


"pEhExvsCDC5_pval.txt"         
"pEhExvsCmasM_pval.txt"       


"pEhExvsCDC5_TOP.txt"         
"pEhExvsCmasM_TOP.txt"         


"pEhExvsCDC5.txt"              



"pEhExvsCmasM.txt"             
[13] "pEhExvsEhMyb10_Abundances.txt"
"pEhExvsEhMyb10_Intersect.txt" 
"pEhExvsEhMyb10_logFC.txt"     
"pEhExvsEhMyb10_pval.txt"      
[17] "pEhExvsEhMyb10_TOP.txt"  
"pEhExvsEhMyb10.txt"           
"pEhExvsU2AF84_Abundances.txt" 
"pEhExvsU2AF84_logFC.txt"      
[21] "pEhExvsU2AF84_pval.txt" 
"pEhExvsU2AF84_TOP.txt"        
"pEhExvsU2AF84.txt"           
"pEhExvsUmasM_Abundances.txt"  
[25] "pEhExvsUmasM_logFC.txt"   
"pEhExvsUmasM_pval.txt"       
"pEhExvsUmasM_TOP.txt"       
"pEhExvsUmasM.txt"             


## Construir la ruta completa al archivo
ruta_primer_archivo <- archivos_txt[1]

bd <- read.table(ruta_primer_archivo, header = TRUE)
print(bd)

data <- as.data.frame(bd)
print(data)

View(data)

ruta_csv <- "~/Desktop/MiGithub/Resultados/docs/PrimeroDiffExpAllResults/BDD"

write.csv(data,"PrimeroDiffExpAllResults/BDD/mydata.csv")


# Crear una carpeta para guardar los archivos CSV si no existe
if (!file.exists("PrimeroDiffExpAllResults/BDD")) {
  dir.create("PrimeroDiffExpAllResults/BDD")
}

# Leer cada archivo TXT, convertirlo en DataFrame y guardarlo como CSV
for (archivo in archivos_txt) {
  bd <- read.table(archivo, header = TRUE)
  data <- as.data.frame(bd)
  nombre_archivo_csv <- paste0("PrimeroDiffExpAllResults/BDD/", tools::file_path_sans_ext(basename(archivo)), ".csv")
  write.csv(data, file = nombre_archivo_csv, row.names = FALSE)
  cat("Archivo", nombre_archivo_csv, "creado.\n")
}