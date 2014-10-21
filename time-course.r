library(ggplot2)

d=read.csv('time-course.csv')

ggplot(d, group=sample) +

geom_point( aes(mins, eth) ) + 
geom_smooth( aes(mins, eth, color="Ethene"), 
  method="glm",
  family=gaussian(link="log"),
  start=c(7,0)) +

# geom_point( aes(mins, oxi) ) + 
geom_boxplot( aes(mins, oxi, group=mins, color="Oxirane") ) + 
# geom_smooth( aes(mins, oxi, color="Oxirane") ) +  

labs(x="Minutes", y="Micromoles", title="TOM A113F" ) + 

theme_bw() +
ggsave('time-course.png', width=4, height=4) 


