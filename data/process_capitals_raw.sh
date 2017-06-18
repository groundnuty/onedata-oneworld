#!/usr/bin/env bash

cat capitals_raw.txt | grep -v "^#" | while  IFS=$'\t' read country capital la lo CC CN ; do if [[ $capital =~ ^[[:alpha:]]*$ ]] ; then  if [[ ! $lo =~ \.  ]] ; then lo="$lo.0" ; fi ; if [[ ! $la =~ \.  ]] ; then la="$la.0" ; fi ; printf "%s\t%s\t%s\n" $capital $lo $la   ; fi ; done |  awk '!seen[$0]++' | awk '{ print length($1), $0 }' | sort -n | cut -d " " -f2-  > providers.txt
