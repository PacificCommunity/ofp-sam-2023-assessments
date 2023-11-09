# Calculate sigma for CPUE using maximum likelihood

See Section 5.5.1 in the 2023 yellowfin assessment report:
* [WCPFC-SC19-2023/SA-WP-04](https://meetings.wcpfc.int/node/19352)

The `simple` model is the case when all CPUE index values have the same sigma:
* [sigma.R](simple/sigma.R)
* [cpue.csv](simple/cpue.csv)

The `year_specific` model is the case when each CPUE index value has its own
sigma value:
* [sigma.R](year_specific/sigma.R)
* [cpue.csv](year_specific/cpue.csv)
