#! /bin/sh

echo 1 | sudo tee /sys/devices/system/cpu/cpufreq/boost
sudo cpupower frequency-set -g performance
