# SNAPSOC
This package runs the SNAP soil organic carbon model. More detail on the model can be found in the paper:
Ritchie ME. 2014. Plant compensation to grazing and soil carbon dynamics in a tropical grassland. PeerJ 2:e233 https://doi.org/10.7717/peerj.233

## How to install
You can install the package directly from GitHub:
```
devtools::install_github("swood-ecology/SNAPSOC", build_vignettes=TRUE)
```

Make sure that you've included the option to build vignettes, because this will create the documentation you need to see how the function works.

Next, load the package:
```
library(SNAPSOC)
```

## Basic functionality
To see some of the basic functionality of the package, check out an introduction vignette:
```
vignette("SNAPSOC")
```
