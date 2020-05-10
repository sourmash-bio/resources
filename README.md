
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
|compute|27.5993|0:00:27|24.50|43.66|20.41|20.97|66.66|0.00|53.33|
|search|5.6732|0:00:05|220.78|239.28|216.75|217.31|3600.27|0.00|89.73|
|gather|27.1168|0:00:27|2414.70|3400.61|2410.48|2411.07|1390.08|0.00|55.25|
|lca_search|38.6489|0:00:38|3591.05|3610.17|3586.94|3587.50|130.72|0.00|38.78|
|lca_gather|38.8604|0:00:38|3590.97|3610.17|3586.96|3587.51|130.72|0.00|38.47|
|compare|2.2752|0:00:02|49.37|868.93|45.18|45.75|21.57|0.00|67.28|
|index|20.1124|0:00:20|524.75|543.27|520.64|521.21|231.04|150.80|73.58|
