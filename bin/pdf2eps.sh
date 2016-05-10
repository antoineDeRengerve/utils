#!/bin/bash

for name in `find -path '*.pdf'`
do
#  echo $name
  if [ ! -f ${name/.pdf/.eps} ]
      then
      echo "$name  va etre converti en eps"
      pdf2ps $name ${name/.pdf/.ps}
      ps2eps ${name/.pdf/.ps}
      rm ${name/.pdf/.ps}
  fi

done

