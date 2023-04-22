# Software and Hardware Used for the 2023 Assessments

## MULTIFAN-CL

Version | Date       |    Size | Location                                       | Purpose
------- | ---------- | ------- | ---------------------------------------------- | ----------------
2.0.7.0 | 2020-02-11 | 9474872 | //penguin/assessments/mfcl/2020_01_17_devvsn12 | 2020 assessments
2.1.0.0 | 2023-03-21 | 9715080 | //penguin/assessments/mfcl/2023-03-21_vsn2100  | 2023 assessments

## Tools to Examine Data

...

## R Package to Submit Condor Runs

* [condor](https://github.com/PacificCommunity/ofp-sam-condor)

## Tools to Examine One Model Run

## Tools to Compare Runs

*Shiny apps*

* [Bigeye](https://arni-magnusson.shinyapps.io/bet_2023_stepwise)
* [Yellowfin](https://arni-magnusson.shinyapps.io/yft_2023_stepwise)
* [Shiny repository](https://github.com/PacificCommunity/ofp-sam-shinyMFCL)

*R packages*

* [diags4MFCL](https://github.com/PacificCommunity/ofp-sam-diags4MFCL) has a
  general `plot.comparisons`, along with more specific functions:
  `plot.biomass`, `plot.depletion`, `plot.F.temporal`, `plot.growth`, and
  `plot.selectivity`.

## Hardware

Run times for the
[swo2017_refcase](https://github.com/PacificCommunity/ofp-sam-mfcl-school/tree/main/tutorial_1_ccond/swo2017_refcase)
model run:

Machine     | Min
----------- | ---
WSL_home    |  17
Condor      |  22
WSL_C_drive | 223
WSL_D_drive | 133

Clearly, one should not run models on the C or D drives.

## Improvements in the toolchain

Tool                                                             | Purpose       | Feature                 | Improvement
---------------------------------------------------------------- | ------------- | ----------------------- | --------------------------------------------------------------
[MFCL](https://mfcl.spc.int)                                     | Fit model     | Objective function      | Consistent +/- sign of objfun, also in .par
[FLR4MFCL](https://github.com/PacificCommunity/ofp-sam-fl4rmfcl) | R-to-MFCL     | MFCLLikelihood          | Reads in negative objfun, reads in Age likelihood
"                                                                |               | Parameter correlation   | read.MFCLCor, mat2MFCLCor, corFilter, corLabel
"                                                                |               | Compare flags           | diffFlags, diffFlagsStepwise, flagMeaning
"                                                                |               | Find model results      | finalPar, finalRep
[Shiny](https://github.com/PacificCommunity/ofp-sam-shinyMFCL)   | Explore runs  | Code reorganization     | Easier to adapt to new stock, common trunk
"                                                                |               | Likelihood table        | Includes CPUE and Age
"                                                                |               | Official app collection | In one place, ofp-sam-shinyMFCL
[condor](https://cran.r-project.org/package=condor)              | R-to-Condor   | Package on CRAN         | User scripts become much shorter
"                                                                |               | Submit/list/download    | Efficient and reliable Condor runs: stepwise and grid
[makeit](https://cran.r-project.org/package=makeit)              | Automation    | Package on CRAN         | One R script runs other R scripts when needed
"                                                                |               | Run R scripts if needed | Efficient and reliable R jobs: all plots and tables
[Proper](https://github.com/PacificCommunity/ofp-sam-proper)     | Project mgmt  | Standard dir structure  | Allows us to develop and use shared tools across stocks
"                                                                |               | "                       | Guarantee that next assessor can find and reuse all components
"                                                                |               | R script checks         | Strengthens reproducibility of analyses
