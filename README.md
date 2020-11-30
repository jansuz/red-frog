# red-frog
Scripts for HIBP API and for managing HIBP release files.

**The down and dirty starting guide...**
* Place your API key into api.cfg
* Run "Get_User_Info.sh username[@]emailddress.com" to create "hibp_account_username_output.json"
* For each entry in "hibp_account_username_output.json", run "Get_Breaches_Info.sh".

Output data files in this case...
* hibp_account_username_output.json
* hibp_breach_OnlinerSpambot_output.json
* hibp_breach_PDL_output.json


