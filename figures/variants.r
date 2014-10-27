#r script for graphing TMO variants
d=read.csv('variants.csv')
d$Percent = d$Eth / max(d$Eth) * 100
d$eth.umol =  d$Eth / max(d$Eth)
d$Strain2 = reorder(d$Strain, -d$Eth)

library(ggplot2)
ggplot(d, aes(Strain,Percent)) + 
# tufte-style
geom_boxplot(width=0.618, ) + coord_flip() + 
labs(title="",x="", y="Percent ethene after 24 hours") + 
theme_bw() + 
ggsave('variants.png',width=5,height=5)
