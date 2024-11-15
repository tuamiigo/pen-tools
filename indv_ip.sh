#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 -l <ip_list_file> -D <destination_directory>"
    exit 1
}

# Parse command-line arguments
while getopts "l:D:" opt; do
    case $opt in
        l) ip_list_file="$OPTARG" ;;  # Get the file provided after the -l flag
        D) destination_dir="$OPTARG" ;;  # Get the destination directory after the -D flag
        *) usage ;;  # Display usage on invalid option
    esac
done

# Check if IP list file was provided
if [ -z "$ip_list_file" ] || [ -z "$destination_dir" ]; then
    usage
fi

# Check if the file exists
if [ ! -f "$ip_list_file" ]; then
    echo "File not found: $ip_list_file"
    exit 1
fi

# Check if the destination directory exists, create it if not
if [ ! -d "$destination_dir" ]; then
    echo "Directory not found, creating: $destination_dir"
    mkdir -p "$destination_dir"
fi

# Read IP addresses from the provided file
while IFS= read -r ip; do
    # Run nmap scan and save output to a file in the specified destination directory
    echo "Scanning $ip..."
    sudo nmap -sV -sC -O "$ip" > "${destination_dir}/${ip}.txt"
    echo "Results saved to ${destination_dir}/${ip}.txt"
done < "$ip_list_file"
