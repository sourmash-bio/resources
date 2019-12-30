#! /usr/bin/env python

import csv


def process_file(filename):
    with open(filename, "r") as f:
        header = None
        for line in f:
            if header is None:
                header = line.strip().split()
                continue
            values = line.strip().split()
    return dict(zip(header, values))


def data_for_version(version):
    compute = process_file(f"benchmarks/{version}/compute_HSMA33OT.fastq.gz.tsv")
    search = process_file(f"benchmarks/{version}/search_k51_HSMA33OT.fastq.gz.tsv")
    gather = process_file(f"benchmarks/{version}/gather_k51_HSMA33OT.fastq.gz.tsv")
    lca_search = process_file(f"benchmarks/{version}/lca_search_k51_HSMA33OT.fastq.gz.tsv")
    lca_gather = process_file(f"benchmarks/{version}/lca_gather_k51_HSMA33OT.fastq.gz.tsv")
    compare = process_file(f"benchmarks/{version}/compare_k51_HSMA33OT.fastq.gz.tsv")

    return compute, search, gather, lca_search, lca_gather, compare


def csv_for_version(version, csvfile):
    compute, search, gather, lca_search, lca_gather, compare = data_for_version(version)

    headers = ["command"] + list(compute.keys())
    compute.update({"command": "compute"})
    search.update({"command": "search"})
    gather.update({"command": "gather"})
    lca_search.update({"command": "lca_search"})
    lca_gather.update({"command": "lca_gather"})
    compare.update({"command": "compare"})

    writer = csv.DictWriter(csvfile, headers)
    writer.writeheader()
    writer.writerow(compute)
    writer.writerow(search)
    writer.writerow(gather)
    writer.writerow(lca_search)
    writer.writerow(lca_gather)
    writer.writerow(compare)


def md_for_version(version):
    compute, search, gather, lca_search, lca_gather, compare = data_for_version(version)

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
    print("|compare", *compare.values(), sep="|", end="|\n")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("--csv", type=argparse.FileType('w'))
    parser.add_argument("version", nargs="?", default="master")
    args = parser.parse_args()

    if args.csv:
        csv_for_version(args.version, args.csv)
    else:
        md_for_version(args.version)
