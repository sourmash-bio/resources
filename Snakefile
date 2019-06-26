from snakemake.remote.S3 import RemoteProvider as S3RemoteProvider

S3 = S3RemoteProvider(keep_local=True)

rule all:
  input:
    "inputs/HMP/HSMA33OT.fastq.gz",
    "outputs/HSMA33OT.fastq.gz.sig",
    "outputs/gather/k51/HSMA33OT.fastq.gz.log",
    "outputs/search/k51/HSMA33OT.fastq.gz.log",
    "outputs/lca_gather/k51/HSMA33OT.fastq.gz.log",
    "outputs/lca_search/k51/HSMA33OT.fastq.gz.log",

rule download_database:
  output: "inputs/dbs/{db}"
  input: S3.remote("sourmash-databases/2018-03-29/{db}")
  shell: "ln -sf ../../{input[0]} {output[0]}"

rule download_lca_k21_database:
  output: "inputs/lca/genbank-k21.lca.json.gz"
  shell: "curl -L -o {output[0]} https://osf.io/d7rv8/download"

rule download_lca_k31_database:
  output: "inputs/lca/genbank-k31.lca.json.gz"
  shell: "curl -L -o {output[0]} https://osf.io/4f8n3/download"

rule download_lca_k51_database:
  output: "inputs/lca/genbank-k51.lca.json.gz"
  shell: "curl -L -o {output[0]} https://osf.io/nemkw/download"

rule extract_database:
  output: "outputs/dbs/{filename}.sbt.json"
  input: "inputs/dbs/{filename}.tar.gz"
  shell: "tar xf {input} -C outputs/dbs"

rule download_metagenome:
  output: "inputs/HMP/HSMA33OT.fastq.gz"
  shell: "wget -O {output[0]} https://ibdmdb.org/tunnel/static/HMP2/WGS/1750/HSMA33OT.fastq.gz"

rule compute:
  output: 'outputs/{filename}.sig'
  input: 'inputs/HMP/{filename}'
  conda: 'envs/sourmash.yml'
  benchmark: 'benchmarks/compute_{filename}.txt'
  shell: """
		sourmash compute -k 21,31,51 \
                     --scaled 2000 \
                     --track-abundance \
                     --name-from-first \
                     -o {output} \
                     {input}
  """

rule gather:
  output: "outputs/gather/k{ksize}/{filename}.log"
  input: 
    sig="outputs/{filename}.sig",
    db="outputs/dbs/genbank-d2-k{ksize}.sbt.json",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash.yml'
  benchmark: 'benchmarks/gather_k{ksize}_{filename}.txt'
  shell: """
   sourmash gather -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule search:
  output: "outputs/search/k{ksize}/{filename}.log"
  input: 
    sig="outputs/{filename}.sig",
    db="outputs/dbs/genbank-d2-k{ksize}.sbt.json",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash.yml'
  benchmark: 'benchmarks/search_k{ksize}_{filename}.txt'
  shell: """
   sourmash search -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule lca_gather:
  output: "outputs/lca_gather/k{ksize}/{filename}.log"
  input:
    sig="outputs/{filename}.sig",
    db="inputs/lca/genbank-k{ksize}.lca.json.gz",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash.yml'
  benchmark: 'benchmarks/lca_gather_k{ksize}_{filename}.txt'
  shell: """
   sourmash gather -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule lca_search:
  output: "outputs/lca_search/k{ksize}/{filename}.log"
  input:
    sig="outputs/{filename}.sig",
    db="inputs/lca/genbank-k{ksize}.lca.json.gz",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash.yml'
  benchmark: 'benchmarks/lca_search_k{ksize}_{filename}.txt'
  shell: """
   sourmash search -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """
