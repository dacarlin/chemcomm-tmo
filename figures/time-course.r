library(ggplot2)

d=read.csv('time-course.csv')

# params from std curve
d$oxi = d$oxi / 15.2 * 0.7
d$eth = d$eth / 700 * 0.7
a113f = d[d$sample == 'A113F', ]
v106f = d[d$sample == 'V106F', ]

#fits
summary(nls(eth ~ 0.7 * exp(-k * mins), a113f, start=c(k=0.01)))
summary(lm(eth ~ mins, v106f))

#a113f
ggplot(a113f, group=sample, color=sample) +

geom_boxplot(aes(a113f$mins, a113f$oxi, group=a113f$mins)) +
geom_boxplot(mapping=aes(x=a113f$mins, y=a113f$eth, group=a113f$mins)) +

stat_smooth(aes(a113f$mins+1, a113f$eth), method=nls, formula=y~0.7*exp(-k*x), start=c(k=0.01), se=F) + 
stat_smooth(aes(a113f$mins+1, a113f$oxi,color="oxi"), method=nls, formula=y~0.7-(0.7*exp(-k*x)), start=c(k=0.01), se=F) +

labs(x="Minutes", y="Concentration (mM)", title="A113F" ) + 
theme_bw() +
theme(legend.position = "none") + 
ggsave('time-course-113.png',width=3,height=3) 

#v106f
ggplot(v106f, group=sample, color=sample) +
geom_boxplot(aes(v106f$mins, v106f$oxi, group=v106f$mins)) +
geom_boxplot(aes(v106f$mins, v106f$eth, group=v106f$mins)) +

stat_smooth(aes(v106f$mins+1, v106f$eth), method=lm, formula=y~x, se=F) + 
stat_smooth(aes(v106f$mins+1, v106f$oxi, color="Oxirane"), method=lm, formula=y~x, se=F) +

labs(x="Minutes", y="Concentration (mM)", title="V106F" ) + 
theme_bw() +
theme(legend.position = "none") + 
ggsave('time-course-106.png',width=3,height=3) 
