library(ggplot2)

d=read.csv('time-course-to-300-min.csv')

ggplot(d, group=sample, color=sample) +
geom_point(aes(d$mins, d$eth)) + 
geom_point(aes(d$mins, d$oxi)) + 
stat_smooth(aes(d$mins+1, d$eth, color="Ethene"), method=lm, formula=y~log(x,10)) + 
stat_smooth(aes(d$mins+1, d$oxi, color="Oxirane"), method=lm, formula=y~log(x,10)) +
labs(x="Minutes", y="Micromoles", title="TOM A113F" ) + 
theme_bw() +
ggsave('time-course.png',width=5,height=5) 
