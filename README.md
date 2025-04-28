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
