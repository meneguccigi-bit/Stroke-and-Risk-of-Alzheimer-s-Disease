#' Overall and Sex-Stratified Meta-analysis
#' Complete code from supplementary material

library(meta)
library(metafor)

# Sex-stratified data
dados_sexo <- data.frame(
  Study = c("Hayden, 2006", "Hayden, 2006", "Gong, 2021", "Gong, 2021", "Bucci, 2025", "Bucci, 2025"),
  Sex = c("Male", "Female", "Male", "Female", "Male", "Female"),
  HR = c(0.87, 1.57, 1.50, 2.10, 1.18, 1.28),
  low = c(0.05, 0.37, 1.04, 1.41, 1.08, 1.16),
  high = c(4.73, 4.52, 2.15, 3.13, 1.30, 1.40)
)

# Calculate log HR and standard error
dados_sexo$logHR <- log(dados_sexo$HR)
dados_sexo$selogHR <- (log(dados_sexo$high) - log(dados_sexo$low)) / (2 * 1.96)

# Male meta-analysis
meta_male <- metagen(
  TE = logHR, 
  seTE = selogHR, 
  studlab = Study, 
  data = subset(dados_sexo, Sex == "Male"), 
  sm = "HR", 
  method.tau = "REML"
)

# Female meta-analysis
meta_female <- metagen(
  TE = logHR, 
  seTE = selogHR, 
  studlab = Study, 
  data = subset(dados_sexo, Sex == "Female"), 
  sm = "HR", 
  method.tau = "REML"
)

# Overall meta-analysis data
dados_AD <- data.frame(
  Study = c("Qiu 2010", "Bermejo-Pareja 2007", "Lindsay 2002", "Huang 2015", 
            "Honig 2003", "Hayden 2006", "Vilalta-Franch 2012", "Gong 2021", 
            "Bucci 2025", "Du 2022", "Du 2024", "Dodge 2011"),
  HR = c(1.20, 2.55, 1.39, 3.53, 1.57, 1.16, 1.53, 1.40, 0.90, 1.32, 1.50, 1.73),
  lower = c(0.77, 1.35, 0.90, 2.47, 1.02, 0.35, 0.64, 0.82, 0.75, 1.27, 1.46, 0.88),
  upper = c(1.89, 4.82, 2.00, 5.05, 2.42, 2.91, 3.66, 2.41, 1.08, 1.37, 1.55, 3.39)
)

# Calculate effect sizes for overall analysis
dados_AD$logHR <- log(dados_AD$HR)
dados_AD$selogHR <- (log(dados_AD$upper) - log(dados_AD$lower)) / (2 * 1.96)

# Overall meta-analysis
meta_all <- metagen(
  TE = logHR, 
  seTE = selogHR, 
  studlab = Study, 
  data = dados_AD, 
  sm = "HR", 
  method.tau = "REML"
)

# Print results
cat("=== META-ANALYSIS RESULTS ===\n")
cat("\n--- Male Subgroup ---\n")
print(summary(meta_male))

cat("\n--- Female Subgroup ---\n")
print(summary(meta_female))

cat("\n--- Overall Analysis ---\n")
print(summary(meta_all))

# Heterogeneity assessment
cat("\n=== HETEROGENEITY ===\n")
cat("Overall I²:", round(meta_all$I2, 1), "%\n")
cat("Tau²:", round(meta_all$tau2, 3), "\n")
cat("Q-test p-value:", round(meta_all$pval.Q, 4), "\n")
