#' Conversion of Odds Ratios to Hazard Ratios
#' Based on Zhang & Yu (1998) JAMA method

# Function to convert OR to RR
or_to_rr <- function(OR, P0) {
  RR <- OR / ((1 - P0) + (P0 * OR))
  return(RR)
}

# Function to convert RR to HR (approximation)
rr_to_hr <- function(RR) {
  return(RR)
}

# Main conversion function
or_to_hr <- function(OR, P0) {
  RR <- or_to_rr(OR, P0)
  HR <- rr_to_hr(RR)
  return(HR)
}

# Example conversion from the supplementary material
OR <- 1.54
CI_low <- 0.88
CI_high <- 2.67
P0 <- 0.20

HR <- or_to_hr(OR, P0)
HR_low <- or_to_hr(CI_low, P0)
HR_high <- or_to_hr(CI_high, P0)

cat("Converted HR:", round(HR, 2), 
    " (", round(HR_low, 2), ",", round(HR_high, 2), ")\n")

# Batch conversion function for multiple studies
batch_or_to_hr <- function(OR_vector, CI_low_vector, CI_high_vector, P0_vector) {
  HR_results <- data.frame(
    Study = names(OR_vector),
    OR = OR_vector,
    HR = sapply(seq_along(OR_vector), function(i) or_to_hr(OR_vector[i], P0_vector[i])),
    HR_low = sapply(seq_along(OR_vector), function(i) or_to_hr(CI_low_vector[i], P0_vector[i])),
    HR_high = sapply(seq_along(OR_vector), function(i) or_to_hr(CI_high_vector[i], P0_vector[i]))
  )
  return(HR_results)
}

# Test with multiple studies
ORs <- c(1.54, 2.10, 1.30)
CIs_low <- c(0.88, 1.20, 0.95)
CIs_high <- c(2.67, 3.68, 1.78)
P0s <- c(0.20, 0.15, 0.25)

study_names <- c("Study_A", "Study_B", "Study_C")
batch_results <- batch_or_to_hr(ORs, CIs_low, CIs_high, P0s)
print(batch_results)
