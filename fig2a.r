d=read.csv('fig2a.csv')
d$Percent = d$Eth / max(d$Eth) * 100
d$eth.umol =  d$Eth / max(d$Eth)
d$Strain2 = reorder(d$Strain, -d$Eth)
library(ggplot2)
ggplot(d, aes(Strain2,eth.umol)) + 
geom_boxplot() +
coord_flip() + 
xlab("") + 
ylab("Ethene (umol) after 24 hours") + 
ggsave('fig2a.png',width=10,height=2)
