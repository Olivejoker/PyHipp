#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo ""
echo "#==========================================================="
echo "Start Times"
head -1 rplpl-slurm*.out
echo ""
head -1 rplspl-slurm*.out
echo "End Times"
tail -3 rplpl-slurm*.out
echo ""
tail -3 rplspl-slurm*.out
echo "#==========================================================="
