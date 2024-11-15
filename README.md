# pen-tools
## Pentesting tools for Internal Pentesting (NMAP USE)

### Fast.sh

This script performs a **fast** Nmap scan on a list of IP addresses to quickly identify which hosts are up (responsive). The results are saved in individual files within a specified destination directory.

#### Usage
```bash
Usage: ./fast.sh -T <network_ip> -D <destination_folder>

Parameters:
  -T <network_ip>: Network IP or subnet (e.g., 192.168.1.0/24).
  -D <destination_folder>: Folder to save results.

Functionality:
  - Validates input.
  - Creates the destination folder if it doesn't exist.
  - Runs an Nmap ping scan (-sn) on the specified network.
  - Extracts IP addresses from the scan and saves them to two files:
    - `fast_<network_ip>.txt`: Full scan output.
    - `ips_<network_ip>.txt`: List of active IPs.

Example:
  
  ./fast.sh -T 192.168.1.0/24 -D /path/to/folder
```
### Indv_ip.sh

This script performs a deeper and more comprehensive Nmap scan on a list of IP addresses, gathering detailed information about open ports, service versions, and OS detection. The results are saved in individual files within a specified destination directory.

#### Usage
```bash
Usage: ./indv_ip.sh -l <ip_list_file> -D <destination_directory>

Parameters:
  -l <ip_list_file>: Path to a file containing a list of IP addresses to scan.
  -D <destination_directory>: Directory to save the scan results.

Functionality:
  - Validates input.
  - Checks if the IP list file exists.
  - Creates the destination directory if it doesn’t exist.
  - Reads the IP addresses from the provided file and runs a comprehensive Nmap scan on each:
    - `-sV`: Service version detection to identify versions of running services.
    - `-sC`: Script scan to run a set of default scripts for more in-depth analysis (e.g., checking for vulnerabilities).
    - `-O`: OS detection to determine the operating system of the target.
  - Saves the detailed scan results for each IP in a separate file named `<ip>.txt` within the destination directory.

Example:

  ./indv_ip.sh -l ip_list.txt -D /path/to/folder

```
### O_scan.sh

This script performs an Nmap OS detection scan on a list of IP addresses and saves the results in individual files in a specified directory. The scan focuses on identifying the operating system of the target hosts.  

#### Usage 
```bash 
Usage: ./o_scan.sh -l <ip_list_file> -D <destination_directory>

Parameters

-l <ip_list_file>: Path to a text file containing a list of IP addresses (one IP per line) to scan.
-D <destination_directory>: Directory where scan results will be saved.

Functionality
- Ensures that both parameters are provided.
- Confirms that the IP list file exists.
- Creates the destination directory if it does not already exist.
- Reads each IP address from the provided file.
- Executes an Nmap scan for OS detection (-O) on each IP.
- Saves the results for each IP to a separate file named `<ip>.txt` in the specified destination directory.

Example

./o_scan.sh -l ip_list.txt -D ./results

```
