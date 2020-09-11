#####Haciendo la BASE DE DATOS#####

###Leyendo STATA
library(rio)
lkDTA="https://github.com/PoliticayGobiernoPUCP/estadistica_anapol2/raw/master/DATA/lapop2012.dta"
dataStata=import(lkDTA)
dim(dataStata)

##Leyendo SPSS
lkSAV="https://github.com/PoliticayGobiernoPUCP/estadistica_anapol2/raw/master/DATA/lapop2012.sav"
dataSpss=import(lkSAV)
dim(dataSpss)

##Leyendo Excel
lkXLSX="https://github.com/PoliticayGobiernoPUCP/estadistica_anapol2/raw/master/DATA/lapop2012.xlsx"
dataExcel=import(lkXLSX)
dim(dataExcel)

##Leyendo CSV
lkCSV="https://github.com/PoliticayGobiernoPUCP/estadistica_anapol2/raw/master/DATA/lapop2012.csv"
dataCSV=import(lkCSV)
dim(dataCSV)

##Archivos de datos especiales:

#Mapa a formato JSON:
link="https://github.com/Winny-calderon/EAP2/raw/master/seattle.json"
dataseattle=import(link)
plot(dataseattle)

library(sp)
library(geojsonio)
install.packages("sp")
library(rgdal)

fromGit="XXXXX" # link desde github

wazipMap <- rgdal::readOGR(link,stringsAsFactors = FALSE)
plot(wazipMap)




####USO DE LOS APIs

miLLAVE='jvxVlUpiTo3XBiLOxdBIIWgYAEWLqB2ri1Rhgklv'

#Construir solicitud para colectar los datos:
GUID='http://api.datosabiertos.msi.gob.pe/api/v2/datastreams/INTER-DE-SEREN-2019/'
FORMATO='data.json/'

#Solicitud: 
request=paste0(GUID,FORMATO,'?auth_key=',miLLAVE)
request

#Abrir Jsonlite
install.packages("jsonlite")
library(jsonlite) 

#Solicitar data
serenosSI = fromJSON(request)
serenosSI

##MAL, AHORA FORMATO PJSON
FORMATO='data.pjson/'
request2=paste0(GUID,FORMATO,'?auth_key=',miLLAVE)

#Nueva solicitud
serenosSI = fromJSON(request2)

#Estructura
str(serenosSI)

#Para ir a los datos en formato tabla, usamos "result"
head(serenosSI$result)

#datos recolectados
dim(serenosSI$result)

#Parámetro para mejorar la búsqueda
Parametros='&from=01/01/2010'
request3=paste0(GUID,FORMATO,'?auth_key=',miLLAVE,Parametros)
serenosSI_all = fromJSON(request3)$result

#Disponibilidad total
dim(serenosSI_all)

###tablas-Scrap
install.packages("htmltab")
library(htmltab)

linkpage="https://www.nationsonline.org/oneworld/corruption.htm"
linkPath="/html/body/table[3]"
library(htmltab)
corrupcion = htmltab(doc = linkpage, 
                     which =linkPath)
head(corrupcion)
tail(corrupcion)





