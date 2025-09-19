#!/usr/bin/env bash
# impacket-cmdplaybook.sh
# English-only content inside script. Use in a lab environment only.
# Shows numbered list of impacket scripts then prints a short usage template and one-line description.
# Command examples use the "impacket-<name>" form as requested.

C_RESET="\e[0m"
C_BLUE="\e[34m"
C_CYAN="\e[36m"
C_YELLOW="\e[33m"
C_GREEN="\e[32m"
C_WHITE="\e[37m"

TOOLS=(
"impacket-DumpNTLMInfo"
"impacket-Get-GPPPassword"
"impacket-GetADComputers"
"impacket-GetADUsers"
"impacket-GetLAPSPassword"
"impacket-GetNPUsers"
"impacket-GetUserSPNs"
"impacket-addcomputer"
"impacket-atexec"
"impacket-changepasswd"
"impacket-dacledit"
"impacket-dcomexec"
"impacket-describeTicket"
"impacket-dpapi"
"impacket-esentutl"
"impacket-exchanger"
"impacket-findDelegation"
"impacket-getArch"
"impacket-getPac"
"impacket-getST"
"impacket-getTGT"
"impacket-goldenPac"
"impacket-karmaSMB"
"impacket-keylistattack"
"impacket-lookupsid"
"impacket-machine_role"
"impacket-mimikatz"
"impacket-mqtt_check"
"impacket-mssqlclient"
"impacket-mssqlinstance"
"impacket-net"
"impacket-ntfs-read"
"impacket-ntlmrelayx"
"impacket-owneredit"
"impacket-ping"
"impacket-ping6"
"impacket-psexec"
"impacket-raiseChild"
"impacket-rbcd"
"impacket-rdp_check"
"impacket-reg"
"impacket-registry-read"
"impacket-rpcmap"
"impacket-sambaPipe"
"impacket-services"
"impacket-smbclient"
"impacket-smbexec"
"impacket-smbserver"
"impacket-sniff"
"impacket-sniffer"
"impacket-split"
"impacket-ticketConverter"
"impacket-ticketer"
"impacket-tstool"
"impacket-wmipersist"
"impacket-wmiquery"
)

declare -A EXAMPLE
declare -A DESC

EXAMPLE["impacket-DumpNTLMInfo"]="impacket-DumpNTLMInfo -target 192.168.1.10 -out dump.txt"
DESC["impacket-DumpNTLMInfo"]="Extract NTLM related info from target for analysis."

EXAMPLE["impacket-Get-GPPPassword"]="impacket-Get-GPPPassword -domain EXAMPLE -dc-ip 192.168.1.5"
DESC["impacket-Get-GPPPassword"]="Locate Group Policy Preferences XML and show stored passwords."

EXAMPLE["impacket-GetADComputers"]="impacket-GetADComputers -domain EXAMPLE -dc-ip 192.168.1.5"
DESC["impacket-GetADComputers"]="Enumerate AD computer objects."

EXAMPLE["impacket-GetADUsers"]="impacket-GetADUsers -domain EXAMPLE -dc-ip 192.168.1.5"
DESC["impacket-GetADUsers"]="Enumerate AD user objects."

EXAMPLE["impacket-GetLAPSPassword"]="impacket-GetLAPSPassword -dc-ip 192.168.1.5 -cred 'EXAMPLE\\user:Pass'"
DESC["impacket-GetLAPSPassword"]="Retrieve LAPS stored passwords if accessible."

EXAMPLE["impacket-GetNPUsers"]="impacket-GetNPUsers -dc-ip 192.168.1.5 -usersfile users.txt"
DESC["impacket-GetNPUsers"]="Find accounts without Kerberos preauth (for AS-REP roast testing)."

EXAMPLE["impacket-GetUserSPNs"]="impacket-GetUserSPNs -dc-ip 192.168.1.5 -user alice"
DESC["impacket-GetUserSPNs"]="Find SPNs for accounts useful in Kerberos attacks."

EXAMPLE["impacket-addcomputer"]="impacket-addcomputer -domain EXAMPLE -dc-ip 192.168.1.5 -computername newComp$"
DESC["impacket-addcomputer"]="Example syntax for adding a computer object programmatically."

EXAMPLE["impacket-atexec"]="impacket-atexec 'EXAMPLE\\Administrator:Pass@192.168.1.10' 'whoami'"
DESC["impacket-atexec"]="Run a single command via Task Scheduler RPC."

EXAMPLE["impacket-changepasswd"]="impacket-changepasswd 'EXAMPLE\\user@192.168.1.10' -newpass 'NewPass123'"
DESC["impacket-changepasswd"]="Change an account password via RPC."

EXAMPLE["impacket-dacledit"]="impacket-dacledit -target 192.168.1.10 -acl 'add ACE...'"
DESC["impacket-dacledit"]="Modify or inspect DACL entries. Requires proper privileges."

EXAMPLE["impacket-dcomexec"]="impacket-dcomexec 'EXAMPLE\\Administrator:Pass@192.168.1.10' 'cmd.exe /c whoami'"
DESC["impacket-dcomexec"]="Execute command through DCOM interfaces."

