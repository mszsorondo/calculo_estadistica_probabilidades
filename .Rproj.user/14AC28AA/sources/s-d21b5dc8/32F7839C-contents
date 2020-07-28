#1)
alf <- read.table("alfajores.txt", header = TRUE)
table(alf)
#a)
mean(alf$fabrica==0)
#b)
mean((alf$fabrica==0) & (alf$defectuosos==3))
#c)
probaConjuntaXY <- function(nDefectuosos,sede){
  mean((alf$defectuosos==nDefectuosos) & (alf$fabrica==sede))
}
probaConjuntaXY(3,0)
#d)
esperanzaDeX <- mean(alf$defectuosos)
esperanzaDeX
varianzaDeX <- sd(alf$defectuosos)
varianzaDeX
#e)
alf_quilmes <- alf[alf$fabrica==0,]
mean(alf_quilmes$defectuosos==3)
#f)
mil_muestras_defectuosos_por_caja <- replicate(1000,{
  sample(alf$defectuosos,1)==3
})
mean(mil_muestras_defectuosos_por_caja)
#g)
alf_tres_defectuosos <- alf[alf$defectuosos==3,]
mean(alf_tres_defectuosos$fabrica==0)
#h
mean(alf_tres_defectuosos$fabrica==1)
