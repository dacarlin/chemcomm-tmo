#r script for graphing TMO variants
d=read.csv('variants.csv')
d$Percent = d$Eth / 16 
d$Strain2 = factor(d$Strain, levels=c(
  "Buffer",
  "Wild type TOM",
  "V106A",
  "V106P+A113G",
  "V106R+A113W",
  "V106I+A113S",
  "V106Q+A113Q",
  "A113H",
  "V106H+A113S",
  "A113V",
  "V106E",
  "V106F",
  "A113F"
))

library(ggplot2)
ggplot(d, aes(Strain2,Percent)) + 
geom_boxplot(width=0.618) + coord_flip() + 
labs(title="",x="", y="Percent ethylene after 24 hours") + 
theme_bw() + 
ggsave('variants.png',width=5,height=5)
