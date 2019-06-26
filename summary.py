def process_file(filename):
    with open(filename, "r") as f:
        header = None
        for line in f:
            if header is None:
                header = line.strip().split()
                continue
            values = line.strip().split()
    return dict(zip(header, values))

compute = process_file("benchmarks/compute_HSMA33OT.fastq.gz.txt")
search = process_file("benchmarks/search_k51_HSMA33OT.fastq.gz.txt")
gather = process_file("benchmarks/gather_k51_HSMA33OT.fastq.gz.txt")

headers = ["command"] + list(compute.keys())

for key in headers:
    print(f"| {key} ", end="")
print(" |")
for key in headers:
    print("| :", "--", " ", sep="", end="")
print("|")

print("|compute", *compute.values(), sep="|", end="|\n")
print("|search", *search.values(), sep="|", end="|\n")
print("|gather", *gather.values(), sep="|", end="|\n")
