# Read Table 3
tab3 <- read.table("Munyandorero_2020_Table_3.dat", header=TRUE)

# Rearrange stats
stats <- tab3[c("Statistic", "RedSnapper")]
stats <- as.data.frame(as.list(stats$RedSnapper))
names(stats) <- tab3$Statistic
