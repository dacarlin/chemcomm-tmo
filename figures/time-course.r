library(ggplot2)

d=read.csv('time-course.csv')
d$eth = d$eth * 0.7
d$oxi = d$oxi * 0.7

ggplot(d, group=sample, color=sample) +
geom_boxplot(aes(d$mins, d$eth, d$oxi, group=mins, color=sample), width=0) + 
#geom_boxplot(aes(d$mins, d$oxi, group=mins, color=sample), width=0) + 
stat_smooth(aes(d$mins+1, d$eth, color="Ethene"), method=lm, formula=y~log(x,10), se=F) + 
stat_smooth(aes(d$mins+1, d$oxi, color="Oxirane"), method=lm, formula=y~log(x,10), se=F) +
labs(x="Minutes", y="Micromolar", title="TOM A113F" ) + 
theme_bw() +
theme(legend.position = "none") + 
ggsave('time-course.png',width=5,height=5) 
