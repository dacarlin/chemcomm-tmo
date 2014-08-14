#r script for graphing TMO variants
d=read.csv('fig2.csv')
d$Percent = d$Eth / max(d$Eth) * 100
d$eth.umol =  d$Eth / max(d$Eth)
d$Strain2 = reorder(d$Strain, -d$Eth)
library(ggplot2)
ggplot(d, aes(Strain2,eth.umol)) + 
geom_boxplot(group=d$Group) +
coord_flip() + 
xlab("") + 
ylab("Ethene (micromoles) at 24 hours") + 
facet_grid(Group~.) + 
ggsave('fig2.png')
