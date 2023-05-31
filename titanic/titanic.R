# Paket Kurulumları
install.packages("psych")
install.packages("GGally")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("Amelia")

titanic <- read.csv("train.csv" , na.strings = "")
View(titanic)
class(titanic)
str(titanic)
head(titanic)

#Kayıp haritasını çizdirmek için kullanılır.

library(Amelia)
missmap(titanic, col=c("black" , "grey"))

#cabin alanında birçok NA değeri bulunduğu görülmektedir.

library(dplyr)
data.frame= select(titanic, Survived, Pclass, Age, Sex, SibSp,Parch)
class(data.frame)
dim(data.frame)
#NA verilerin bulunduğu satırların kaldırılması.
data.frame=na.omit(data.frame)
dim(data.frame)

#Verilerin Kontrol Edilmesi
str(data.frame)

data.frame$Pclass

data.frame$Survived=factor(data.frame$Survived)
str(data.frame)

data.frame$Pclass=factor(data.frame$Pclass , order=TRUE , levels =c(3,2,1) )
str(data.frame)

#kaldığı sınıfa göre hayatta kalanlar
library(ggplot2)
ggplot(data.frame) + geom_bar(mapping = aes(x=Sex, fill=Survived)) + facet_grid(~Pclass)


ggplot(data.frame , aes(x=Survived, fill=Pclass))+
  geom_bar(position = position_dodge())+
  geom_text(stat="count",
            aes(label=stat(count)),
            position = position_dodge(width = 1),
            vjust=-0.5)+
  theme_classic()


ggplot(data.frame, aes(x=Age))+
  geom_density(fill="coral")


data.frame$Age.Group = cut(data.frame$Age, c(0,10,20,30,40,50,60,70,80,90,100))
data.frame

ggplot(data.frame , aes(x=Age.Group, fill=Survived))+
  geom_bar(position = position_dodge())+
  geom_text(stat="count",
            aes(label=stat(count)),
            position = position_dodge(width = 1),
            vjust=-0.5)+
  theme_classic()

data.frame$Age.Group=NULL
