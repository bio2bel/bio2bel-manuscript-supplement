#!/usr/bin/env bash

lsvirtualenv -b | grep -q bel

if [ "$?" -eq 0 ]; then
	workon bel
else
	echo "🅱️  mkvirtualenv bel"
	mkvirtualenv bel
fi
