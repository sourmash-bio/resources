
## Computational Environment

All processing and analysis scripts were performed using the conda environment specified in `environment.yml`.
To build and activate this environment run:

```bash
conda env create --force --file environment.yml

conda activate sourmash_resources
```

## Resources

| command | s | h:m:s | max_rss | max_vms | max_uss | max_pss | io_in | io_out | mean_load  |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
|compute|168.8526|0:02:48|48.12|1353.26|43.60|43.85|0.47|0.00|98.28|
|search|38.8619|0:00:38|1605.39|2909.98|1601.70|1602.36|0.00|1388.56|40.85|
|gather|165.7208|0:02:45|1930.38|3234.86|1926.19|1926.92|8.34|1709.99|82.00|
|lca_search|70.6442|0:01:10|4187.27|5492.04|4182.67|4182.95|0.00|0.00|64.87|
|lca_gather|328.1457|0:05:28|5890.84|7309.02|5886.55|5886.82|0.00|0.00|96.58|
|compare|94.8060|0:01:34|73.61|1378.46|68.95|69.22|0.47|0.00|80.32|

## Plots

### compute

[![](plots/compute.svg?sanitize=true)](plots/compute.svg)

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
