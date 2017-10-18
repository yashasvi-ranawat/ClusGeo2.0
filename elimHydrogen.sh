#!/bin/sh

read -p "Select a .Hsoap File. Make sure that the file is in the right format (Hsoap format.)" FILE

read -p "Pic Soap threashold. [0.0 - Infinity ] " thresh


    ./elimH $FILE ${thresh}  > "$FILE"_${thresh}_"$grid".Huniq


read -p "Select the .Hscan file corresponding to the .Huniq file." FILE2

    echo "${FILE}_${thresh}_$grid.Huniq  was produced. which  atoms are Unique."



