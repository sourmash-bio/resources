all:
	snakemake --conda-frontend mamba --use-conda -j1

full_clean:
	-rm -rf benchmarks plots .snakemake/conda outputs

clean:
	-rm -rf plots .snakemake/conda
	find benchmarks -iname "*summary.csv" -delete

.PHONY: clean full_clean
