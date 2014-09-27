d=read.csv('time.csv')
names(d)
library(ggplot2)
ggplot(d,aes(Time,Eth.pA,color=Sample)) + 
geom_point() + 
ggsave('fig3.png')
