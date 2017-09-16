#!/bin/sh

FILE=`zenity 2>/dev/null --file-selection --title="Select a list of atoms such as a .surfUniq file."`
case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected."; exit;;
        -1)
                echo "An unexpected error has occurred.";exit;;
esac

dist=$(zenity 2>/dev/null --scale --text "Select distance from surf atom. (1.x)" --min-value=1 --max-value=9 --value=1 --step 1)
case $? in
         0)
		echo "You selected dist = $dist.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac
FILE2=`zenity 2>/dev/null --file-selection --title="Select the .xyz file corresponding to the .surfUniq file."`
case $? in
         0)
                echo "\"$FILE2\" selected.";;
         1)
                echo "No file selected."; exit;;
        -1)
                echo "An unexpected error has occurred.";exit;;
esac

    ./putH $FILE $FILE2 1.$dist > ${FILE}_1$dist.Hput 


    zenity 2>/dev/null  --info \
    --text="${FILE}_1$dist.Hput was produced!\n Check it by catting it onto the .xyz file."
    echo "${FILE}_1$dist.Hput was produced!\n Check it by catting it onto the .xyz file."
