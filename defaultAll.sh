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

grid=$(zenity 2>/dev/null --scale --text "Pic a grid density level.\nUsually the smallest is accurate enough. O(N^3)" --min-value=1 --max-value=3 --value=1 --step 1)
case $? in
         0)
		echo "You selected grid level = $grid.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac

atoms=$(zenity 2>/dev/null --list --text "Select Atom Types." --checklist  --column "Check" --column "Atom" TRUE "Au" TRUE "Cu" FALSE "Mo" FALSE "S" --separator=" ")

nAtoms=$(echo "$atoms" | wc -w)

echo "$nAtoms"

if [ $nAtoms -eq 2 ];then
    ./allTwo $FILE $atoms 0.5 5 3 9 $grid | tee "$FILE"_twoAt_05_5_3_9_"$grid".soapAll | zenity --progress --auto-close --pulsate

    if [ "$?" = -1 ] ; then
            zenity --error \
              --text="Update canceled."
    fi 

    zenity 2>/dev/null  --info \
    --text="${FILE}_twoAt_05_5_3_9_$grid.soapAll \n was produced!"

 elif [ $nAtoms -eq 1 ]
    then
    ./allOne $FILE 0.5 5 3 9 $grid | tee "$FILE"_oneAt_05_5_3_9_"$grid".soapAll | zenity --progress --auto-close # --pulsate

    if [ "$?" = -1 ] ; then
            zenity --error \
              --text="Update canceled."
    fi 

    zenity 2>/dev/null  --info \
    --text="${FILE}_oneAt_05_5_3_3_$grid.soapAll \n was produced!"

 else
     echo "Error... Type1"
fi

