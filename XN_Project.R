df <- Millennial
df <- na.omit(df)
df$Date = as.Date(df$Date)
df1 <- subset(df, select = -c(Date))
scale(df1)
df2 <- scale(df1)
head(df2)

install.packages('factoextra')
library(factoextra)
distance <- get_dist(df2)
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))

k2 <- kmeans(df2, centers = 2, nstart = 25)
str(k2)
k2

fviz_cluster(k4, data = df2)

k3 <- kmeans(df2, centers = 3, nstart = 25)
k4 <- kmeans(df2, centers = 4, nstart = 25)
k5 <- kmeans(df2, centers = 5, nstart = 25)

p1 <- fviz_cluster(k2, geom = "point", data = df2) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = df2) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = df2) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = df2) + ggtitle("k = 5")

library(gridExtra)
grid.arrange(p1, p2, p3, p4, nrow = 2)