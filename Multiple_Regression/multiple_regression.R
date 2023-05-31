veri_seti <- airquality
#Özet bilgi verir. (Betimsel istatistik)
summary(veri_seti)

#Veri seti içerisindeki örnek satırlardan gösterim yapar.Örneğin 20 kayıt gösterir.
head(veri_seti,20)

class(veri_seti)

#Uygulama: Coklu Dogrusal Regresyon Modeli

input <- airquality[1:50,c("Ozone","Wind","Temp")]
model <- lm(Ozone ~ Wind + Temp, data=input)
cat("Regression Model: \n")
print(model)
png(file="multiple_regression_model.png")
plot(model)
dev.off()
