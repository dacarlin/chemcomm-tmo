library(ggplot2)

d=read.csv('time-course.csv')
d$eth = d$eth * 0.7
d$oxi = d$oxi * 0.7

ggplot(d, group=sample, color=sample) +
geom_point(aes(d$mins, d$oxi)) +
#geom_boxplot(aes(d$mins, d$oxi, group=mins)) + 
geom_point(mapping=aes(x=d$mins, y=d$eth), shape=2) +
#geom_boxplot(aes(d$mins, d$oxi, group=mins)) + 
stat_smooth(aes(d$mins+1, d$eth), method=lm, formula=y~log(x,10), se=F) + 
stat_smooth(aes(d$mins+1, d$oxi, color="Oxirane"), method=lm, formula=y~log(x,10), se=F) +
labs(x="Minutes", y="Concentration (micromolar)", title="TOM A113F" ) + 
theme_bw() +
theme(legend.position = "none") + 
ggsave('time-course.png',width=5,height=5) 
