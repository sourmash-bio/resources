
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

## Resources (for master)

| command | s | h:m:s | max_rss | max_vms | max_uss | max_pss | io_in | io_out | mean_load  |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
|compute|28.3451|0:00:28|24.51|43.41|20.39|20.88|65.28|0.00|52.01|
|search|6.0830|0:00:06|220.91|239.27|216.86|217.37|3330.49|0.00|82.70|
|gather|26.9162|0:00:26|2418.55|3403.84|2413.11|2413.94|1391.04|0.00|56.10|
|lca_search|38.7191|0:00:38|3591.15|3610.17|3587.06|3587.55|130.72|0.00|39.18|
|lca_gather|38.4842|0:00:38|3603.81|3622.92|3599.88|3600.37|130.72|0.00|39.18|
|compare|2.2684|0:00:02|49.59|868.91|43.99|44.85|21.57|0.00|67.47|
|index|20.0066|0:00:20|525.02|543.39|520.98|521.47|231.04|152.64|74.23|
