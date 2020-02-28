#!/usr/bin/Rscript
library(ggplot2)
library(ggpubr)

data <- read.table("data.txt", header=TRUE, sep=",")
tiff("scatter.tiff", height = 10, width = 10, units = 'in', res=1000,compression = 'lzw')
par(pty='s')
ggscatter(data, x = "observation", y = "calculation", xlab="observation", ylab = "calculation", legend = "none",
fullrange = TRUE, add = "reg.line", color="group", shape=19, palette = "Dark2", conf.int = T, 
conf.int.level = 0.95, cor.coef =T, 
cor.coeff.args = list(aes(color = group), method = "pearson", label.x.npc = "left", label.y.npc = "top"),
cor.coef.size = 6, ggtheme = theme_pubr(base_size = 20, border = TRUE)) +
coord_fixed(xlim = c(-25, 0), ylim = c(-25, 0),ratio = 1) + 
geom_abline(linetype="dashed",intercept = 0, slope=1) + 
scale_x_continuous(breaks=seq(-25, 5, 5)) + scale_y_continuous(breaks=seq(-25, 5, 5))

dev.off()
