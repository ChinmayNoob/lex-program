# Lex/Flex Programs

This repository contains three lex (lexical analyzer) programs that demonstrate different text processing capabilities using flex/lex.

## Prerequisites

Make sure you have the following installed on your system:
- `flex` (or `lex`)
- `gcc` (GNU Compiler Collection)

### Installation on Ubuntu/Debian:
```bash
sudo apt-get update
sudo apt-get install flex gcc
```

### Installation on CentOS/RHEL:
```bash
sudo yum install flex gcc
```

## Programs Overview

### Program 1: Word and Number Identifier (`program1.l`)
- **Purpose**: Identifies and categorizes words and numbers in input text
- **Functionality**: 
  - Recognizes sequences of digits as "Number"
  - Recognizes sequences of letters as "Word"
  - Ignores other characters
- **Input**: Interactive (stdin)
- **Output**: Categorized tokens printed to stdout

### Program 2: Text Statistics Counter (`program2.l`)
- **Purpose**: Counts characters, words, spaces, and lines in input text
- **Functionality**: 
  - Counts total characters (including spaces and newlines)
  - Counts words (sequences of alphanumeric characters)
  - Counts spaces and tabs
  - Counts newlines
- **Input**: Interactive (stdin)
- **Output**: Statistical summary printed to stdout

### Program 3: File-based Text Statistics (`program3.l`)
- **Purpose**: Same as Program 2 but reads from file and outputs to both console and file
- **Functionality**: 
  - Reads input from `input.txt`
  - Counts characters, words, spaces, and lines
  - Outputs results to both console and `output.txt`
- **Input**: `input.txt` (must exist)
- **Output**: Console output + `output.txt` file

## How to Compile and Run

### General Compilation Steps:
1. Generate C source from lex file: `flex program.l`
2. Compile the generated C file: `gcc lex.yy.c -o executable_name`
3. Run the executable: `./executable_name`

### Program 1: Word and Number Identifier

**Compile:**
```bash
flex program1.l
gcc lex.yy.c -o program1
```

**Run:**
```bash
./program1
```

**Example Usage:**
```
Input: Hello123 world 456
Output:
Word: Hello
Number: 123
Word: world
Number: 456
```

*Press Ctrl+D (EOF) to exit*

### Program 2: Text Statistics Counter

**Compile:**
```bash
flex program2.l
gcc lex.yy.c -o count
```

**Run:**
```bash
./count
```

**Example Usage:**
```
Input: Hello world
This is a test
Output:
Character = 25
Word      = 5
Space     = 6
Line      = 2
```

*Press Ctrl+D (EOF) to see results*

### Program 3: File-based Text Statistics

**Compile:**
```bash
flex program3.l
gcc lex.yy.c -o pr3
```

**Prepare input file:**
```bash
echo "Hello this is a character.
This is a new word.
This is a test.
This is a line." > input.txt
```

**Run:**
```bash
./pr3
```

**Output:**
- Console will display statistics
- `output.txt` will contain the same statistics

**Example Output:**
```
Character = 40
Word      = 18
Space     = 18
Line      = 4
```

## Quick Start - Run All Programs

### Method 1: Individual Compilation
```bash
# Compile all programs
flex program1.l && gcc lex.yy.c -o program1
flex program2.l && gcc lex.yy.c -o count  
flex program3.l && gcc lex.yy.c -o pr3

# Run Program 1 (interactive)
echo "Hello123 world 456" | ./program1

# Run Program 2 (interactive)
echo -e "Hello world\nThis is a test" | ./count

# Run Program 3 (file-based)
./pr3
```

### Method 2: One-liner for each program
```bash
# Program 1
flex program1.l && gcc lex.yy.c -o program1 && echo "Hello123 world 456" | ./program1

# Program 2  
flex program2.l && gcc lex.yy.c -o count && echo -e "Hello world\nThis is a test" | ./count

# Program 3
flex program3.l && gcc lex.yy.c -o pr3 && ./pr3
```

## File Structure

```
.
├── program1.l          # Source: Word/Number identifier
├── program2.l          # Source: Interactive text counter
├── program3.l          # Source: File-based text counter
├── input.txt           # Sample input for program3
├── output.txt          # Generated output from program3
├── lex.yy.c           # Generated C source (created during compilation)
├── program1           # Compiled executable for program1
├── count              # Compiled executable for program2
├── pr3                # Compiled executable for program3
├── .gitignore         # Git ignore file
└── README.md          # This file
```

## Notes

- Program 1 and 2 read from standard input (stdin)
- Program 3 specifically reads from `input.txt` and writes to `output.txt`
- All programs use flex/lex for lexical analysis
- The `lex.yy.c` file is automatically generated and should not be edited manually
- Executables are platform-specific and can be regenerated from source files

## Troubleshooting

**Error: "flex: command not found"**
- Install flex using your system's package manager

**Error: "gcc: command not found"**
- Install gcc compiler using your system's package manager

**Error: "No such file or directory" for program3**
- Make sure `input.txt` exists in the same directory
- Create it with sample content if missing

**Permission denied when running executables**
- Make sure files are executable: `chmod +x program1 count pr3`