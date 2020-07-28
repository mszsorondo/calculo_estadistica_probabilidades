#2
help(read)
lamparas <- scan("lamparas.txt")
lamparas
#a
mean(lamparas>30)
#b
hist(lamparas,freq=T,breaks=20)
help(hist)
#c
quantile(lamparas,.1)
#el 90% de las lamparas dura mas de 2.86 horas, el 10% dura menos que eso.

#d)
boxplot(lamparas)
#Características mas sobresalientes: 
#1.la mediana está bastante centrada (cerca del 2o cuartil) 
#2.En su totalidad, es asimétrico (un poco a derecha)
#3. Posee un outlier(100.32)

