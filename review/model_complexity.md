I. Looking through Peer Review panel comments on model complexity

The string 'complex' occurs 24 times.

There is a dedicated section B.5:

B.5 Model complexity

**Too little time**
The extent of data and model complexity requires more time and attention than
can be afforded via WCPFC's SC process.

The model complexity and
ability to transparently demonstrate the interplay of how data and model
configurations impact results is a theme of this review. This occurred partly
because the lead author was unavailable to respond to queries on some of the
assessment details (no longer working for SPC, but did provide answers to some
questions by e-mail). The SPC analysts have done an admirable job in developing
ways to disentangle the interactions between new data and model configurations.
During the review, the Panel suggested developing a more transparent way to
document incremental model changes (Table 1). The Panel notes that the current
model formulation (e.g., spatial structure and fishery definitions) aims to
mimic the structure of the bigeye assessment. This is partly to improve the
efficiency of conducting assessments of bigeye and yellowfin side by side and
partly related to the similarity in the fisheries targeting the two stocks.
However, the structure of the data for, and the behavior of, yellowfin differ
from those of bigeye, such that the current model structure for yellowfin likely
leads to model instability and unnecessary complexity. The Panel recommends the
following elements be considered in developing a new (2023) yellowfin
assessment:

- Development of a conceptual model for yellowfin in the WCPO. This would involve synthesizing
(in the absence of a model) the information on data (e.g., length and CPUE data), what is known
about movement from tagging, including whether juveniles would be expected to have the same
movement rates as adults, information from genetics and other indicators of stock structure, and
information from oceanography on likely distribution. The development of the conceptual model
might occur during a workshop or other review process involving relevant experts, including the
stock assessment team.
- Analysis of the length-composition data based on methods used by Maunder et al. (2022) - or a
similar approach - to assess which areas/fleets should be combined for the purposes of defining
regions and fisheries (see Lennert-Cody et al., 2010, 2013).
- In general, the Panel expects that simpler models will result from this process. In particular, there
seems little basis for separating region 9 for this assessment. However, it notes that without
evaluating a model with the added complexity (e.g., movement among areas), it may be difficult to
appreciate the extent to which simpler models may violate assumptions.
- The analysts should use the results of the conceptual model to identify "realism constraints" and
expected model behavior. Consideration should be given to in which regions recruitment should be
expected (the current result that there is no recruitment to region 8 seems implausible a priori - but
earlier assessments had zero recruitment in other regions).
- To the extent possible, multiple fisheries based on the same gear within the same region should be
avoided, unless needed given difficulties in replicating tag returns.
- The Hessian matrix should be explored to assess not just the variances of the parameter estimates
and the derived variables, but also which parameters may be confounded.
Absent the above process, the Panel identifies that there are some model options that would provide
worthwhile information:
- Consider a model based on data for only the equatorial areas (regions 7, 8, 3 and 4) modelled as a
single area and compare its results with an equivalently parameterized Stock Synthesis model. The
model would be structured as "fleets-as-areas" with the fleets selected using, for example, the
regression tree approach outlined above.
- Allow juvenile movement rates to differ from those for adults (which may be set to zero).
- Tagging data are typically complicated by the limited opportunities to tag fish, which restricts the
spatial distribution of releases. Consequently, tag mixing is a major problem that needs to be dealt
with when analyzing the data. A fine-scale movement model would be useful for defining the time
it takes for tagged animals to fully mix into the population within a region and experience the same
probability of recapture as untagged fish in the region. A new approach that models the spatial-
temporal distribution of tags using advection diffusion models and the spatial distribution of the
untagged population using spatio-temporal models is being developed for skipjack tuna in the
eastern Pacific Ocean (Maunder et al., 2021; Mildenberger et al., 2022). This fine-scale spatio-
temporal approach would avoid the need to eliminate information by estimating a separate fishing
mortality parameter during the mixing period and minimize the edge effect related to how close
the fish are tagged to the edge of the large blocks used in the assessment model. However, methods
to integrate the information from the analysis into the stock assessment model need to be
developed.
