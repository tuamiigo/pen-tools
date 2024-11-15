#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 -T <network_ip> -D <destination_folder>"
    exit 1
}

# Parse command-line arguments
while getopts "T:D:" opt; do
    case $opt in
        T) network_ip="$OPTARG" ;;  # Get the network IP after the -T flag
        D) destination_folder="$OPTARG" ;;  # Get the destination folder after the -D flag
        *) usage ;;  # Display usage on invalid option
    esac
done

# Check if the network IP and destination folder were provided
if [ -z "$network_ip" ] || [ -z "$destination_folder" ]; then
    usage
fi

# Check if the destination folder exists, if not create it
if [ ! -d "$destination_folder" ]; then
    echo "Destination folder not found. Creating $destination_folder"
    mkdir -p "$destination_folder"
fi

# Define output file names
output_file="${destination_folder}/fast_${network_ip//\//_}.txt"
ips_file="${destination_folder}/ips_${network_ip//\//_}.txt"

# Perform the nmap scan and save the result to the output file
echo "Scanning network: $network_ip"
nmap -sn "$network_ip" > "$output_file"

# Extract IPs from the fast_<network_ip>.txt and save them in ips_<network_ip>.txt
grep -oP '\d{1,3}(\.\d{1,3}){3}' "$output_file" | sort -n -t'.' -k1,1 -k2,2 -k3,3 -k4,4 > "$ips_file"

# Inform the user where the results are saved
echo "Nmap scan results saved to: $output_file"
echo "IPs saved to: $ips_file"
