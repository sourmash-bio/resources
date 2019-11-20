from snakemake.remote.S3 import RemoteProvider as S3RemoteProvider

S3 = S3RemoteProvider(keep_local=True)

COMMANDS_KSIZE = ["gather", "search", "lca_gather", "lca_search"]
COMMANDS = COMMANDS_KSIZE + ["compute"]

VERSIONS = ["2.0.0", "2.0.1", "2.1.0", "2.2.0", "master"]


rule all:
  input: expand("plots/{command}.png", command=COMMANDS)

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
  output: "inputs/dbs/{filename}.sbt.json"
  input: "inputs/dbs/{filename}.tar.gz"
  shell: "tar xf {input} -C inputs/dbs"

rule download_metagenome:
  output: "inputs/HMP/HSMA33OT.fastq.gz"
  shell: "wget -O {output[0]} https://ibdmdb.org/tunnel/static/HMP2/WGS/1750/HSMA33OT.fastq.gz"

rule summary:
  output: "benchmarks/{version}/summary.csv"
  input:
    expand('benchmarks/{{version}}/{command}_k51_HSMA33OT.fastq.gz.txt', command=COMMANDS_KSIZE),
    'benchmarks/{version}/compute_HSMA33OT.fastq.gz.txt',
  shell: "scripts/summary.py --csv {output} {wildcards.version}"

rule plot:
  output: expand("plots/{command}.png", command=COMMANDS)
  input: expand("benchmarks/{version}/summary.csv", version=VERSIONS)
  shell: "scripts/plot_all.py benchmarks/"

rule compute:
  output: 'outputs/{version}/{filename}.sig'
  input: 'inputs/HMP/{filename}'
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/compute_{filename}.txt'
  shell: """
		sourmash compute -k 21,31,51 \
                     --scaled 2000 \
                     --track-abundance \
                     --name-from-first \
                     -o {output} \
                     {input}
  """

rule gather:
  output: "outputs/{version}/gather/k{ksize}/{filename}.log"
  input: 
    sig="outputs/{version}/{filename}.sig",
    db="inputs/dbs/genbank-d2-k{ksize}.sbt.json",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/gather_k{ksize}_{filename}.txt'
  shell: """
   sourmash gather -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule search:
  output: "outputs/{version}/search/k{ksize}/{filename}.log"
  input: 
    sig="outputs/{version}/{filename}.sig",
    db="inputs/dbs/genbank-d2-k{ksize}.sbt.json",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/search_k{ksize}_{filename}.txt'
  shell: """
   sourmash search -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule lca_gather:
  output: "outputs/{version}/lca_gather/k{ksize}/{filename}.log"
  input:
    sig="outputs/{version}/{filename}.sig",
    db="inputs/lca/genbank-k{ksize}.lca.json.gz",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/lca_gather_k{ksize}_{filename}.txt'
  shell: """
   sourmash gather -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule lca_search:
  output: "outputs/{version}/lca_search/k{ksize}/{filename}.log"
  input:
    sig="outputs/{version}/{filename}.sig",
    db="inputs/lca/genbank-k{ksize}.lca.json.gz",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/lca_search_k{ksize}_{filename}.txt'
  shell: """
   sourmash search -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """
