# Copy model results
file.copy("../model_runs/02_nathan_example", ".", recursive=TRUE)

# Copy executable
file.copy("../ss3/ss3", "02_nathan_example")

# Source
source("Allocation_forecasting.R")

# Prepare function inputs
Assessment_dir <- "02_nathan_example"
ABC_Fraction <- 0.75      # ABC target at 75% of the OFL F
OFL_recruit_setting <- 3  # OFL catches calculated using recent mean recruitment
ABC_recruit_setting <- 3  # same as for OFL

# For reference the Benchmark runs always use the stock-recruit curve to
# calculate F_OFL and unfished SSB

# Run function
results <- run.projections(Assessment_dir = Assessment_dir,
                           ABC_Fraction = ABC_Fraction,
                           OFL_recruit_setting = OFL_recruit_setting,
                           ABC_recruit_setting = ABC_recruit_setting)
