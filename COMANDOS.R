######SCRIPT DE COMANDOS PARA EAP2######

##Para importar, convertir y exportar: rio
install.packages("rio")
library(rio)

#Para importar, si los datos están en nuestra pc:
data=import("trabajadores.sav")

#Para importar desde la nube (repositorio):
link="https://github.com/DataPolitica/salidas/raw/master/Data/trabajadores.sav"
trabajadores=import(link)

#Saber las las filas Y COLUMNAS:
dim(dataStata)

#Para cambiar de formato (.rda) (ABRE RIO ANTES):
convert("trabajadores.sav", "trabajadores.rda")

#Exportar el archivo (.csv):
export(trabajadores, "trabajadores.csv")

##Conversión de variables
library(rio)
link="https://github.com/DataPolitica/salidas/raw/master/Data/eda.sav"
EDA=import(link)
names(EDA)

#De numérica a factor:
class(trabajadores$sexo)
trabajadores$sexo = as.factor(trabajadores$sexo)
str(trabajadores$sexo)

levels(trabajadores$sexo)
levels(trabajadores$sexo)<-c("Hombre","Mujer")

#A ordinal:
names(EDA)

EDA$confipolR=ordered(EDA$confipolR)

levels(EDA$confipolR)
levels(EDA$confipolR)<-c("Baja","Media", "Alta")
levels(EDA$confipolR)


##Para extraer tablas:
install.packages("htmltab")
library(htmltab)

#Creamos el objeto del link de la página web:
link_de_pagina= "https://es.wikipedia.org/wiki/Anexo:Departamentos_del_Per%C3%BA_por_IDH"

#Creamos el objeto del código:
codigoXPATH ="/html/body/div[3]/div[3]/div[5]/div[1]/center/table"

data_IDH = htmltab(doc = link_de_pagina, which =codigoXPATH) #1ero: dirección de la página; 2: ubicación del obj

names(data_IDH)










