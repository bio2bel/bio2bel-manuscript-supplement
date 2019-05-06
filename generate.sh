#!/usr/bin/env bash

source venv.sh

mkdir results

# Generate entity-relation diagrams
mkdir results/entity-relation-diagrams
bio2bel er -d entity-relation-diagrams

# Generate summary sheet
bio2bel sheet > results/summary.txt
