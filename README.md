# impacket-cmdplaybook

Quick reference playbook for the impacket-cmdplaybook.sh interactive menu script.
For lab and testing use only.

Overview

impacket-cmdplaybook.sh is a Bash script that displays a colorized, numbered menu of Impacket command-line utilities. Selecting a number shows a compact usage template and a one-line description for that tool. The script is a read-only reference and does not execute attacks by itself. Use only in isolated labs and authorized testing environments.

Features

Colorized interactive menu (ANSI/tput compatible).

56 referenced Impacket tools with example usage and short descriptions.

Input validation: forces numeric input and handles empty input.

Simple, single-file Bash implementation.

Requirements

bash (POSIX-compatible).

Terminal that supports ANSI escape sequences (most terminals).

tput optional but not required.

Installation

Save impacket-cmdplaybook.sh to your preferred folder.

Make it executable:

chmod +x impacket-cmdplaybook.sh

(Optional) Move to a directory in your PATH:

sudo mv impacket-cmdplaybook.sh /usr/local/bin/

Usage

Run the script from a terminal:

./impacket-cmdplaybook.sh

You will see a numbered list of tools. Type the tool number and press Enter to view the example and description. Valid choices are 1 to 56. Enter 0 to exit.

If you press Enter without typing a number the menu will re-display and prompt again.

Example session

$ ./impacket-cmdplaybook.sh

Impacket quick reference (lab only)

 1) impacket-DumpNTLMInfo
 2) impacket-Get-GPPPassword
 3) impacket-GetADComputers
 ...
55) impacket-wmipersist
56) impacket-wmiquery

0) Exit

Select number (1-56, 0 to exit): 5

Tool: impacket-GetLAPSPassword
Example: impacket-GetLAPSPassword -dc-ip 192.168.1.5 -cred 'EXAMPLE\\user:Pass'
Description: Retrieve LAPS stored passwords if accessible.

Press Enter to return to menu

Safety and Legal

This repository and the script are intended for defensive research, training, and lab use only. Do not use the referenced tools against systems you do not own or have explicit authorization to test. The author and repository make no guarantees and assume no liability for misuse.

Contributing

Keep entries concise: one-line description and a short example.

Maintain English for code and examples.

Submit PRs for new tools or corrections.

License

MIT License recommended. Add a LICENSE file if you want to publish.

This README documents the provided impacket-cmdplaybook.sh script logic and usage. Examples in the script are lab-only templates and must be adapted to your environment.
