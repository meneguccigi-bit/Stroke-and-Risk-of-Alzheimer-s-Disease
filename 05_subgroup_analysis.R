#' Subgroup Analyses
#' Complete code from supplementary material

library(meta)

# Add subgroup variables to the dataset
dados_AD$diag_criteria <- c("NINCDS", "NINCDS", "NINCDS", "ICD", "NINCDS", "NINCDS", 
                           "NINCDS", "ICD", "ICD", "ICD", "ICD", "NINCDS")

dados_AD$study_design <- c("Prospective", "Prospective", "Prospective", "Case-control", 
                          "Prospective", "Prospective", "Prospective", "Prospective", 
                          "Retrospective", "Retrospective", "Retrospective", "Prospective")

dados_AD$follow_group <- c("More than 5 years", "≤5 years", "≤5 years", "More than 5 years",
                          "More than 5 years", "≤5 years", "≤5 years", "More than 5 years",
                          "≤5 years", "More than 5 years", "More than 5 years", "More than 5 years")

dados_AD$age_group <- c(rep("≥65 years", 7), "≥65 years", "≥65 years", "≥65 years", "≥65 years", "≥65 years")

# Subgroup analysis by diagnostic criteria
meta_diag <- metagen(
  TE = logHR, 
  seTE = selogHR, 
  studlab = Study, 
  data = dados_AD, 
  sm = "HR", 
  method.tau = "REML",
  byvar = diag_criteria
)

# Subgroup analysis by study design
meta_design <- metagen(
  TE = logHR, 
  seTE = selogHR, 
  studlab = Study, 
  data = dados_AD, 
  sm = "HR", 
  method.tau = "REML",
  byvar = study_design
)

# Subgroup analysis by follow-up duration
meta_follow <- metagen(
  TE = logHR, 
  seTE = selogHR, 
  studlab = Study, 
  data = dados_AD, 
  sm = "HR", 
  method.tau = "REML",
  byvar = follow_group
)

# Subgroup analysis by age group
meta_age <- metagen(
  TE = logHR, 
  seTE = selogHR, 
  studlab = Study, 
  data = dados_AD, 
  sm = "HR", 
  method.tau = "REML",
  byvar = age_group
)

# Print subgroup analysis results
cat("=== SUBGROUP ANALYSIS RESULTS ===\n")

cat("\n--- By Diagnostic Criteria ---\n")
print(meta_diag)

cat("\n--- By Study Design ---\n")
print(meta_design)

cat("\n--- By Follow-up Duration ---\n")
print(meta_follow)

cat("\n--- By Age Group ---\n")
print(meta_age)

# Between-subgroup heterogeneity tests
cat("\n=== BETWEEN-SUBGROUP HETEROGENEITY ===\n")
cat("Diagnostic criteria Q-test p-value:", round(meta_diag$pval.Q.b, 4), "\n")
cat("Study design Q-test p-value:", round(meta_design$pval.Q.b, 4), "\n")
cat("Follow-up duration Q-test p-value:", round(meta_follow$pval.Q.b, 4), "\n")
cat("Age group Q-test p-value:", round(meta_age$pval.Q.b, 4), "\n")