EXAMPLE["impacket-describeTicket"]="impacket-describeTicket -ticket /tmp/ticket.kirbi"
DESC["impacket-describeTicket"]="Parse and display Kerberos ticket details."

EXAMPLE["impacket-dpapi"]="impacket-dpapi -input dpapi_blob.bin -user alice"
DESC["impacket-dpapi"]="Analyze DPAPI blobs for recoverability."

EXAMPLE["impacket-esentutl"]="impacket-esentutl -db Edb.db -export out.json"
DESC["impacket-esentutl"]="Work with ESENT DB files for forensic analysis."

EXAMPLE["impacket-exchanger"]="impacket-exchanger -server mail.example.local"
DESC["impacket-exchanger"]="Exchange enumeration utilities."

EXAMPLE["impacket-findDelegation"]="impacket-findDelegation -dc-ip 192.168.1.5"
DESC["impacket-findDelegation"]="Find accounts/computers with delegation rights."

EXAMPLE["impacket-getArch"]="impacket-getArch -target 192.168.1.10"
DESC["impacket-getArch"]="Detect target architecture."

EXAMPLE["impacket-getPac"]="impacket-getPac -ticket /tmp/ticket.kirbi"
DESC["impacket-getPac"]="Extract PAC from a Kerberos ticket."

EXAMPLE["impacket-getST"]="impacket-getST -user alice -spn cifs/host -dc-ip 192.168.1.5"
DESC["impacket-getST"]="Request a service ticket (TGS)."

EXAMPLE["impacket-getTGT"]="impacket-getTGT -user alice -dc-ip 192.168.1.5"
DESC["impacket-getTGT"]="Request a TGT for testing."

EXAMPLE["impacket-goldenPac"]="impacket-goldenPac -create -user krbtgt -out golden.kirbi"
DESC["impacket-goldenPac"]="Create golden PAC template in controlled lab."

EXAMPLE["impacket-karmaSMB"]="impacket-karmaSMB -listen -iface eth0"
DESC["impacket-karmaSMB"]="SMB listener for captive testing."

EXAMPLE["impacket-keylistattack"]="impacket-keylistattack -wordlist rockyou.txt -target 192.168.1.10"
DESC["impacket-keylistattack"]="Offline keylist attack template."

EXAMPLE["impacket-lookupsid"]="impacket-lookupsid -dc-ip 192.168.1.5 S-1-5-21-..."
DESC["impacket-lookupsid"]="Resolve SIDs to account names."

EXAMPLE["impacket-machine_role"]="impacket-machine_role -target 192.168.1.10"
DESC["impacket-machine_role"]="Determine machine role in domain."

EXAMPLE["impacket-mimikatz"]="impacket-mimikatz -help"
DESC["impacket-mimikatz"]="Wrapper reference. Use mimikatz only in sealed lab."

EXAMPLE["impacket-mqtt_check"]="impacket-mqtt_check -broker mqtt.local"
DESC["impacket-mqtt_check"]="Check basic MQTT broker behavior."

EXAMPLE["impacket-mssqlclient"]="impacket-mssqlclient 'sa@192.168.1.20'"
DESC["impacket-mssqlclient"]="Interactive MS SQL client."

EXAMPLE["impacket-mssqlinstance"]="impacket-mssqlinstance -instance MSSQLSERVER -host 192.168.1.20"
DESC["impacket-mssqlinstance"]="Enumerate SQL Server instances."

EXAMPLE["impacket-net"]="impacket-net -command 'user list' -target 192.168.1.10"
DESC["impacket-net"]="Generic net RPC helper."

EXAMPLE["impacket-ntfs-read"]="impacket-ntfs-read -image ntfs.img -path /Users/Administrator/Desktop/secret.txt"
DESC["impacket-ntfs-read"]="Read files from NTFS images."

EXAMPLE["impacket-ntlmrelayx"]="impacket-ntlmrelayx -smb2support -t ldap://192.168.1.200"
DESC["impacket-ntlmrelayx"]="Relay NTLM auth to target service in lab."

EXAMPLE["impacket-owneredit"]="impacket-owneredit -target 192.168.1.10 -owner 'EXAMPLE\\user'"
DESC["impacket-owneredit"]="Change owner metadata if permitted."

EXAMPLE["impacket-ping"]="impacket-ping 192.168.1.10"
DESC["impacket-ping"]="SMB/ICMP ping helper."

EXAMPLE["impacket-ping6"]="impacket-ping6 fe80::1"
DESC["impacket-ping6"]="IPv6 ping helper."

EXAMPLE["impacket-psexec"]="impacket-psexec 'EXAMPLE\\Administrator:Pass@192.168.1.10'"
DESC["impacket-psexec"]="Service-backed remote execution."

EXAMPLE["impacket-raiseChild"]="impacket-raiseChild -service ExampleService"
DESC["impacket-raiseChild"]="Spawn or manage child service processes."

EXAMPLE["impacket-rbcd"]="impacket-rbcd -dc-ip 192.168.1.5 -target 192.168.1.10"
DESC["impacket-rbcd"]="Resource-based constrained delegation checks."

