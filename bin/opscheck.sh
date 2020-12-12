#!/bin/bash

OPS_STATE=(0 0 0)
for opt in "$@"
do
  case $opt in
    "--name="* | "-n="* )
			OPS_STATE[0]=1
      ;;
    "--dir="* | "-d="* )
			OPS_STATE[1]=2
      ;;
    "--script-name="* | "-s="* )
			OPS_STATE[2]=4
      ;;
    *)
      ;;
  esac
	done
	echo $((${OPS_STATE[0]} + ${OPS_STATE[1]} + ${OPS_STATE[2]}))

