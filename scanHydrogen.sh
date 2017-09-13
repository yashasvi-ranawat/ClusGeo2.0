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

gridLevel=$(zenity 2>/dev/null --scale --text "Pic a grid size.\n O(N^3)" --min-value=50 --max-value=250 --value=150 --step 10)
case $? in
         0)
		echo "You selected grid level = $gridLevel.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac

minDist=$(zenity 2>/dev/null --scale --text "Pic the closest hydrogen distance to surface.(1.x Ang)" --min-value=1 --max-value=9 --value=3 --step 1)
case $? in
         0)
		echo "You selected minimum distance = 1.$minDist.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac
maxDist=$(zenity 2>/dev/null --scale --text "Pic the furthest hydrogen distance to surface.(2.x Ang)" --min-value=1 --max-value=9 --value=3 --step 1)
case $? in
         0)
		echo "You selected maximum distance = 2.$maxDist.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac
spa=$(zenity 2>/dev/null --scale --text "Pic hydrogen sparseness.(0.x Ang)" --min-value=1 --max-value=9 --value=3 --step 1)
case $? in
         0)
		echo "You selected sparseness = 0.$spa.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac
b=$(zenity 2>/dev/null --scale --text "Pic bubble radius.\nIf bubble is too big, it will ignore valleys. If bubble is too small, it will create surface inside." --min-value=1 --max-value=9 --value=7 --step 1)
case $? in
         0)
		echo "You selected bubble radius = $b.";;
         1)
                echo "No value selected."; exit ;;
        -1)
                echo "An unexpected error has occurred."; exit;;
esac



./scanH $FILE $gridLevel 0.${spa} 2.${b} 1.${minDist} 2.${maxDist} | tee "$FILE"_${gridLevel}_0${spa}_2${b}_1${minDist}_2${maxDist}.Hscan | zenity --progress --pulsate

    zenity 2>/dev/null  --info \
    --text="${FILE}_${gridLevel}_0${spa}_2${b}_1${minDist}_2${maxDist}.Hscan was produced!"





