summary(mtcars)
head(mtcars,10) # İlk 10 veri
tail(mtcars,10) # Son 10 veri

model <- glm(formula = vs ~ wt, family = binomial, data=mtcars)

x <- seq(min(mtcars$wt),max(mtcars$wt),0.01)

y <- predict(model,list(wt=x),type = "response")

print(model)

png(file="log_reg.png")

plot(mtcars$wt,mtcars$vs,pch=16, xlab = "Weight", ylab="vs")
lines(x,y)
dev.off()
