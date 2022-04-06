#! /usr/bin/env python

import os

import pandas as pd
import matplotlib.pyplot as plt


def plot(bench_dir, plot_dir, versions=None):
    all_summaries = []
    for root, dirs, files in os.walk(bench_dir):
        if files:
            version = root.split("/")[-1]
            if versions and version not in versions:
                continue
            try:
                summary = [f for f in files if f.endswith("csv")][0]
            except IndexError:
                raise SystemError(f"Missing summary file in {root}")

            summary_pd = pd.read_csv(os.path.join(root, summary),
                                     usecols=["command", "s", "max_rss"])
            summary_pd['version'] = version

            all_summaries.append(summary_pd)

    all_summaries = pd.concat(all_summaries)

    os.makedirs(plot_dir, exist_ok=True)

    ylabels = {
        's': "seconds",
        'max_rss': "MB",
    }
    titles = {
        's': 'Running time',
        'max_rss': 'Maximum memory consumption'
    }

    commands = all_summaries.groupby("command")
    for title, group in commands:
        with plt.style.context("seaborn"):
            axes = group.sort_values(by="version").plot(
                x="version",
                subplots=True,
                figsize=(6, 9),
                layout=(2, 1),
                title=title,
                sort_columns=True,
                sharex=False,
                legend=False,
            )
            for row in axes:
                for ax in row:
                    label = ax.axes.get_legend_handles_labels()[1][0]
                    ax.set_ylim(bottom=0)
                    ax.set_ylabel(ylabels[label])
                    ax.set_xticklabels(ax.get_xticklabels(), rotation=30, ha='right')
#                    ax.axvline(x=4, color='k', linestyle="--")
#                    ax.annotate(
#                        "Rust core",
#                        xy=(4, 0),
#                        xytext=(4.1, 0),
#                    )
                    ax.set_title(titles[label])
            plt.tight_layout(pad=3.0, h_pad=1.0)
            plt.savefig(os.path.join(plot_dir, title + ".svg"))

    return all_summaries


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("bench_dir")
    parser.add_argument("-o", "--output", default="plots")
    parser.add_argument("--versions", default=None)
    args = parser.parse_args()

    if args.versions is not None:
        versions = args.versions.strip('"').split(",")
    plot(args.bench_dir, args.output, args.versions)
