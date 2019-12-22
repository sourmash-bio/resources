all:
	snakemake --use-conda

full_clean:
	-rm -rf benchmarks plots .snakemake/conda outputs

clean:
	-rm -rf plots .snakemake/conda
	find benchmarks -iname "*summary.csv" -delete

.PHONY: clean full_clean
