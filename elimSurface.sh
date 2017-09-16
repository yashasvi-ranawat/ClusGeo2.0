#!/bin/sh

FILE=`zenity 2>/dev/null --file-selection --title="Select a .surfsoap File. Make sure that the file is in the right format (surfsoap format.)"`
case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected."; exit;;
        -1)
                echo "An unexpected error has occurred.";exit;;
esac

thresh=$(zenity 2>/dev/null --scale --text "Pic Soap threashold. (0.00x)" --min-value=1 --max-value=9 --value=1 --step 1)
case $? in
         0)
		echo "You selected grid level = $thresh.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac



    ./elimSurf $FILE 0.000${thresh} > "$FILE"_000${thresh}_"$grid".surfUniq


FILE2=`zenity 2>/dev/null --file-selection --title="Select the .xyz file corresponding to the .surfsoap file."`
case $? in
         0)
                echo "\"$FILE2\" selected.";;
         1)
                echo "No file selected."; exit;;
        -1)
                echo "An unexpected error has occurred.";exit;;
esac
cp $FILE2 "$FILE2.check"

    while read p ; do sed -i "$(($p+2))s/^\s*[A-Za-z]./Lr/" $FILE2.check ; done <"$FILE"_000${thresh}_"$grid".surfUniq

cp $FILE2.check check.xyz

    zenity 2>/dev/null  --info \
    --text="${FILE}_000${thresh}_$grid.surfUniq\nand \n $FILE2.check \n was produced. Please check check.xyz file to see which surface atoms are Unique."
    echo "${FILE}_000${thresh}_$grid.surfUniq\nand \n $FILE2.check \n was produced. Please check check.xyz file to see which surface atoms are Unique."
