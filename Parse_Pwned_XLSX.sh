#!/bin/bash

oF=$(basename $1 .xlsx)_"$2".csv
uF=$(basename $1 .xlsx)_"$2"_Users.csv

xlsx2csv $1 | grep "$2" | cut -f1 -d, > "$uF"
xlsx2csv $1 | grep "$2" > "$oF"

wc -l "$oF"

echo -e "Please find attached the Parsed HIBP File for '$2'.\n" > body.txt
cat "$uF" >> body.txt
echo -e "\nPlease do not reply to this email. It is automatically generated.\n" >> body.txt
cat ~/.signature >> body.txt

cat body.txt | mutt -a "$oF" -s "$oF" -- username@email.address	

rm "body.txt" "$oF" "$uF"
