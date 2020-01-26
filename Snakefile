COMMANDS_KSIZE = ["gather", "search", "lca_gather", "lca_search", "compare"]
COMMANDS = COMMANDS_KSIZE + ["compute"] + ["index"]

VERSIONS = ["2.0.1", "2.1.0", "2.2.0", "2.3.1", "3.0.1", "3.1.0", "master"]

rule all:
  input: expand("plots/{command}.svg", command=COMMANDS)

SBT_URLS = {
  'genbank': {
    '21': 'https://osf.io/nqs7k/download',
    '31': 'https://osf.io/h7k8a/download',
    '51': 'https://osf.io/jznwe/download'
  }
}

# lca genbank:
# k21: https://osf.io/d7rv8/download
# k31: https://osf.io/4f8n3/download
# k51: https://osf.io/nemkw/download

rule download_sbt_databases:
  output: "inputs/dbs/{db}-d2-k{ksize}.tar.gz"
  params:
    url = lambda w: SBT_URLS[w.db][w.ksize]
  shell: """
      curl -L -o {output[0]} {params.url}
  """

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
    expand('benchmarks/{{version}}/{command}_k51_HSMA33OT.fastq.gz.tsv', command=COMMANDS_KSIZE),
    'benchmarks/{version}/compute_HSMA33OT.fastq.gz.tsv',
    'benchmarks/{version}/index_k51.tsv'
  shell: "scripts/summary.py --csv {output} {wildcards.version}"

rule plot:
  output: expand("plots/{command}.svg", command=COMMANDS)
  input: expand("benchmarks/{version}/summary.csv", version=VERSIONS)
  shell: "scripts/plot_all.py benchmarks/"

rule compute:
  output: 'outputs/{version}/{filename}.sig'
  input: 'inputs/HMP/{filename}'
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/compute_{filename}.tsv'
  shell: """
		sourmash compute -k 21,31,51 \
                     --scaled 2000 \
                     --track-abundance \
                     --name-from-first \
                     -o {output} \
                     {input}
  """

rule gather:
  output: "outputs/{version}/gather/k{ksize}/{filename}.csv"
  input: 
    sig="outputs/{version}/{filename}.sig",
    db="inputs/dbs/genbank-d2-k{ksize}.sbt.json",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/gather_k{ksize}_{filename}.tsv'
  shell: """
   sourmash gather -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule index:
  output: "outputs/{version}/index/k{ksize}.sbt.json"
  input:
    db="inputs/dbs/genbank-d2-k{ksize}.sbt.json",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/index_k{ksize}.tsv'
  shell: """
   sourmash index -k {params.ksize} \
                  {output} \
                  inputs/dbs/.sbt.genbank-d2-k{params.ksize}/1*
  """

rule compare:
  output: "outputs/{version}/compare/k{ksize}/{filename}.csv"
  input:
    sig="outputs/{version}/{filename}.sig",
    db="inputs/dbs/genbank-d2-k{ksize}.sbt.json",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/compare_k{ksize}_{filename}.tsv'
  shell: """
   sourmash compare -o {output} \
                    -k {params.ksize} \
                    inputs/dbs/.sbt.genbank-d2-k{params.ksize}/12*
  """

rule search:
  output: "outputs/{version}/search/k{ksize}/{filename}.csv"
  input: 
    sig="outputs/{version}/{filename}.sig",
    db="inputs/dbs/genbank-d2-k{ksize}.sbt.json",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/search_k{ksize}_{filename}.tsv'
  shell: """
   sourmash search -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule lca_gather:
  output: "outputs/{version}/lca_gather/k{ksize}/{filename}.csv"
  input:
    sig="outputs/{version}/{filename}.sig",
    db="inputs/lca/genbank-k{ksize}.lca.json.gz",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/lca_gather_k{ksize}_{filename}.tsv'
  shell: """
   sourmash gather -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule lca_search:
  output: "outputs/{version}/lca_search/k{ksize}/{filename}.csv"
  input:
    sig="outputs/{version}/{filename}.sig",
    db="inputs/lca/genbank-k{ksize}.lca.json.gz",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/lca_search_k{ksize}_{filename}.tsv'
  shell: """
   sourmash search -o {output} \
                   --scaled 2000 \
                   -k {params.ksize} \
                   {input.sig} \
                   {input.db}
  """

rule lca_classify:
  output: "outputs/{version}/lca_classify/k{ksize}/{filename}.csv"
  input:
    sig="outputs/{version}/{filename}.sig",
    db="inputs/lca/genbank-k{ksize}.lca.json.gz",
  params:
    ksize = "{ksize}"
  conda: 'envs/sourmash_{version}.yml'
  benchmark: 'benchmarks/{version}/lca_classify_k{ksize}_{filename}.tsv'
  shell: """
   sourmash classify -o {output} \
                     --scaled 2000 \
                     -k {params.ksize} \
                     {input.sig} \
                     {input.db}
  """
