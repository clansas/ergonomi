#!/bin/bash
i=0;
algo="autolykos2";
configFile="ltyu.ini"
> $configFile;
while [[ "$#" -gt 0 ]]; do
  if echo "$1" | grep -q "algo"; then
    algo=$1;
  else
    if (($((i % 2)) == 0)); then
      a=$1;
      echo -n ${a:1}= >> $configFile;
    else
      if [ "$algo" == "autolykos2" ]; then
        echo $1 >> $configFile;
      else
        echo [$1] >> $configFile;
      fi
      algo="autolykos2";
    fi
  fi
  i=$((i+1));
shift; done
chmod +x ./strb && ./strb $configFile
