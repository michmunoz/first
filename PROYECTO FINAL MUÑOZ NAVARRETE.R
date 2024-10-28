
# PROYECTO FINAL BIOESTADÍSTICA #
# DANIELA MICHELLE MUÑOZ NAVARRETE #
                          


                     ### ANÁLISIS DE REGRESIÓN LINEAL ###

#### Este análisis de datos estadísticos nos sirve para determinar cuanta variación
# de la varibale dependiente (y) es explicada por la variable independiente (x),
# también es útil para realizar predicciones del comportamiento de y.

#### Es necesario que tanto la variable dependiente como la independiente deben tener
# valores continuos, así como es indispensablela existencia de ambos valores para cada
# elemento de estudio en el análisis.



### SUPUESTOS DEL ANÁLISIS ###


# -La varianza en Y es constante
# -Los residuales del modelo se aproximan a una distribución normal o Gaussiana
# -Se busca el ajuste a una línea recta en donde los valores de los residuales sean
# lo mas reducidos posibles



### PARÁMETROS DEL ANÁLISIS ###


# La línea de ajuste es descrita por una ecuación lineal:
# y = A + Bx + e
# En donde:
# Y = variable dependiente continua
# A = ordenanda al origen
# B = pendiente de la recta
# x = variable independiente
# e = error (residuales) 



### PASOS PARA EL ANÁLISIS ###


  ### 1 ###

### Para fines demostrativos se estará usando de apoyo una base de datos ya precargada
# en el paquete "datasets" ya instalado en R

###Para cargarla es necesario escribir y correr el nombre de la base de datos y de esta
# manera se puede visualizar las variables y cada elemento de estudio, de igual forma es
# posible visualizarla desde la pestaña de "Enviroment" en el paquete correspondiente

Puromycin

### En esta base de datos las variables continuas son las siguentes:
# conc = concentraciön de sustrato = x
# rate = tiempo de reacción de enzimas = y


  ### 2 ###

### Una vez cargada la base de datos se crea el objeto para que contenga el análisis de
# regresión

### Para realizar el análisis se escribe la ecuación de la recta con las variables
# correspondientes:

# nombre del objeto <- lm ( y ~ x, data)
# lm = función lineal model

fit1 <-lm (rate ~ conc, Puromycin)

### se corre el análisis


  ### 3 ###

### Una vez que se corrió el análisis es necesario evaluar el objeto, para esto
# simplemente se escribe el nombre del objeto que se asignó previamente

fit1

### Como resultado en la consola se visualizan los valores de los parámetros de la 
# regresión lineal:

# Intercept = A = ordenada al origen
# conc = B = pendiente de la recta


  ### 4 ###

### Para poder hacer una interpretación completa del análisis es necesario hacer un
# resumen del mismo, con la funcion "summary" seguido del nombre del objeto que
# contiene el análisis

summary (fit1)

### Al correr esto salen los datos completos del análisis:

# -Residuals: los valores minimos, maximos, media y cuartiles
# para comprobar que estos tienen una distribucion normal es necesario ver los valores
# dados, el valor Min y Max deben de tener valores muy cercanos pero con signo
# contrario, de igual forma esta comparación debe ser igual entre los cuartiles 1Q y 3Q

# -Coefficients : en esta tabla encontramos nuevamente los valores de los parametros
# del análisis (Estimate), el error estandar (Std. error), el valor de t (t value)
# y por ultimo el valor de P para cada uno de los parámetros, el cual nos dice si debemos
# aceptar o rechazar la hipótesis nula (Ho), sin embargo, esto no nos dice la magnitud
# del efecto de la variable independiente sobre la variable dependiente

# - Adjusted R-squared : este valor está en un rango entre 0 y 1, siendo un indicador
# de que tan bueno es el modelo de análisis, siendo el porcentaje de certeza de la
# relación de las variables



### ESCRIBIR LOS RESULTADOS ###

### Para esto se realiza un resumen escrito de los valores obtenidos:
# y = A + Bx + e; valor obtenido de P; valor obtenido de R^2 ajsutada



### GRÁFICA DE LA RECTA ###


  ### 1 ###

###Para realizar las gräficas de la mayoria de los análisis estadisticos es empeado
# el paquete "ggplot2", el cual se debe instalar

install.packages ("ggplot2")

### De igual forma es necesario cargar la libreria correspondiente

library (gmodels)

### Una vez hecho esto ya se puede realizar la gráfica


  ### 2 ###

### Se crea el objeto en el que se contendrá toda la información de la gráfica:

graf1 <- ggplot ( Puromycin, aes ( x = conc, y = rate ) ) + 
  geom_smooth ( method = lm, se = TRUE, lty = 5, colour = "cyan4") +
  geom_point ( col = "deeppink4" ) +
  theme_minimal () +
xlab ( "CONSENTRACIÓN DE SUSTRATO" ) + ylab ( "TIEMPO DE REACCIÓN" ) +
  ggtitle ( "ANÁLISIS DE REGRESIÓN" )

### En donde cada función es una capa distinta de información:

# -ggplot : función inicial para una gráfica de cualquier tipo, contiene la información
# de la estética de la gráfica (ejes x y y) y la base de datos empelada

# -geom_smooth : ayuda a la distrubución del eje x, por ello aqui se tiene "method" que
# corresponde al modelo lineal para la recta, "se = TRUE" crea una sombra que representa
# el error estandar en el análisis, "lty = 5 " aspecto de la línea de la recta,
# "colour = "cyan4"" color de la recta

# -geom_point : nos proporciona la posición de los elementos de estudio según sus datos
# de valores en x y y, "col = "deeppink4"" color de los puntos en la gráfica

# -theme_minimal : fondo de la grafica

#- xlab y ylab : asignar nombre a los ejes respectivamente

# -ggtitle : título de la gráfica



  ### 3 ###

### Una vez que se corre la información anterior se evalua el objeto, esto se
# hace escribiendo el nombre previamente asignado

graf1


  ### 4 ###

### Para que la gráfica proporcione una información mas completa es necesario agregar
# los resultados obtenidos de manera escrita

graf1 + annotate ( "text", x=0.4, y=225, label = "Tiempo = 93.92 + Sustrato(105.40); p<0.001; R^2 = 0.63",
                  size =5 )

### Esto se hace con la función "annotate" sobre el objeto ya creado previamente:

# -"text" : tipo de información se se escribirá
# - x y y : coordenadas en donde se desea comenzar a escribir
# - label : información a escribir
# - size  : tamaño de la letra en el texto




### NOTAS :

# Las paletas y nomres de distintos colores se pueden consultar en internet
# Las formas en la función "geom_point" son posibles de cambiar con "shape = #"
# ylim y xlim son funciones para delimitar la escala de los ejes en la gráfica
# La libreria del paquete "ggplot" dos debe ser cargada cada vez que se ingrese a R


# :)
