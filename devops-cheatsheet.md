## 1. File & Directory Basics 
mkdir #Create a new directory 
cd #change directoey into 
echo"text" > file.txt  #create/overwrite file with text
echo"text" >> file.txt  #fappend text to the end of an existig file 
cat file.txt #Read and display full file ontents 

## 2. Linux Permissiond 
## File permission
chmod 600 <file>  #Owner : read/write. Group/other :No access
ls -l file.txt  #Display detailed permissions full file and metadata 

## 3. user & system Inspection
cat /etc /passwd  #view system user database grep 
"hemu"/etc/passwd  # search for file lines matching "hemu"

## 4.Process Management 
sleep 300 &  #Run a command in the background (&)
ps aux / grep sleep  #Search active process list for PID (process ID) 
kill<pid>  #Terminate processs by its PID number (dont use < > brackets ,put the value on the place of "< >")

## 5. Networking & Web Servers
sudo apt update && sudo apt install -y nginx #Update repose and install Ngnix
systemmctl status nginex  #Check if services is running 
curl -I http;/localhost  #Fetch HTTP response header (200OK)
sudo tail -n 5 /var/nginx/sccess.log  #Read last 5 lines of access log 

## 6. process Management 
ps aux | grep <name>  # find the process ID(PID) of a running app 
kill (PID)  #stop a running process by its ID number 

## 7. Networkng & Nginx
sudo apt install ngnix   #Install Nginx web server 
curl -I http://localhost  #Fetch HTTPheader to test if web server is live

# Day 02 Summary: Automation & Scheduling

## Verified Deliverables
- Dynamic system check: `sys_info.sh`
- Service health monitor: `health_monitor.sh`
- Batch file processor: `log_cleanup.sh`
- Automated background task: `crontab`

## Core Command Reference
crontab -e  # Open interactive editor
crontab -l  # List active cron jobs
crontab -r  # Remove all cron jobs for current user

## Output Stream Redirection
>     # Overwrite standard output
>>    # Append standard output
2>&1  # Redirect stderr (stream 2) to stdout (stream 1)

# Day 03: Linux Networking, Firewalls & Diagnostics

## Key Concepts
- Socket: IP Address + Port Number (e.g., 127.0.0.1:80)
- Listening State: Process is waiting for network connections
- Default Deny: Security best practice to block all inbound traffic unless allowed

## Port Diagnostic Commands
ss -tulpn              # List all listening TCP/UDP sockets with process names
sudo netstat -tulpn    # Alternative legacy socket checker
lsof -i :80            # Find process running on port 80

## UFW Firewall Commands
sudo ufw status verbose    # Check status and detailed rules
sudo ufw enable            # Turn firewall ON
sudo ufw disable           # Turn firewall OFF
sudo ufw allow 80/tcp      # Open port 80 for TCP traffic
sudo ufw delete allow 80   # Remove rule allowing port 80

## Network Probing Commands
dig domain.com +short      # Query DNS IP address
nc -zv HOST PORT           # Check if specific TCP port is open/reachable
traceroute domain.com      # Trace packet hop path across network

# Day 04: Linux Process Management & Monitoring

## Key Concepts
- Process ID (PID): Unique numeric identifier for running programs.
- Systemd (PID 1): Root parent process of all system services.
- SIGTERM (15): Polite request to close files and exit gracefully.
- SIGKILL (9): Unsafe forced kill by Linux kernel.

## Essential Diagnostics Commands
ps aux --sort=-%mem | head -n 10   # Top 10 memory users
ps aux --sort=-%cpu | head -n 10   # Top 10 CPU users
pgrep -a <process_name>            # Find PID by name
kill -15 <PID>                     # Soft graceful kill
kill -9 <PID>                      # Force kill
top / htop                         # Real-time resource                               task manager 

sh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG6NZamJVM1yGPnmEn9xlathjaH8sDs3nxeug9UXrMfk hemant@devops-learning