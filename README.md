# Stroke and Risk of Alzheimer's Disease: A Systematic Review, Meta-analysis, and Meta-regression

This repository contains the complete R scripts used in the meta-analysis:

**Silva AMP**, Tudella GCN, Cardoso LJC, Gonçalves OR, **Menegucci G**, Scarramal JPL, Santos DH, Gün A, Noleto GS, Perry G, Høilund-Carlsen PF, Franco ES, Maia MBS.  
*Stroke and Risk of Alzheimer's Disease: A Systematic Review, Meta-analysis, and Meta-regression* (2025).

---

## Repository Structure
stroke-alzheimers-meta-analysis/
└── scripts/
├── 01_effect_conversion.R
├── 02_meta_analysis.R
├── 03_meta_regression.R
├── 04_sensitivity_analysis.R
└── 05_subgroup_analysis.R

---

## Statistical Environment

All analyses were performed in **R 4.4.1** using the following packages:
- `meta` (v6.5-0)
- `metafor` (v4.4-0)
- `dmetar` (v0.1.3)

Random-effects models were fitted with **REML** estimation.

---

## Analysis Scripts

| File | Description |
|------|-------------|
| `01_effect_conversion.R` | Converts Odds Ratios to Hazard Ratios using Zhang & Yu (1998) method |
| `02_meta_analysis.R` | Runs overall and sex-stratified meta-analysis models |
| `03_meta_regression.R` | Performs univariable meta-regression with multiple moderators |
| `04_sensitivity_analysis.R` | Conducts leave-one-out and publication bias analyses |
| `05_subgroup_analysis.R` | Subgroup analyses by diagnostic criteria, study design, and follow-up duration |

---

## Analyses Included

- **Effect size conversion**: OR to HR transformation
- **Meta-analysis**: Overall and sex-stratified models
- **Meta-regression**: Age, sex distribution, follow-up duration, sample size, quality assessment
- **Sensitivity analysis**: Leave-one-out, publication bias (Egger's test)
- **Subgroup analysis**: Diagnostic criteria, study design, follow-up duration, age groups


## Citation

Please cite this repository when using or adapting the provided code:

> Silva AMP, Tudella GCN, Cardoso LJC, Gonçalves OR, Menegucci G, et al. (2025). *Stroke and Risk of Alzheimer's Disease: A Systematic Review, Meta-analysis, and Meta-regression.* GitHub: [https://github.com/meneguccigi-bit/Stroke-and-Risk-of-Alzheimer-s-Disease](https://github.com/meneguccigi-bit/Stroke-and-Risk-of-Alzheimer-s-Disease)

---

## Contact

For questions about the code or analyses, please contact:

- **Anderson Matheus Pereira da Silva** — [anderson.matheuss@ufpe.br](mailto:anderson.matheuss@ufpe.br) / [anderson.mhps@icloud.com](mailto:anderson.mhps@icloud.com)  
- **Giovana Menegucci** — [meneguccigi@gmail.com]

---

## License

Distributed under the **MIT License** for academic and non-commercial use.
