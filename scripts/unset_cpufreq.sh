#! /bin/sh

echo 1 | tee /sys/devices/system/cpu/cpufreq/boost
cpupower frequency-set -g performance
