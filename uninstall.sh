#!/usr/bin/env bash

source venv.sh

while read p; do
	pip list --format freeze | cut -f 1 -d "=" | grep -q "bio2bel-$p"
	if [ "$?" -eq 0 ] ; then
		pip uninstall -yq "bio2bel-$p"
	else
		echo "🅱️  bio2bel-$p not installed."
	fi
done < requirements.txt
