
## Computational Environment

All processing and analysis scripts were performed using the conda environment specified in `environment.yml`.
To build and activate this environment run:

```bash
conda env create --force --file environment.yml

conda activate sourmash_resources
```

## Resources (for master)

| command | s | h:m:s | max_rss | max_vms | max_uss | max_pss | io_in | io_out | mean_load  |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
|compute|199.2700|0:03:19|34.78|70.74|30.35|30.47|0.00|0.00|98.26|
|search|22.6099|0:00:22|233.12|268.14|228.82|228.94|0.00|2465.77|69.00|
|gather|193.7676|0:03:13|2085.33|3390.10|2081.24|2081.39|0.00|1832.99|85.81|
|lca_search|75.9855|0:01:15|4147.04|4182.51|4143.23|4143.35|0.00|0.00|60.36|
|lca_gather|81.5932|0:01:21|4522.37|5925.67|4517.97|4518.12|0.00|0.00|93.48|
|compare|5.0422|0:00:05|61.66|1366.43|57.27|57.42|0.00|0.00|90.61|
|index|232.9069|0:03:52|539.66|575.04|535.39|535.50|0.03|1296.12|36.77|

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
