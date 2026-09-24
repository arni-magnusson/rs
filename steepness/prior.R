# Read Table 3
tab3 <- read.table("Munyandorero_2020_Table_3.dat", header=TRUE)

# Rearrange table information
stats <- tab3[c("Statistic", "RedSnapper")]
stats <- as.data.frame(as.list(stats$RedSnapper))
names(stats) <- tab3$Statistic

# Extract main statistics of interest
median <- stats$Median
sigma <- stats$SD

# Plot prior
par(mfrow=c(3,1))
min <- 0.20
max <- 0.99
x <- seq(min, max, by=0.01)
y <- dlnorm(x, log(median), sigma)
plot(x, y, type="l", yaxs="i", xlim=c(0.4, 1.0), ylim=c(0, 1.05*max(y)))

# Calculate quantiles
qlnorm(0.05, log(median), sigma)
qlnorm(0.95, log(median), sigma)

# Sample from prior
n <- 1e6
h.draws <- qlnorm((1:n-0.5)/n, log(median), sigma)
h.draws <- h.draws[h.draws <= max]
hist(h.draws, 100, main="")
quantile(h.draws, c(0.05, 0.95))

# Stock Synthesis Prior type 3 (log-normal) equation from user manual
f <- function(x, m, sd)
{
  1/2 * ((log(x) - m) / sd)^2
}

ss3prior <- exp(-f(x, log(median), sigma))
plot(x, ss3prior, type="l")
