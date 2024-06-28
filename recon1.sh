#!/bin/bash

# Check if URL argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <url>"
  exit 1
fi

url=$1
reconscript_dir="/home/kali/reconscript"

echo " Cleaning the url ...... "
# Remove "https://" and "http://" from the URL
url=$(echo "$url" | sed -e 's|https://||' -e 's|http://||')

# Remove "www." from the beginning of the URL if present
url=$(echo "$url" | sed -e 's|^www\.||')

# Extract domain name for directory name
dir_name=$(echo "$url" | sed -e 's|/.*||')


mkdir -p "$reconscript_dir/$dir_name"
echo "[/\/\/\] GETTING all the subdomains ..... "
echo "[*] Running assetfinder ....... "
assetfinder --subs-only "$url" > "$reconscript_dir/$dir_name/subs.txt" &
echo "[*] Running subfinder ....."
subfinder -d "$url" >> "$reconscript_dir/$dir_name/subs.txt" & 


wait
echo " ********************************************************** "
sort -u -o "$reconscript_dir/$dir_name/subs.txt" "$reconscript_dir/$dir_name/subs.txt" 
echo "Subdomains found and saved in $reconscript_dir/$dir_name/subs.txt"


if [ ! -s "$reconscript_dir/$dir_name/subs.txt" ]; then
  echo "No subdomains found. Exiting."
  exit 1
fi
echo " ********************************************************** "
echo "[*] Running httpx .... "
httpx -silent -l "$reconscript_dir/$dir_name/subs.txt" -sc > "$reconscript_dir/$dir_name/httpx_output.txt" &

echo " ********************************************************** "
echo "[*] Running katana and waybackurls for endpoints..... " 
httpx -silent -l "$reconscript_dir/$dir_name/subs.txt" -fc 400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,426,428,429,431,451 > "$reconscript_dir/$dir_name/Alive.txt " &

wait 

cat "$reconscript_dir/$dir_name/Alive.txt" | waybackurls  > "$reconscript_dir/$dir_name/endpoints.txt" &
cat "$reconscript_dir/$dir_name/Alive.txt" | katana -jc >>  "$reconscript_dir/$dir_name/endpoints.txt" &

wait 
echo " \!ALL endpoints are Done! "
echo " ********************************************************** "
echo "[*] Running arjun for parameters checking.... "
arjun -i "$reconscript_dir/$dir_name/endpoints.txt" --stable -oT "$reconscript_dir/$dir_name/parameters.txt"  &

echo " All done Now get some bounties u dump shit! " 



