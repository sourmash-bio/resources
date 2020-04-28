
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
|compute|27.6787|0:00:27|24.54|43.62|20.48|20.95|130.33|0.00|53.26|
|search|5.7766|0:00:05|221.00|239.24|216.86|217.35|3542.30|0.00|88.31|
|gather|26.7848|0:00:26|2419.35|3404.14|2413.77|2414.59|1390.97|0.00|56.71|
|lca_search|37.8804|0:00:37|3622.41|3641.39|3618.46|3618.92|130.65|0.00|39.73|
|lca_gather|38.5826|0:00:38|3618.79|3637.89|3614.92|3615.38|246.94|0.00|39.29|
|compare|2.4325|0:00:02|49.62|868.85|43.97|44.82|35.48|0.00|60.05|
|index|17.0375|0:00:17|529.46|547.55|525.18|525.65|232.28|834.07|86.58|

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
