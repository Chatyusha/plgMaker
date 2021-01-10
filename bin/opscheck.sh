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
			echo -1
			exit 1
      ;;
  esac
done
ret=0
for i in $OPS_STATE;
do
	ret=$(($ret + $i))
done
echo $ret
