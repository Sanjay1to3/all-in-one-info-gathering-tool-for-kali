#!/bin/bash

# create my target
TARGET_URL="http://vulnweb.com/"


echo "Performing DNS lookup..."
IP=$(dig +short "$TARGET_URL")
echo "IP address: $IP"


echo "Performing WHOIS lookup..."
whois "$TARGET_URL"


echo "Performing traceroute..."
traceroute "$TARGET_URL"


echo "Performing port scan..."
nmap "$TARGET_URL"


echo "Identifying web technologies..."
wappalyzer-cli "$TARGET_URL"


echo "Gathering website information..."
whatweb "$TARGET_URL"


echo "Discovering directories and files..."
dirb "$TARGET_URL"


echo "Performing web server vulnerability scan..."
nikto -h "$TARGET_URL"


echo "Performing WordPress vulnerability scan (if applicable)..."
wpscan --url "$TARGET_URL" --enumerate vp


echo "Checking SSL/TLS configuration..."
sslyze --regular "$TARGET_URL"


echo "Checking robots.txt file..."
robotsdisallowed "$TARGET_URL"


echo "Capturing website screenshots..."
gowitness single "$TARGET_URL"


echo "Capturing additional website screenshots..."
eyewitness --web "$TARGET_URL"

echo "Information gathering complete."
