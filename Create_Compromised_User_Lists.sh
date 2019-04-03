#!/bin/bash


# This script expects the HIBP file in an XLSX format as argument 1.

echo "Building Compromises.txt..."
# Build Compromises.txt
for a in {2..20}; 
	do 
	xlsx2csv $1 | \
		cut -d, -f$a | \
		sed 's/"//g' | \
		sed 's/^ //g' | \
		sed 's/^ .$//g' | \
		sort -u >> c.tmp
	done

sed '/^$/d' c.tmp | sort -u > Compromises.txt

echo "Building Compromised Users Lists..."
# Build Compromised Users Lists
while IFS= read -e -r line;
	do
	oFtmp=$(basename $1 .xlsx)_"$line".csv
	oF=$(echo $oFtmp | sed 's/ //g' | sed 's/\//-/g' )
	xlsx2csv $1 | grep "$line" > "$oF"
	echo -n $(wc -l "$oF"), 
	done < Compromises.txt

echo "Creating Archive..."
aF=$(basename $1 .xlsx).tar.bz2
tF=$(basename $1 .xlsx)_"$line"*.csv
tar cfyv $aF $tF $1

echo "Tidying up..."
rm c.tmp Compromises.txt $tF

echo -e "\nDone."
