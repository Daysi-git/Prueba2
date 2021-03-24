# Aprendiendo R
############ Pedir ayuda en R - signo ? ############
?sum  
############ Ver la direcciòn del proyecto###########
getwd()
############ Instalar y cargar librerias ##############
install.packages("ggplot2")  # instalar paquetes busco en paginaR
library (ggplot2)            # cargar 
## algunas instaladas##
library(qcc)
library(readxl)
library(weibulltools)
library(ggplot2)
library(plotly)
## usando notebook##
---
  title: "R Notebook"
output: html_notebook
---
  # Operaciones simples
  `{r}
# Suma
3+5
# Resta
8-2
```
# Operaciones con variables
`{r}
a <- 3
b <- 7
respt_suma <- a+b
respt_resta <- a-b
respt_producto <- a*b
respt_division <- a/b
logaritmo <- log(a)
```
# Manipulando vectores
`{r}
# Creacion de vectores
vector1 <- c(1,2,3,4,5)
vector2 <- 1:9
vector3 <- seq(2,5, by = 0.5)
vector3.1 <- seq(2,10, by = 2)
vector4 <- rep(2:4, times=3)
vector5 <- rep (1:2, each=3)
# Accediendo a datos de los vectores
Accediendo por posicion
vector1 [3]
vector1 [-4]
vector1 [1:3]
vector1 [-(1:3)]
vector1 [c(1,3)]
```
#Accediendo por valores
`{r}
vector2 [vector2>=5]
vector5 [vector5==2]
vector4 [vector4<3]
vector5 [vector5 %in% vector4]
vector4 [vector4 %in% c(5,3)]
```
## Operaciones basicas con vectores
#Empleando funciones basicas estadisticas
`{r}
sum(vector5)
mean(vector3)
max(vector4)
min (vector5)
median (vector5)
sd (vector3)
vector1*4
vector5-1
```
#Funciones
`{r}
funcion_suma_cuadrados <- function(a,b){
  c <- a^2 + b^2 
  return(c)
}

`{r}
respuesta <- funcion_suma_cuadrados(4,7)
## Graficos## con base attenu - terremotos California##
data("attenu")
class(attenu$mag)        # ver clases de la variable
ggplot(data = attenu) + geom_histogram(aes(x=event)) #histograma 
ggplot(data = attenu) + geom_boxplot(aes(x=event)) #caja
ggplot(data = attenu) + geom_histogram(aes(x=event),bins =4) # limitando clases
## base mtcars##
data("mtcars")
#histograma#
ggplot(data = mtcars) + geom_histogram(aes(x=qsec,fill=factor(am)),bins=10, position = "stack",alpha = 0.5)#pila - 10 clases
ggplot(data = mtcars) + geom_histogram(aes(x=mpg,fill=factor(vs)),bins=8, position = "stack",alpha = 0.5)#pila - 8 clases
ggplot(data = mtcars) + geom_histogram(aes(x=qsec,fill=factor(am)),bins=10, position = "identity" ,alpha = 0.5)#pila + transparencia
# grafico de densidad# solo cambia tipo de geom#
ggplot(data = mtcars) + geom_density(aes(x=qsec,fill=factor(am)),bins=10, position = "identity" ,alpha = 0.5)#pila + transparencia
## diagrama de caja##
ggplot(data = mtcars) + geom_boxplot(aes(x=disp, y=disp))# misma variable
ggplot(data = mtcars) + geom_boxplot(aes(x=factor(gear), y=disp)) # diferente 
ggplot(data = mtcars) + geom_boxplot(aes(x=factor(gear), y=disp)) + coord_flip()# horizontal
## estetica - puntos##.
ggplot(mtcars, aes(cyl, wt)) + geom_point(colour = "blue") #color azul
ggplot(mtcars, aes(mpg,qsec))+geom_point(aes(colour=factor(gear)))# diferente color puntos - anadir factor
ggplot(mtcars, aes(mpg,qsec))+geom_point(aes(size=disp),alpha=0.1)# circunferencias
ggplot(mtcars, aes(mpg,qsec))+geom_point(aes(shape=factor(gear)),alpha=0.8)#diferentes figuras en las categorias
ggplot(mtcars, aes(mpg,qsec))+geom_point(aes(size=hp),alpha=0.5)+facet_wrap(~factor(am))#dividir en grupos de ultima variable
ggplot(mtcars, aes(mpg,qsec))+geom_point(aes(size=hp),alpha=0.5)+facet_grid(factor (cyl)~factor(am))# cubierta y cuadricula
ggplot(mtcars, aes(mpg,qsec))+geom_point(aes(size=hp),alpha=0.5)+facet_grid(factor (cyl)~factor(am))+xlab("eje x")+ylab("eje y")+labs(size="Caballo de fuerza")+ggtitle("Diagrama de puntos")
## GRAFICOS COMPUESTOS##
install.packages("gridExtra")  # instalar paquete
library (gridExtra)            # cargar 
df <- data.frame(a = 1:10, b = rnorm(100)) #creacion tabla dist.normal
p1 <- ggplot(df, aes(a, b)) + geom_boxplot()
p2 <- ggplot(df, aes(b)) + geom_histogram()
grid.arrange(p1, p2) # uno denajo de otro
grid.arrange(p1,p2,ncol=2) # uno alado de otro
## Piramide poblacional##
install.packages("readxl")
library(readxl) #para documentos de excel
Datos_piramide <- read_excel("R/Datos piramide.xlsx",range="A1:C21", col_names = c("A?o","Hombres","Mujeres")) 
View(Datos_piramide) # Ver los datos de la tabla