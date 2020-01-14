
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
|compute|204.4189|0:03:24|29.94|74.68|25.62|25.80|0.00|0.00|95.75|
|search|53.5385|0:00:53|3442.56|3487.13|3438.69|3438.87|0.00|3120.17|85.09|
|gather|284.0060|0:04:44|2136.88|3450.53|2132.41|2132.62|0.00|1870.95|90.30|
|lca_search|166.9995|0:02:46|4402.20|4572.50|4397.82|4398.00|0.00|0.00|99.40|
|lca_gather|170.2372|0:02:50|4509.68|5926.93|4505.15|4505.35|0.00|0.00|97.70|
|compare|20.7739|0:00:20|59.37|1374.23|54.93|55.13|0.06|0.00|76.99|

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
