#! /usr/bin/env python


def process_file(filename):
    with open(filename, "r") as f:
        header = None
        for line in f:
            if header is None:
                header = line.strip().split()
                continue
            values = line.strip().split()
    return dict(zip(header, values))


def for_version(version="2.2.0"):
    compute = process_file(f"benchmarks/{version}/compute_HSMA33OT.fastq.gz.txt")
    search = process_file(f"benchmarks/{version}/search_k51_HSMA33OT.fastq.gz.txt")
    gather = process_file(f"benchmarks/{version}/gather_k51_HSMA33OT.fastq.gz.txt")
    lca_search = process_file(f"benchmarks/{version}/lca_search_k51_HSMA33OT.fastq.gz.txt")
    lca_gather = process_file(f"benchmarks/{version}/lca_gather_k51_HSMA33OT.fastq.gz.txt")

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
    print("|lca_search", *lca_search.values(), sep="|", end="|\n")
    print("|lca_gather", *lca_gather.values(), sep="|", end="|\n")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("version", nargs="?", default="2.2.0")
    args = parser.parse_args()

    for_version(args.version)
