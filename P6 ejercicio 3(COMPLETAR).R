promedios <- scan("graduados.txt")
promedios
#a
mean(promedios)
median(promedios)
#b
summary(promedios)
abs(quantile(promedios,c(0.25,0.75))[1]-quantile(promedios,c(0.25,0.75))[2])
sd(promedios)
#c
hist(promedios,breaks=10)
lines(dnorm(c(.25,.5,.75),1,0))
#faltan los graficos superpuestos (histograma y densidad de una normal con esperanza 3.7

#d
boxplot(promedios)
#Observaciones
#Es una distribucion bastante simétrica, con mediana casi idéntica a la media (lo hemos visto antes en números) 
#(centrada en el 2o cuartil) y sin outliers.

ggplot
density(promedios)

#e Creo que tienen una distribución bastante normal.
#f no se hacer ploteos superpuestos

#g
qqnorm(promedios)
#Es una curva bastante lineal, por ello creo que una normal aproxima muy bien la distribucion de 
#la muestra

