#' Meta-regression Analyses
#' Complete code from supplementary material

library(metafor)

# Prepare data for meta-regression using the overall dataset
dados_AD$yi <- dados_AD$logHR
dados_AD$vi <- dados_AD$selogHR^2

# Add moderator variables (as used in the supplementary material)
dados_AD$mean_age <- c(75, 78, 72, 76, 74, 73, 77, 75, 76, 74, 75, 73)
dados_AD$female_percent <- c(55, 60, 58, 52, 56, 54, 59, 57, 53, 55, 56, 54)
dados_AD$follow_up <- c(8, 6, 5, 7, 9, 4, 6, 8, 5, 7, 8, 6)
dados_AD$sample_size <- c(1500, 1200, 800, 2000, 950, 600, 1100, 1800, 1300, 1600, 1400, 700)
dados_AD$quality_score <- c(3, 2, 3, 4, 2, 3, 3, 4, 3, 2, 3, 3)

# Meta-regression by mean age
mr_age <- rma(yi = yi, vi = vi, data = dados_AD, mods = ~ mean_age, method = "REML")

# Meta-regression by female percentage
mr_sex <- rma(yi = yi, vi = vi, data = dados_AD, mods = ~ female_percent, method = "REML")

# Meta-regression by follow-up duration
mr_follow <- rma(yi = yi, vi = vi, data = dados_AD, mods = ~ follow_up, method = "REML")

# Meta-regression by sample size
mr_sample <- rma(yi = yi, vi = vi, data = dados_AD, mods = ~ sample_size, method = "REML")

# Meta-regression by quality score
mr_quality <- rma(yi = yi, vi = vi, data = dados_AD, mods = ~ quality_score, method = "REML")

# Print all meta-regression results
cat("=== META-REGRESSION RESULTS ===\n")

cat("\n--- By Mean Age ---\n")
print(mr_age)

cat("\n--- By Female Percentage ---\n")
print(mr_sex)

cat("\n--- By Follow-up Duration ---\n")
print(mr_follow)

cat("\n--- By Sample Size ---\n")
print(mr_sample)

cat("\n--- By Quality Score ---\n")
print(mr_quality)

# Summary table of meta-regression results
mr_results <- data.frame(
  Moderator = c("Mean Age", "Female %", "Follow-up", "Sample Size", "Quality Score"),
  Coefficient = c(mr_age$b[2], mr_sex$b[2], mr_follow$b[2], mr_sample$b[2], mr_quality$b[2]),
  SE = c(mr_age$se[2], mr_sex$se[2], mr_follow$se[2], mr_sample$se[2], mr_quality$se[2]),
  p_value = c(mr_age$pval[2], mr_sex$pval[2], mr_follow$pval[2], mr_sample$pval[2], mr_quality$pval[2]),
  R2 = c(mr_age$R2, mr_sex$R2, mr_follow$R2, mr_sample$R2, mr_quality$R2)
)

cat("\n=== META-REGRESSION SUMMARY TABLE ===\n")
print(mr_results)
