if(!exists("run.projections")){
  source("https://raw.githubusercontent.com/SEFSC/SFD-AllocationForecasting/refs/heads/main/Allocation_forecasting.R")
}

# Prepare function inputs
Assessment_dir <- "../model_runs/01_google_drive"
abc_frac <- 0.75  # ABC target at 75% of the OFL F
OFL_rec_set <- 3  # OFL catches calculated using recent mean recruitment
ABC_rec_set <- 3  # same as for OFL

# For reference the Benchmark runs always use the stock-recruit curve to
# calculate F_OFL and unfished SSB

# Run function
run.projections(Assessment_dir = Assessment_dir,
                ABC_Fraction = abc_frac,
                OFL_recruit_setting = OFL_rec_set,
                ABC_recruit_setting = ABC_rec_set)
