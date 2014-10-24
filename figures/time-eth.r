d=read.csv('time.csv')
d$Percent = d$Eth / max(d$Eth) * 100
d$eth.umol =  d$Eth / max(d$Eth)

library(ggplot2)

ggplot(d, aes(d$Time, d$eth.umol, group=d$Sample)) + 
geom_point() + 
labs(x="Minutes", y="Ethene (umol)", title="TOM A113F") + 
geom_smooth(method="glm",family=gaussian(link="log"),start=c(7,0)) +
theme_bw() + 
ggsave('time-eth.png', width=4, height=4)
