#r script for graphing TMO variants
d=read.csv('variants.csv')
d$Percent = d$Eth / max(d$Eth) * 100
d$eth.umol =  d$Eth / max(d$Eth)
d$Strain2 = reorder(d$Strain, -d$Eth)

library(ggplot2)
ggplot(d, aes(Strain2,eth.umol)) + 
# tufte-style
geom_boxplot(width=0.618, ) + coord_flip() + 
labs(title="TOM",x="", y="Ethene (umol) after 24 hours") + 
scale_fill_brewer("Mutant sidechains", palette="Set1") + 
theme_bw() + 
ggsave('variants.png',width=4,height=4)
