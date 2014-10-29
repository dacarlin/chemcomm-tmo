library(ggplot2)

d=read.csv('time-course.csv')
d$eth = d$eth / 700 * 0.7
d$oxi = d$oxi / 15.2 * 0.7
a113f = d[d$sample == 'A113F', ]
v106f = d[d$sample == 'V106F', ]

ggplot(a113f, group=sample, color=sample) +
geom_point(aes(a113f$mins, a113f$oxi), position=position_jitter(w = 10, h = 0)) +
geom_point(mapping=aes(x=a113f$mins, y=a113f$eth), shape=2, position=position_jitter(w = 10, h = 0)) +
stat_smooth(aes(a113f$mins+1, a113f$eth), method=lm, formula=y~log(x,10), se=F) + 
stat_smooth(aes(a113f$mins+1, a113f$oxi, color="Oxirane"), method=lm, formula=y~log(x,10), se=F) +
labs(x="Minutes", y=expression(paste("Concentration ( ", mu, "M )")), title="A113F" ) + 
theme_bw() +
theme(legend.position = "none") + 
ggsave('time-course-133.png',width=3,height=3) 

ggplot(v106f, group=sample, color=sample) +
geom_point(aes(v106f$mins, v106f$oxi), position=position_jitter(w = 10, h = 0)) +
geom_point(mapping=aes(x=v106f$mins, y=v106f$eth), shape=2, position=position_jitter(w = 10, h = 0)) +
stat_smooth(aes(v106f$mins+1, v106f$eth), method=lm, formula=y~x, se=F) + 
stat_smooth(aes(v106f$mins+1, v106f$oxi, color="Oxirane"), method=lm, formula=y~x, se=F) +
labs(x="Minutes", y=expression(paste("Concentration ( ", mu, "M )")), title="V106F" ) + 
theme_bw() +
theme(legend.position = "none") + 
ggsave('time-course-106.png',width=3,height=3) 
