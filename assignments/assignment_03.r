name = c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
abc_political_poll = c(4, 62, 51, 21, 2, 14, 15)
cbs_political_poll = c(12, 75, 43, 19, 1, 21, 19)
results = cbind(name, abc_political_poll, cbs_political_poll)
results
results.df = data.frame(name, abc_political_poll, cbs_political_poll)
results.df
r = rowMeans(results.df[,2:3])
r.df = data.frame(name, r)
mean(as.matrix(results.df[,2:3]))