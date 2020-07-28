ingresos <- scan("ingresos.txt")
ingresos
#a
mean(ingresos==(min(ingresos)))
#b: Se pide el ingreso necesario para pertenecer al 10% que mas gana de la población...
#Osea cuál es el ingreso necesario para ganar mas que el 90% de las personas (90-percentil):
quantile(ingresos,0.9)
#c
mean(ingresos)
median(ingresos)
mean(ingresos, trim = 0.1)
#d
sd(ingresos)
IQR(ingresos)
#e
hist(ingresos)
boxplot(ingresos)
#OBS: Hay muchos outliers bastante alejados.
#f y g: Evidentemente no es una distribución normal. Se parece a una exponencial. 
#Si queremos estimar una ganancia que sea representativa de todos los datos convendría usar la mediana o una media
#alpha podada puesto que hay muchos outliers.
