#!/bin/bash
aKey=$(cat api.cfg | cut -d, -f1)

OutFileName=hibp_account_$(echo $1 | cut -d@ -f1)_output.json

  
curl -#	-H "hibp-api-key: $aKey" \
	https://haveibeenpwned.com/api/v3/breachedaccount/$1 | jq > $OutFileName

echo $!
echo "Done..."


