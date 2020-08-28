
## Computational Environment

All processing and analysis scripts were performed using the conda environment specified in `environment.yml`.
To build and activate this environment run:

```bash
conda env create --force --file environment.yml

conda activate sourmash_resources
```

## Plots

### compute

[![](plots/compute.svg?sanitize=true)](plots/compute.svg)

### index

[![](plots/index.svg?sanitize=true)](plots/index.svg)

### search

[![](plots/search.svg?sanitize=true)](plots/search.svg)

### gather

[![](plots/gather.svg?sanitize=true)](plots/gather.svg)

### lca search

[![](plots/lca_search.svg?sanitize=true)](plots/lca_search.svg)

### lca gather

[![](plots/lca_gather.svg?sanitize=true)](plots/lca_gather.svg)

### compare

[![](plots/compare.svg?sanitize=true)](plots/compare.svg)

## Resources (for `latest`)

| command | s | h:m:s | max_rss | max_vms | max_uss | max_pss | io_in | io_out | mean_load  |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
|compute|30.6555|0:00:30|25.27|44.22|21.68|22.17|120.89|0.00|48.71|
|search|6.5446|0:00:06|220.11|238.68|216.51|217.03|3451.19|0.00|84.91|
|gather|30.1902|0:00:30|2161.18|2523.48|2157.38|2157.94|1362.64|0.00|50.01|
|lca_search|45.5997|0:00:45|3497.79|3517.00|3494.42|3494.94|256.02|0.00|33.81|
|lca_gather|47.8634|0:00:47|4734.95|4854.42|4729.27|4729.83|288.52|0.02|94.76|
|compare|2.7099|0:00:02|49.37|100.59|45.55|46.11|34.18|0.00|73.48|
|index|20.7338|0:00:20|526.30|544.74|522.65|523.16|231.58|138.88|72.23|
