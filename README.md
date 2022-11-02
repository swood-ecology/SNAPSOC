# SNAPSOC
This package runs the SNAP soil organic carbon model developed by Mark Ritchie. This is a statistical model that estimates soil C stocks as a function of soil texture, fire frequency, rainfall, grazing intensity, and plant community lignin and cellulose content. More detail on the model can be found in the paper:  
<br>
*Ritchie ME. 2014. Plant compensation to grazing and soil carbon dynamics in a tropical grassland. PeerJ 2:e233 https://doi.org/10.7717/peerj.233*

## How to install
You can install the package directly from GitHub:
```
devtools::install_github("swood-ecology/SNAPSOC", build_vignettes=TRUE)
```
Make sure to include the option to build vignettes. This will install a vignette that walks through the basic functionality of the package.

After installing you can load the package in a standard way:
```
library(SNAPSOC)
```

## Basic functionality
To see some of the basic functionality of the package, check out an introduction vignette:
```
vignette("SNAPSOC")
```
