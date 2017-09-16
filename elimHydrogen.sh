#!/bin/sh

FILE=`zenity 2>/dev/null --file-selection --title="Select a .Hsoap File. Make sure that the file is in the right format (Hsoap format.)"`
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
		echo "You selected grid level = $grid.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac



    ./elimH $FILE 0.00${thresh}  > "$FILE"_00${thresh}_"$grid".Huniq


FILE2=`zenity 2>/dev/null --file-selection --title="Select the .Hscan file corresponding to the .Huniq file."`
case $? in
         0)
                echo "\"$FILE2\" selected.";;
         1)
                echo "No file selected."; exit;;
        -1)
                echo "An unexpected error has occurred.";exit;;
esac

#    while read p ; do sed -i "$(($p+2))s/^\s*[A-Za-z]./Lr/" $FILE2.check ; done <"$FILE"_00${thresh}_"$grid".Huniq

    zenity 2>/dev/null  --info \
    --text="${FILE}_00${thresh}_$grid.Huniq \n was produced. 
    which  atoms are Unique."



