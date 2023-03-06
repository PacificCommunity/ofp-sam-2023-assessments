# Software and Hardware Used for the 2023 Assessments

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

Machine            | Minutes
------------------ | -------
WSL_Arni_local     |      15
WSL_Jemery_local   |      17
Condor             |      22
WSL_Jemery_D_drive |     133
WSL_Arni_C_drive   |     223

Clearly, one should not run models on the C or D drives.
