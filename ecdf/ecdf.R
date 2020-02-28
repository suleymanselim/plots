#!/usr/bin/Rscript
data <- read.table("rmsd.txt", header=TRUE, sep=",")
tiff("rmsd.tiff", height = 5, width = 5, units = 'in', res=1000,compression = 'lzw')
par(pty='s')
plot(ecdf(data[,"Set1"]), xlab="RMSD", ylab="Cumulative Proportion", main="ECDF Plot",cex=0.3, col="dodgerblue4", xlim=c(0,10))
lines(ecdf(data[,"Set2"]), cex=0.3, col="green4")
legend('bottomright', legend=c("Set1","Set2"), box.lty=0, bg="transparent", col=c("dodgerblue4","green4"), pch=15)
abline(v=2, lty=2)
dev.off()




