# ReconScript

ReconScript is a bash script designed to automate reconnaissance tasks for discovering subdomains, checking for alive subdomains, finding endpoints, and identifying parameters on a given domain.

## Features

- **Subdomain Discovery:** Uses `assetfinder` and `subfinder` to find all subdomains associated with a target domain.
- **HTTP Enumeration:** Utilizes `httpx` to check the status of discovered subdomains and fetch HTTP response headers.
- **Endpoint Discovery:** Uses `katana` and `waybackurls` to find endpoints from alive subdomains.
- **Parameter Analysis:** Uses `arjun` to identify potential parameters from discovered endpoints.

## Prerequisites

Ensure you have the following tools installed and available in your system's `/bin` directory:

- [assetfinder](https://github.com/tomnomnom/assetfinder)
- [subfinder](https://github.com/projectdiscovery/subfinder)
- [httpx](https://github.com/projectdiscovery/httpx)
- [waybackurls](https://github.com/tomnomnom/waybackurls)
- [katana](https://github.com/Projekt-XYZ/katana)
- [arjun](https://github.com/s0md3v/Arjun)

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Irelia0x/ReconScript.git
   cd ReconScript
   ```

## Usage

    ```bash
    chmod +x ./recon1.sh
    chmod +x ./addHTTPS.sh
    ./recon1.sh <Main Domain url >
    ./recon1.sh https://example.com
    ```

## Notes

1. **This script is designed for Linux systems.**
2. **Ensure you have necessary permissions (sudo) for installing tools to /bin.**
3. **Customize the script or adjust tool versions as per your requirements.**

## Contributing

Contributions are welcome! Fork the repository, make your changes, and submit a pull request.
