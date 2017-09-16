#!/bin/sh

FILE=`zenity 2>/dev/null --file-selection --title="Select a .xyz File."`
case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected."; exit;;
        -1)
                echo "An unexpected error has occurred.";exit;;
esac

grid=$(zenity 2>/dev/null --scale --text "Pic a grid density.\nUsually the smallest is accurate enough. O(N^3)" --min-value=1 --max-value=3 --value=1 --step 1)
case $? in
         0)
		echo "You selected grid density = $grid.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac

atoms=$(zenity 2>/dev/null --height=400 --list --text "Select Atom Types." --checklist  --column "Check" --column "Atom" TRUE "Au" TRUE "Cu" FALSE "Mo" FALSE "S" FALSE "Ni" FALSE "P" FALSE "Pt" FALSE "Co" FALSE "Cr" FALSE "Mn" FALSE "Ti" FALSE "O" FALSE "Fe"  --separator=" ")

nAtoms=$(echo "$atoms" | wc -w)

echo "$nAtoms"

if [ $nAtoms -eq 2 ];then
    ./surfaceTwo $FILE $atoms 0.5 5 3 9 $grid 2.8  > "$FILE"_twoAt_05_5_3_9_"$grid"_28.surfsoap


    zenity 2>/dev/null  --info \
    --text="${FILE}_twoAt_05_5_3_9_$grid.surfsoap \nwas produced!"

 elif [ $nAtoms -eq 1 ]
    then
    ./surfaceOne $FILE 0.5 5 3 9 $grid 2.8  > "$FILE"_oneAt_05_5_3_9_"$grid"_28.surfsoap

    zenity 2>/dev/null  --info \
    --text="${FILE}_oneAt_05_5_3_9_$grid_28.surfsoap"

 else
     echo "Error... Type1"
fi


