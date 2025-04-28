# Fawry_Internship_Task
## Q1 : Custom Command ( mygrep.sh )
mygrep.sh is a simplified, grep-like Bash script that searches for a given pattern in a file, with case-insensitive matching. It supports basic options similar to grep, including:
### Key Features:
1. Case-Insensitive Search
   - Converts both the search string and file lines to lowercase for comparison.
2. Options:
```
   -n (or --line-numbers) → Displays line numbers for matching lines.
   -v (or --invert-match) → Shows lines that do not contain the pattern.
   -vn (or -nv) → Combines -v and -n (shows non-matching lines with line numbers).
   -h (or --help) → Displays usage instructions.
```
4. Usage Examples:
   - Basic search:
     ```
        ./mygrep.sh "hello" file.txt
     ```
     
   - Show line numbers:
   ```
        ./mygrep.sh -n "hello" file.txt
   ```
  
   - Invert match (non-matching lines):
   ```
        ./mygrep.sh -v "hello" file.txt
   ```
  
   - Invert match with line numbers:
   ```
        ./mygrep.sh -vn "hello" file.txt
   ```

**This script is useful for quick searches in files without needing full grep functionality. 🚀**

### Reflective Section
#### 1. Argument and Option Handling Breakdown
- Initializes flags (show_line_numbers, invert_match) to 0 (false)
- Uses getopts to parse -n and -v options in any order
- Sets corresponding flags to 1 (true) when options are detected
- Shifts processed options away using shift $((OPTIND-1))


#### 2. Supporting Additional Features
- To support regex or standard grep options like -i (case-sensitive), -c (count), or -l (filename only), I would:
- Add more case statements in the getopts loop
- Implement conflict detection (e.g., -i vs case-insensitive default)
- Add conditional branches for different matching modes


#### 3. Most Challenging Implementation Aspect
- The hardest part was implementing proper option-argument separation while maintaining case-insensitive matching. Specifically:
- Getting -nv and -vn to work identically required careful getopts implementation
- Ensuring options didn't interfere with argument processing
- Initially tried complex regex patterns which failed edge cases
- Distinguishing between missing arguments and missing files
- Providing clear error messages for each failure mode

#### Bonus Features
- Added support for `--help` flag to print usage instructions .
- Improved command-line option parsing using `getopts` for cleaner and more efficient handling of `-n` and `-v` options .


## Q2 : Internal Service Unreachable
1. Verified DNS with dig (local and 8.8.8.8)
2. Diagnosed service with curl and telnet
3. Listed possible causes
4. Applied fixes for DNS, firewall, services
5. Bonus: Used /etc/hosts and systemd-resolved


### 1. DNS Verification
```
- Used dig to check DNS resolution locally and via 8.8.8.8.
- Observed that local DNS failed to resolve, while Google DNS also did not find it.
- Conclusion: Likely an internal DNS or network misconfiguration.
```

  
### 2. Service Reachability
```
- Used curl and telnet to check port 80 and 443 connectivity .
- Found that telnet could not connect (connection refused) .
- Used netstat to check if web server is listening → Web service was NOT listening on external interfaces .
```

### 3. Possible Causes
```
- Local DNS resolver misconfigured in /etc/resolv.conf
- Internal DNS server down or misconfigured
- DNS record missing or incorrect in internal zone
- Split DNS configuration mismatch (internal vs external)
- DNS cache poisoning or stale cache
- DNSSEC validation failure
- DNS query being blocked by firewall
```

### 4. Solutions Applied
```
Problem	                        Confirmation	                Fix
DNS wrong server	       cat /etc/resolv.conf	  Updated to correct DNS IP
Service not listening	        ss -tuln	      Updated server config and restarted web service
Firewall blocking        	sudo ufw              status	Allowed ports 80/443

```
