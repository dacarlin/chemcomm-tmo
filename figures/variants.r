#r script for graphing TMO variants
d=read.csv('variants.csv')
d$Percent = d$Eth / 16 
d$Strain2 = factor(d$Strain, levels=c(
  "A113F",
  "V106F",
  "V106E",
  "A113V",
  "V106H+A113S",
  "A113H",
  "V106Q+A113Q",
  "V106I+A113S",
  "V106R+A113W",
  "V106P+A113G",
  "V106A",
  "Wild type TOM"#,
  #"Buffer"
))

library(ggplot2)
ggplot(d, aes(Strain2,Percent)) + 
geom_boxplot(width=0.618) + coord_flip() + 
labs(title="",x="", y="Percent ethylene after 24 hours") + 
theme_bw() + 
ggsave('variants.png',width=5,height=5)
