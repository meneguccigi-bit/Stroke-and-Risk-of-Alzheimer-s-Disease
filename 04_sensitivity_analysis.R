#' Sensitivity and Leave-One-Out Analyses
#' Complete code from supplementary material

library(meta)

# Leave-one-out analysis function
leave_one_out <- function(data) {
  studies <- unique(data$Study)
  results <- data.frame()
  
  for (study in studies) {
    temp_data <- data[data$Study != study, ]
    
    meta_temp <- metagen(
      TE = logHR,
      seTE = selogHR,
      studlab = Study,
      data = temp_data,
      sm = "HR",
      method.tau = "REML"
    )
    
    results <- rbind(results, data.frame(
      Omitted_Study = study,
      HR = round(exp(meta_temp$TE.random), 2),
      CI_low = round(exp(meta_temp$lower.random), 2),
      CI_high = round(exp(meta_temp$upper.random), 2),
      I2 = round(meta_temp$I2, 1)
    ))
  }
  
  return(results)
}

# Run leave-one-out analysis on overall data
loo_results <- leave_one_out(dados_AD)

# Publication bias assessment
funnel_test <- metabias(meta_all, method.bias = "linreg", k.min = 5)

# Fixed-effects model for sensitivity
meta_fixed <- metagen(
  TE = logHR, 
  seTE = selogHR, 
  studlab = Study, 
  data = dados_AD, 
  sm = "HR", 
  method.tau = "DL"
)

# Print sensitivity analysis results
cat("=== SENSITIVITY ANALYSIS RESULTS ===\n")

cat("\n--- Leave-One-Out Analysis ---\n")
print(loo_results)

cat("\n--- Publication Bias (Egger's Test) ---\n")
print(funnel_test)

cat("\n--- Fixed-Effects Model ---\n")
print(summary(meta_fixed))

# Compare random vs fixed effects
cat("\n--- Model Comparison ---\n")
cat("Random effects I²:", round(meta_all$I2, 1), "%\n")
cat("Fixed effects I²:", round(meta_fixed$I2, 1), "%\n")
cat("Random effects HR:", round(exp(meta_all$TE.random), 2), "\n")
cat("Fixed effects HR:", round(exp(meta_fixed$TE.random), 2), "\n")
