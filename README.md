
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
|compute|28.9644|0:00:28|25.17|452.46|21.90|22.77|69.74|0.00|51.69|
|search|6.5236|0:00:06|240.85|668.89|237.73|238.55|3515.33|0.00|86.17|
|gather|28.4542|0:00:28|2198.07|2971.91|2194.98|2195.84|1406.25|0.00|54.06|
|lca_search|41.7801|0:00:41|3590.98|4018.90|3587.96|3588.79|261.56|0.00|36.98|
|lca_gather|43.2280|0:00:43|3590.91|4018.90|3587.92|3588.76|261.56|0.00|35.60|
|compare|2.4714|0:00:02|48.12|508.76|45.02|45.86|31.80|0.00|62.34|
|index|18.9217|0:00:18|526.86|954.88|523.93|524.76|242.65|171.25|79.49|
