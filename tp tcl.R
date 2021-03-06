library(ggplot2)
set.seed(7)
#1a
muestra <- replicate(1000, runif(1,0,1))
muestra
hist(muestra)

#1b
muestrasPromedio <- replicate(1000,{
  X1 <- runif(1,0,1)
  X2 <- runif(1,0,1)
  prom <- (X1+X2)/2
  prom})
hist(muestrasPromedio)
#caracteristicas: parece ser una variable aleatoria normal con esperanza 0.5...
sd(muestrasPromedio)
mean(muestrasPromedio)
#y desviación estándar 0.2
promedio5Muestras <- replicate(1000,{
  muestras <- replicate(5,runif(1,0,1))
  mean(muestras)
})
hist(promedio5Muestras,probability = F)
#obs: histograma de una v.a. normal centrada en 0.5
mean(promedio5Muestras)
sd(promedio5Muestras)
promedioNMuestras <- function(repeticiones,nVariables){
  replicate(repeticiones,{
    muestras <- runif(nVariables,0,1)
    mean(muestras)
  }
  )
  
}
hist(promedioNMuestras(1000,5))

#1d
hist(promedioNMuestras(1000,30))
#1e
hist(promedioNMuestras(1000,500))
hist(promedioNMuestras(1000,1500))
#a medida que aumenta el número de variables aleatorias de las que saco muestras,
#mayor es la frecuencia del valor esperado (y menor es la desviación estándar). 

boxplot(promedioNMuestras(1000,2),promedioNMuestras(1000,5),promedioNMuestras(1000,30),promedioNMuestras(1000,500))
#véase cómo se aumenta la densidad a medida que aumenta el número de v.as.

#1f

boxplot(promedioNMuestras(1000,1),promedioNMuestras(1000,2),
        promedioNMuestras(1000,5),promedioNMuestras(1000,30),
        promedioNMuestras(1000,500),promedioNMuestras(1000,1200))

nMuestras <- c(1,2,5,30,500,1200)
for(i in nMuestras){
  print(mean(promedioNMuestras(1000,i)))
}

#obs: la esperanza se mantiene prácticamente igual
for(i in nMuestras){
  print(sd(promedioNMuestras(1000,i)))
}
#obs: la desviacion estándar disminuye significativamente al aumentar el numero de muestras
# esto es un muy buen ejemplo del TCL: cuanto mayor es el número de muestras tomadas, 
#mayor será la cercanía del promedio a la esperanza

#los valores teóricos serían (Como las muestras son de v.as. iid):
# E(promedio(X1)) = E(promedio(X1,X2)) = E(promedio(X1,...,X5)) = E(promedio(X1,...,X30)) = E(promedio(X1,...,X500))=...
#... E(promedio(X1,...,X1200))
#sd(promedio(X1,...,Xn)) = sd(X1)/n
normalizar <- function(distribucionPromedios, n){
  (distribucionPromedios-mean(distribucionPromedios))*sqrt(n)/sd(distribucionPromedios)
}
hist(normalizar(promedioNMuestras(1000,1),1),freq = T)
hist(normalizar(promedioNMuestras(1000,2),2),freq = T)
hist(normalizar(promedioNMuestras(1000,5),5),freq = T)
hist(normalizar(promedioNMuestras(1000,30),30),freq = T)
hist(normalizar(promedioNMuestras(1000,500),500))
hist(normalizar(promedioNMuestras(1000,1200),1200),freq = T)
#obsérvese cómo se va pareciendo a una normal estándar a medida que aumenta el número de muestras aleatorias que tomamos
#ejercicio g




#ejercicio h
PromedioDeCauchys <- function(repeticiones, nVariables){
  replicate(repeticiones, {
    muestras <- rcauchy(nVariables)
    mean(muestras)
  })
}
unaMuestra <- PromedioDeCauchys(1000,nMuestras[1])
ggplot(data.frame(unaMuestra), 
       aes(x = unaMuestra)) + geom_density() + xlim(-5,5)
DosMuestras <- PromedioDeCauchys(1000,2)
ggplot(data.frame(DosMuestras), 
       aes(x = DosMuestras)) + geom_density() + xlim(-5,5)
CincoMuestras <- PromedioDeCauchys(1000,5)
ggplot(data.frame(CincoMuestras), 
       aes(x = CincoMuestras)) + geom_density() + xlim(-5,5)
TreintaMuestras <- PromedioDeCauchys(1000,30)
ggplot(data.frame(TreintaMuestras), 
       aes(x = TreintaMuestras)) + geom_density() + xlim(-5,5)
QuinientasMuestras <- PromedioDeCauchys(1000,500)
ggplot(data.frame(QuinientasMuestras), 
       aes(x = QuinientasMuestras)) + geom_density() + xlim(-5,5)
MilDoscientasMuestras <- PromedioDeCauchys(1000,1200)
ggplot(data.frame(MilDoscientasMuestras), 
       aes(x = MilDoscientasMuestras)) + geom_density() + xlim(-5,5)
boxplot(unaMuestra,DosMuestras,CincoMuestras,TreintaMuestras,QuinientasMuestras,MilDoscientasMuestras,ylim=c(-5,5))
rcauchy(5)
#Hay algo mal? aumento el número de muestras y no se acumula la distribución en la esperanza.
#Acabo de leer bastante: Pasa porque NO CUMPLE CON CIERTOS REQUISITOS DEL TCL.
#Porque su varianza no es finita cuando n -> inf! No estoy loco después de todo.
mean(unaMuestra)
mean(DosMuestras)
mean(CincoMuestras)
mean(TreintaMuestras)
mean(QuinientasMuestras)
mean(MilDoscientasMuestras)

sd(unaMuestra)
sd(DosMuestras)
sd(CincoMuestras)
sd(TreintaMuestras)
sd(QuinientasMuestras)
sd(MilDoscientasMuestras)
#Las desviaciones estándar no cambian de una forma definida y no parece haber una relacion
#entre el crecimiento del numero de muestras y la desviación estándar.
nMuestras <- c(1,2,5,30,500,1200)
esperanzas <-c()
sds <-c()
for(i in nMuestras){
  append(esperanzas,mean(promedioNMuestras(1000,i)))
}

#obs: la esperanza se mantiene prácticamente igual
for(i in nMuestras){
  append(sds, sd(promedioNMuestras(1000,i)))
}
data.frame(E = esperanzas, sd = sds)
