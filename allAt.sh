#!/bin/sh

FILE=`zenity 2>/dev/null --file-selection --title="Select an xyz File."`
case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected."; exit;;
        -1)
                echo "An unexpected error has occurred.";exit;;
esac
r0=$(zenity 2>/dev/null  --scale --text "Pic a bohr radius. This defines the shape of the basis functions.(0.x)" \
--min-value=1 --max-value=9 --value=5 --step 1)
case $? in
         0)
		echo "You selected r0 = $r0.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac

rcut=$(zenity 2>/dev/null  --scale --text "Pic a Soap cuttof in Angs.\n MAX is 10.\n For large cutoff, make sure to use a dense grid. " --min-value=1 --max-value=10 --value=5 --step 1)
case $? in
         0)
		echo "You selected rcut = $rcut.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac

l=$(zenity 2>/dev/null --scale --text "Pic the number for spherical harmonic basis functions.\n Between 1 and 9. \n O(N^2) " --min-value=1 --max-value=9 --value=9 --step 1)
case $? in
         0)
		echo "You selected l = $l.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac

n=$(zenity 2>/dev/null --scale --text "Pic the number for radial basis functions.\n Between 1 and 3. Default is 3 \n O(N) " --min-value=1 --max-value=3 --value=3 --step 1)
case $? in
         0)
		echo "You selected n = $n.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac

grid=$(zenity 2>/dev/null --scale --text "Pic the grid density.\n Usually the smallest is accurate enough. O(N^3)" --min-value=1 --max-value=3 --value=1 --step 1)
case $? in
         0)
		echo "You selected grid density= $grid.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac

atoms=$(zenity 2>/dev/null --list --text "Select Atom Types." --checklist  --column "Check" --column "Atom" TRUE "Au"
TRUE "Cu" FALSE "Mo" FALSE "S" FALSE "Ni" FALSE "P" --separator=" ")

nAtoms=$(echo "$atoms" | wc -w)

echo "$nAtoms"

if [ $nAtoms -eq 2 ];then
    ./allTwo $FILE $atoms 0.$r0 $rcut $n $l $grid | tee "$FILE"_twoAt_05_${rcut}_${n}_${l}_"$grid".soapAll | zenity --progress --auto-close --pulsate

    if [ "$?" = -1 ] ; then
            zenity --error \
              --text="Update canceled."
    fi 

    zenity 2>/dev/null  --info \
    --text="${FILE}_twoAt_0${r0}_${rcut}_${n}_${l}_$grid.soapAll \n was produced!"

 elif [ $nAtoms -eq 1 ]
    then
    ./allOne $FILE 0.$r0 $rcut $n $l $grid | tee "$FILE"_oneAt_0${r0}_${rcut}_${n}_${l}_"$grid".soapAll | zenity --progress --auto-close # --pulsate

    if [ "$?" = -1 ] ; then
            zenity --error \
              --text="Update canceled."
    fi 

    zenity 2>/dev/null  --info \
    --text="${FILE}_oneAt_0${r0}_${rcut}_${n}_${l}_$grid.soapAll \n was produced!"

 else
     echo "Error... Type1"
fi

