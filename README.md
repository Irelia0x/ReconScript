#ReconScript


ReconScript is a bash script designed to automate reconnaissance tasks for discovering subdomains, checking for alive subdomains, finding endpoints, and identifying parameters on a given domain.

Features
Subdomain Discovery: Uses assetfinder and subfinder to find all subdomains associated with a target domain.
HTTP Enumeration: Utilizes httpx to check the status of discovered subdomains and fetch HTTP response headers.
Endpoint Discovery: Uses katana and waybackurls to find endpoints from alive subdomains.
Parameter Analysis: Uses arjun to identify potential parameters from discovered endpoints.
Prerequisites
Ensure you have the following tools installed and available in your system's /bin directory:

assetfinder
subfinder
httpx
waybackurls
katana
arjun
Installation
Clone the repository:

bash
Copy code
git clone https://github.com/your-username/ReconScript.git
cd ReconScript
Make the script executable:

bash
Copy code
chmod +x recon_script.sh
Ensure necessary tools are installed:

If any tool is missing, follow the installation instructions provided in the script or refer to the respective GitHub repositories.

Usage
Run the script with a target domain URL:

bash
Copy code
./recon_script.sh https://example.com
This will initiate the reconnaissance process, saving results in the reconscript directory.

Output
Subdomains: reconscript/domain_name/subs.txt
HTTPX Output: reconscript/domain_name/httpx_output.txt
Endpoints: reconscript/domain_name/endpoints.txt
Parameters: reconscript/domain_name/parameters.txt
Notes
This script is designed for Linux systems.
Ensure you have necessary permissions (sudo) for installing tools to /bin.
Customize the script or adjust tool versions as per your requirements.
Contributing
Contributions are welcome! Fork the repository, make your changes, and submit a pull request.

License
This project is licensed under the
