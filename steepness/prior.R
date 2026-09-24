# Read Table 3
tab3 <- read.table("Munyandorero_2020_Table_3.dat", header=TRUE)

# Rearrange table information
stats <- tab3[c("Statistic", "RedSnapper")]
stats <- as.data.frame(as.list(stats$RedSnapper))
names(stats) <- tab3$Statistic

# Extract main statistics of interest
median <- stats$Median
sigma <- stats$SD

# Stock Synthesis lognormal prior (Type 3) equation from user manual
f <- function(x, m, sd)
{
  1/2 * ((log(x) - m) / sd)^2  # -logL
}

# Calculate prior
min <- 0.20
max <- 0.99
x <- seq(min, max, by=0.01)
ss3prior <- exp(-f(x, log(median), sigma))

# Plot prior
png("prior.png", width=2000, height=1200, res=200)
plot(x, ss3prior, type="l", xlim=c(0.4, 1), xlab="Steepness", ylab="Prior likelihood")
title(main="Prior on steepness")
text(0.4, 0.9, "logMedian = 0.79", adj=0)
text(0.4, 0.8, "sigma = 0.16", adj=0)
dev.off()

# Lower  Upper  Init  logMedian   sigma  Type  Phase
# 0.2    0.99   0.79  -0.2357223  0.16   3     1      0  0  0  0  0  0  0  # SR_BH_steep
