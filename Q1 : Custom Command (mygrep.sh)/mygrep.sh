#!/bin/bash

# Initialize variables
show_line_numbers=0
invert_match=0
show_help=0

# Usage information function
Information_Help() {
    echo "Usage: Mygrep [OPTION]... PATTERNS [FILE]...Search for PATTERNS in each FILE"
    echo "A simplified grep-like utility with case-insensitive search"
    echo ""
    echo "Options:"
    echo "  -n, --line-numbers    Show line numbers for matches"
    echo "  -v, --invert-match    Select non-matching lines"
    echo "  -h, --help            Display this help message"
    echo ""
    echo "Examples:"
    echo "  $0 hello file.txt          # Basic search"
    echo "  $0 -n hello file.txt       # Show line numbers"
    echo "  $0 -v hello file.txt       # Invert match"
    exit 0
}

# Improved option parsing
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help=1
            shift
            ;;
        -n|--line-numbers)
            show_line_numbers=1
            shift
            ;;
        -v|--invert-match)
            invert_match=1
            shift
            ;;
        --)
            shift
            break
            ;;
        -*)
            echo "Error: Unknown option $1" >&2
            Information_Help
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

# Show help if requested
if [ $show_help -eq 1 ]; then
    Information_Help
fi

# Validate remaining arguments
if [ $# -ne 2 ]; then
    echo "Error: Incorrect number of arguments" >&2
    echo "Waring: missing the search string "
    exit 1
fi

search_string="$1"
filename="$2"

# Check if file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found" >&2
    exit 1
fi

# Convert search string to lowercase for case-insensitive comparison
lc_search=$(echo "$search_string" | tr '[:upper:]' '[:lower:]')

# Read file line by line
line_number=0
while IFS= read -r line; do
    ((line_number++))
    
    # Convert line to lowercase for case-insensitive comparison
    lc_line=$(echo "$line" | tr '[:upper:]' '[:lower:]')
    
    # Check for match
    if [[ "$lc_line" == *"$lc_search"* ]]; then
        match=1
    else
        match=0
    fi
    
    # Invert match if -v option was used
    if [ $invert_match -eq 1 ]; then
        match=$((!match))
    fi
    
    # Print the line if it matches
    if [ $match -eq 1 ]; then
        if [ $show_line_numbers -eq 1 ]; then
            echo "${line_number}:${line}"
        else
            echo "$line"
        fi
    fi
done < "$filename"