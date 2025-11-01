This repository contains the complete R scripts and supplementary materials used in the meta-analysis:

**Silva AMP**, Tudella GCN, Cardoso LJC, Gonçalves OR, **Menegucci G**, Scarramal JPL, Santos DH, Gün A, Noleto GS, Perry G, Høilund-Carlsen PF, Franco ES, Maia MBS.  
*Stroke and Risk of Alzheimer’s Disease: A Systematic Review, Meta-analysis, and Meta-regression* (2025).

---

## Repository contents
- `/scripts`: Annotated R scripts for all analyses (conversion, pooling, meta-regression, and sensitivity).
- `/figures`: Forest plots, funnel plots, and bubble plots.
- `/data`: Extracted datasets and study-level characteristics.
- `/supplementary`: Additional PRISMA/MOOSE tables and high-resolution figures.

---

## Statistical environment
All analyses were performed in **R 4.4.1** using the following packages:
- `meta` (v6.5-0)
- `metafor` (v4.4-0)
- `dmetar` (v0.1.3)

Random-effects models were fitted with **REML** estimation.  
Subgroup and meta-regression analyses explored heterogeneity by:
- Diagnostic criteria (NINCDS-ADRDA vs ICD)
- Study design (prospective vs retrospective)
- Follow-up duration
- Sex, age group, and geographic region

---

## Key scripts

| File | Description |
|------|--------------|
| `01_data_preparation.R` | Prepares and transforms extracted data; converts ORs to HRs. |
| `02_meta_analysis.R` | Runs the main meta-analysis models. |
| `03_meta_regression.R` | Performs univariable and multivariable meta-regression. |
| `04_sensitivity_analysis.R` | Conducts leave-one-out and risk-of-bias sensitivity analyses. |
| `05_plots.R` | Generates forest, funnel, and bubble plots. |

---

## Citation
Please cite this repository when using or adapting the provided code:
> Silva AMP, Tudella GCN, Cardoso LJC, Gonçalves OR, Menegucci G, et al. (2025). *Stroke and Risk of Alzheimer’s Disease: A Systematic Review, Meta-analysis, and Meta-regression.* GitHub: [https://github.com/meneguccigi-bit/Stroke-and-Risk-of-Alzheimer-s-Disease](https://github.com/meneguccigi-bit/Stroke-and-Risk-of-Alzheimer-s-Disease)

---

## Contact
For reviewer access or questions, please contact:

- **Anderson Matheus Pereira da Silva** — [anderson.matheuss@ufpe.br](mailto:anderson.matheuss@ufpe.br) / [anderson.mhps@icloud.com](mailto:anderson.mhps@icloud.com)  
- **Giovana Menegucci** — [meneguccigi@gmail.com]

---

## License
Distributed under the **MIT License** for academic and non-commercial use.
