
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
|compute|28.2642|0:00:28|29.67|73.08|24.84|25.55|65.53|0.00|52.05|
|search|13.2366|0:00:13|227.98|271.23|223.12|223.85|6906.75|3431.58|92.33|
|gather|100.2634|0:01:40|1981.16|2976.39|1976.33|1977.10|3498.04|1728.67|76.30|
|lca_search|36.2848|0:00:36|3717.41|3761.29|3712.64|3713.35|130.66|0.00|41.15|
|lca_gather|39.3339|0:00:39|3713.68|3757.55|3709.21|3709.92|130.66|0.00|37.96|
|compare|2.2966|0:00:02|54.14|1049.11|49.10|49.89|24.52|0.00|66.22|
|index|46.9376|0:00:46|541.29|584.30|536.39|537.07|841.43|1384.56|95.32|

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
