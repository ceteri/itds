## heatmaps
## from J. Christopher Bare
## http://digitheadslabnotebook.blogspot.com.au/2011/06/drawing-heatmaps-in-r.html

# scale data to mean=0, sd=1 and convert to matrix
mtscaled <- as.matrix(scale(mtcars))

# create heatmap and don't reorder columns
heatmap(mtscaled, Colv=F, scale='none')

# cluster rows
hc.rows <- hclust(dist(mtscaled))
plot(hc.rows)

# transpose the matrix and cluster columns
hc.cols <- hclust(dist(t(mtscaled)))

# draw heatmap for first cluster
heatmap(mtscaled[cutree(hc.rows,k=2)==1,], Colv=as.dendrogram(hc.cols), scale='none')

# draw heatmap for second cluster
heatmap(mtscaled[cutree(hc.rows,k=2)==2,], Colv=as.dendrogram(hc.cols), scale='none')