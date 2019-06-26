
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
|compute|160.4848|0:02:40|29.30|133.58|17.57|19.36|6.88|0.20|0.00|
|search|99.7232|0:01:39|2992.26|3096.36|2980.70|2982.47|902.57|2793.93|0.00|
|gather|369.0650|0:06:09|2004.85|3404.83|1988.61|1991.92|1160.86|1796.48|0.00|
|lca_search|74.2517|0:01:14|3867.69|3972.08|3856.71|3858.46|0.00|0.00|0.00|
|lca_gather|392.8099|0:06:32|5590.58|7103.81|5574.45|5577.73|0.09|0.00|0.00|
