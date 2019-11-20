#! /usr/bin/env python

import os

import pandas as pd
import matplotlib.pyplot as plt


def plot(bench_dir, plot_dir):
    all_summaries = []
    for root, dirs, files in os.walk(bench_dir):
        if files:
            try:
                summary = [f for f in files if f.endswith("csv")][0]
            except IndexError:
                raise SystemError(f"Missing summary file in {root}")

            version = root.split("/")[-1]
            summary_pd = pd.read_csv(os.path.join(root, summary),
                                     usecols=["command", "s", "max_rss", "io_in", "io_out"])
            summary_pd['version'] = version

            all_summaries.append(summary_pd)

    all_summaries = pd.concat(all_summaries)

    os.makedirs(plot_dir, exist_ok=True)

    commands = all_summaries.groupby("command")
    for title, group in commands:
        group.sort_values(by="version").plot(
            x="version", 
            subplots=True,
            figsize=(12, 16),
            layout=(4, 2),
            sort_columns=True,
            title=title,
            sharex=False,
        )
        plt.savefig(os.path.join(plot_dir, title + ".png"))

    return all_summaries


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("bench_dir")
    parser.add_argument("-o", "--output", default="plots")
    args = parser.parse_args()

    plot(args.bench_dir, args.output)
