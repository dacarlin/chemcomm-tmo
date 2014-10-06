d=read.csv('time-oxi.csv')

library(ggplot2)

ggplot(d, aes(d$elapsed, d$oxiu, group=d$Sample)) + 
geom_point() + 
labs(x="Minutes", y="Oxirane (umol)", title="TOM A113F") + 
geom_smooth(method="glm",family=gaussian(link="log"),start=c(7,0)) +
theme_bw() + 
ggsave('time-oxi.png', width=4, height=4)
