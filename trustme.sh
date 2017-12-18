#!/bin/bash
DIR=$1
## FILE name must also contain the directory
FILE=$2
thrsh=0.005

echo $FILE
echo $thrsh

###read -e -p "Select an xyz File: " FILE

#######################################################################################
##time ./scanH $FILE 50 2.0 2.5 1.3 2.3 > "$FILE"_300_05_25_13_23.Hscan 
##time ./Eta2 $FILE Au Cu 1.9 1.8 2.5  > "$FILE".eta2H 
##time ./Eta3 $FILE Au Cu 1.9 1.8 2.5  > "$FILE".eta3H 
#######################################################################################
##time ./Hsoap $FILE Au Cu "$FILE"_300_05_25_13_23.Hscan 0.5 5.0 3 9 1 > "$FILE"_300_05_25_13_23.Hscan_twoAt_05_50_3_9_1.Hsoap
##time ./Hsoap $FILE Au Cu "$FILE".eta2H 0.5 5.0 3 9 1 > "$FILE".eta2H_twoAt_05_50_3_9_1.Hsoap
##time ./Hsoap $FILE Au Cu "$FILE".eta3H 0.5 5.0 3 9 1 > "$FILE".eta3H_twoAt_05_50_3_9_1.Hsoap
#######################################################################################
##time ./elimH "$FILE"_300_05_25_13_23.Hscan_twoAt_05_50_3_9_1.Hsoap "$thrsh"  > "$FILE"_300_05_25_13_23.Hscan_twoAt_05_50_3_9_1.Hsoap_"$thrsh".ScanHuniq
##time  ./elimH "$FILE".eta2H_twoAt_05_50_3_9_1.Hsoap $thrsh  > "$FILE".eta2H_twoAt_05_50_3_9_1.Hsoap_${thrsh}.Eta2Huniq
##time  ./elimH "$FILE".eta3H_twoAt_05_50_3_9_1.Hsoap $thrsh  > "$FILE".eta3H_twoAt_05_50_3_9_1.Hsoap_${thrsh}.Eta3Huniq
#######################################################################################
Bash/getXYZ.sh "$FILE"_300_05_25_13_23.Hscan_twoAt_05_50_3_9_1.Hsoap_"$thrsh".ScanHuniq "$FILE"_300_05_25_13_23.Hscan > "$FILE"_scan_Uniq.xyz
Bash/getXYZ.sh "$FILE".eta2H_twoAt_05_50_3_9_1.Hsoap_${thrsh}.Eta2Huniq "$FILE".eta2H > "$FILE"_eta2_Uniq.xyz
Bash/getXYZ.sh "$FILE".eta3H_twoAt_05_50_3_9_1.Hsoap_${thrsh}.Eta3Huniq "$FILE".eta3H > "$FILE"_eta3_Uniq.xyz

Bash/addH.sh "$FILE"_scan_Uniq.xyz
Bash/addH.sh "$FILE"_eta2_Uniq.xyz
Bash/addH.sh "$FILE"_eta3_Uniq.xyz

cp "$FILE" "$FILE"checkMeScan.xyz
cp "$FILE" "$FILE"checkMeEta2.xyz
cp "$FILE" "$FILE"checkMeEta3.xyz

cat "$FILE"_scan_Uniq.xyz >> "$FILE"checkMeScan.xyz
cat "$FILE"_eta2_Uniq.xyz >> "$FILE"checkMeEta2.xyz
cat "$FILE"_eta3_Uniq.xyz >> "$FILE"checkMeEta3.xyz

scanSize=$(wc -l < ${FILE}checkMeScan.xyz)
eta2Size=$(wc -l < ${FILE}checkMeEta2.xyz)
eta3Size=$(wc -l < ${FILE}checkMeEta3.xyz)

scanSize=$(($scanSize - 2))
eta2Size=$(($eta2Size - 2))
eta3Size=$(($eta3Size - 2))

sed -i "s/^\s*[0-9][0-9]*\s*$/$scanSize/g" "$FILE"checkMeScan.xyz
sed -i "s/^\s*[0-9][0-9]*\s*$/$eta2Size/g" "$FILE"checkMeEta2.xyz
sed -i "s/^\s*[0-9][0-9]*\s*$/$eta3Size/g" "$FILE"checkMeEta3.xyz
#######################################################################################

cp Bash/setupUniqDir.sh $DIR
cp Bash/getAllDir.sh $DIR