EXAMPLE["impacket-rdp_check"]="impacket-rdp_check 192.168.1.10"
DESC["impacket-rdp_check"]="Assess RDP settings and encryption."

EXAMPLE["impacket-reg"]="impacket-reg -action read -key 'HKLM\\Software\\...'"
DESC["impacket-reg"]="Registry access helper."

EXAMPLE["impacket-registry-read"]="impacket-registry-read -host 192.168.1.10 -key 'HKLM\\...' "
DESC["impacket-registry-read"]="Read registry hives remotely."

EXAMPLE["impacket-rpcmap"]="impacket-rpcmap -target 192.168.1.10"
DESC["impacket-rpcmap"]="Enumerate RPC endpoints."

EXAMPLE["impacket-sambaPipe"]="impacket-sambaPipe -target 192.168.1.10 -pipe 'browser'"
DESC["impacket-sambaPipe"]="Interact with SMB named pipes."

EXAMPLE["impacket-services"]="impacket-services -target 192.168.1.10"
DESC["impacket-services"]="List and query services."

EXAMPLE["impacket-smbclient"]="impacket-smbclient //192.168.1.10/Share -u user -p Pass"
DESC["impacket-smbclient"]="Interactive SMB client."

EXAMPLE["impacket-smbexec"]="impacket-smbexec 'EXAMPLE\\Administrator:Pass@192.168.1.10'"
DESC["impacket-smbexec"]="Execute commands via SMB exec technique."

EXAMPLE["impacket-smbserver"]="impacket-smbserver SHARE /tmp/share -smb2support"
DESC["impacket-smbserver"]="Serve a local dir over SMB."

EXAMPLE["impacket-sniff"]="impacket-sniff -i eth0"
DESC["impacket-sniff"]="Capture SMB/RPC traffic."

EXAMPLE["impacket-sniffer"]="impacket-sniffer -iface eth0"
DESC["impacket-sniffer"]="Alternate sniffer utility."

EXAMPLE["impacket-split"]="impacket-split -in big.bin -size 1048576"
DESC["impacket-split"]="Split files into chunks."

EXAMPLE["impacket-ticketConverter"]="impacket-ticketConverter -in ticket.kirbi -out ticket.ccache"
DESC["impacket-ticketConverter"]="Convert Kerberos ticket formats."

EXAMPLE["impacket-ticketer"]="impacket-ticketer -create -user krbtgt -key krbtgt.key"
DESC["impacket-ticketer"]="Forge test tickets in controlled environment."

EXAMPLE["impacket-tstool"]="impacket-tstool -action info -ticket ticket.kirbi"
DESC["impacket-tstool"]="Ticket service tooling."

EXAMPLE["impacket-wmipersist"]="impacket-wmipersist -install -target 192.168.1.10"
DESC["impacket-wmipersist"]="Install a WMI persistence stub in lab."

EXAMPLE["impacket-wmiquery"]="impacket-wmiquery -target 192.168.1.10 -query \"SELECT Name FROM Win32_Process\""
DESC["impacket-wmiquery"]="Run WMI queries against a Windows host."

# Display function
display() {
  local tool="$1"
  clear
  echo -e "${C_BLUE}Tool:${C_RESET} ${C_CYAN}${tool}${C_RESET}"
  echo
  echo -e "${C_BLUE}Example:${C_RESET} ${C_WHITE}${EXAMPLE[$tool]:-<usage template>}${C_RESET}"
  echo
  echo -e "${C_BLUE}Description:${C_RESET} ${C_WHITE}${DESC[$tool]:-<short description>}${C_RESET}"
  echo
  echo -e "${C_GREEN}Press Enter to continue${C_RESET}"
  read -r
}

# Main loop
TOTAL=${#TOOLS[@]}
while true; do
  clear
  echo -e "${C_YELLOW}Impacket quick reference (lab only)${C_RESET}"
  echo
  i=1
  for t in "${TOOLS[@]}"; do
    printf "%2d) %s\n" "$i" "$t"
    ((i++))
  done
  echo
  echo -e "${C_YELLOW}0) Exit${C_RESET}"
  echo

  # prompt loop: if input is empty we redisplay the menu
  read -p "Select number (1-${TOTAL}, 0 to exit): " choice_raw
  # trim whitespace
  choice="${choice_raw//[[:space:]]/}"

  if [[ -z "$choice" ]]; then
    echo -e "${C_GREEN}No input. Showing menu again. Enter a number from 1 to ${TOTAL}.${C_RESET}"
    read -r -p "Press Enter to continue..."
    continue
  fi

  if [[ "$choice" =~ ^[0-9]+$ ]]; then
    if [[ "$choice" -eq 0 ]]; then
      clear
      exit 0
    fi
    if (( choice >= 1 && choice <= TOTAL )); then
      tool="${TOOLS[$((choice-1))]}"
      display "$tool"
    else
      echo -e "${C_GREEN}Invalid selection. Enter a number from 1 to ${TOTAL}. Press Enter.${C_RESET}"
      read -r
    fi
  else
    echo -e "${C_GREEN}Enter a numeric value. Press Enter.${C_RESET}"
    read -r
  fi
done