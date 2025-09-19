# impacket-cmdplaybook

Overview
impacket-cmdplaybook.sh is a Bash script that provides a quick reference guide for Impacket command-line tools.
It displays a numbered menu of available Impacket scripts, and for each selection it shows:
The tool name
An example usage command
A short description
This script is designed for lab and testing environments only.
Features
Colorized and interactive menu
Over 50 Impacket tools referenced
Built-in usage examples and one-line descriptions
Input validation (forces numeric input, handles empty input)

# Usage

Make the script executable:
نسخ التعليمات البرمجية
Bash
chmod +x impacket-cmdplaybook.sh
Run the script:
نسخ التعليمات البرمجية
Bash
./impacket-cmdplaybook.sh
Navigate the menu by typing the number of the tool you want to view.
Example: enter 5 to view details for impacket-GetLAPSPassword.
Enter 0 to exit.

# Example Run
نسخ التعليمات البرمجية
Bash
$ ./impacket-cmdplaybook.sh
Impacket quick reference (lab only)

 1) impacket-DumpNTLMInfo
 2) impacket-Get-GPPPassword
 3) impacket-GetADComputers
 ...
55) impacket-wmipersist
56) impacket-wmiquery

0) Exit

Select number (1-56, 0 to exit): 27




#
