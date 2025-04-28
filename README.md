# Fawry_Internship_Task
## Q1 : Custom Command ( mygrep.sh )
mygrep.sh is a simplified, grep-like Bash script that searches for a given pattern in a file, with case-insensitive matching. It supports basic options similar to grep, including:
### Key Features:
1. Case-Insensitive Search
   - Converts both the search string and file lines to lowercase for comparison.
2. Options:
   - -n (or --line-numbers) → Displays line numbers for matching lines.
   - -v (or --invert-match) → Shows lines that do not contain the pattern.
   - -vn (or -nv) → Combines -v and -n (shows non-matching lines with line numbers).
   - -h (or --help) → Displays usage instructions.
3. Usage Examples:
   - Basic search:
   - ./mygrep.sh "hello" file.txt
     
   - Show line numbers:
   - ./mygrep.sh -n "hello" file.txt
  
   - Invert match (non-matching lines):
   - ./mygrep.sh -v "hello" file.txt
  
   - Invert match with line numbers:
   - ./mygrep.sh -vn "hello" file.txt
