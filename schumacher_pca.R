## principle component analysis
## http://planspace.org/2013/02/03/pca-3d-visualization-and-clustering-in-r/
## Aaron Schumacher

data(iris)

# this is a little tweak so that things line up nicely later on
iris$Species <- factor(iris$Species,
                       levels = c("versicolor", "virginica", "setosa"))
head(iris)

# take a look at how correlated the four variables are
round(cor(iris[,1:4]), 2)

## principle component analysis
pc <- princomp(iris[,1:4], cor=TRUE, scores=TRUE)

loadings(pc)
summary(pc)

plot(pc, type="lines")
biplot(pc)

set.seed(42)
cl <- kmeans(iris[,1:4],3)
iris$cluster <- as.factor(cl$cluster)

with(iris, table(cluster, Species))
