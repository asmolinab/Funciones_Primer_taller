#Estas son las primeras funciones solicitades en R programing

#Llamo librerias necesarias

library("data.table")

#Funcion1 promedio polución

pollutantmean <- function(directory, pollutant, id = 1:332)
{
        # La variable directory, da la direccion de los archivos a leer.
        # Pollutant identifica el tipo de polucion para promediar:
        # Puede ser "sulfate" o "nitrate".
        # id es un vector que identifica la cantidad de archivos a usar
        # y cuales
        
        #Se hace un listado de los nombres de los archivos con su 
        #respectiva dirreccion
        
        nombresarchivos <- list.files(path = directory, full.names = TRUE)
        
        
        # Creo una variable para guardar toda la informacion de los ar-
        # chivos en ella, (Variable tipo data frame)
        informacion <- data.frame()
        
        # Hago un ciclo for para leer todo los archivos y guardalos en 
        # la Variable informacion
        for (i in id)
        {
                #uso la funcion rbind para conbinar los archivos en uno solo
                # y uso read.csv para leer los archivos
                informacion <- rbind(informacion, read.csv(nombresarchivos[i]))
                
        }
        
        #hago el promedio segun sea el pollutant
        
        if (pollutant == "sulfate"){
                
                #si es sulfate entonces se debe hacer el promedio de la 
                # columna 2
                mean(informacion[,2],na.rm = TRUE)
                
        } else if (pollutant == "nitrate"){
                
                # si es nitrate se debe hacer el promedio de la 
                # columna 3
                mean(informacion[,3],na.rm = TRUE)
                
        } else {
                
                # Si no se escoge correctamente el pollutant se crea 
                # un aviso
                print("Pollutant erroneo")
        }
        
        
}

