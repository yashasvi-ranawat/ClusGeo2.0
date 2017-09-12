#!/bin/sh

FILE=`zenity 2>/dev/null --file-selection --title="Select an xyz File with the Target Hydrogen at the end."`
case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected."; exit;;
        -1)
                echo "An unexpected error has occurred.";exit;;
esac

#gridLevel=$(zenity 2>/dev/null --scale --text "Pic a grid density level.\nUsually the smallest is accurate enough. O(N^3)" --min-value=1 --max-value=3 --value=1 --step 1)
#case $? in
#         0)
#		echo "You selected grid level = $grid.";;
#         1)
#                echo "No value selected."; exit ;;
#        -1)
#                echo "An unexpected error has occurred."; exit;;
#esac
#
#minDist=$(zenity 2>/dev/null --scale --text "Pic a grid density level.\nUsually the smallest is accurate enough. O(N^3)" --min-value=1 --max-value=3 --value=1 --step 1)
#case $? in
#         0)
#		echo "You selected grid level = $grid.";;
#         1)
#                echo "No value selected."; exit ;;
#        -1)
#                echo "An unexpected error has occurred."; exit;;
#esac
#
#atoms=$(zenity 2>/dev/null --list --text "Select Atom Types." --checklist  --column "Check" --column "Atom" TRUE "Au" TRUE "Cu" FALSE "Mo" FALSE "S" --separator=" ")
#
#nAtoms=$(echo "$atoms" | wc -w)
#
#echo "$nAtoms"
#
#grid=$((gridLevel*100));

./scanH $FILE 150 0.3 2.7 1.2 2.2 > "$FILE"_200_03_27_12_22.Hscan

    zenity 2>/dev/null  --info \
    --text="${FILE}_150_03_27_12_22.Hscan was produced!"





