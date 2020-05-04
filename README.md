
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
|compute|27.9973|0:00:27|24.59|43.41|19.65|20.16|129.37|0.00|52.72|
|search|8.4609|0:00:08|220.89|239.27|216.11|216.66|4435.10|0.00|49.88|
|gather|32.5786|0:00:32|2259.42|3232.57|2253.22|2254.07|2306.08|0.00|35.70|
|lca_search|39.1588|0:00:39|3591.23|3610.16|3586.39|3586.92|132.35|0.00|39.07|
|lca_gather|39.6037|0:00:39|3591.23|3610.16|3586.34|3586.87|247.12|0.00|38.61|
|compare|2.3217|0:00:02|49.61|868.91|43.26|44.16|21.57|0.00|66.39|
|index|21.5139|0:00:21|523.78|541.83|518.71|519.25|231.04|126.62|69.13|
