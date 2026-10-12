## Prompt
You are a senior mainframe expert. Explain this COBOL program in plain English. List the paragraphs, any file I/O, and anything a modern developer would find surprising. Keep the answer under 200 words
## Analysis
You are a senior mainframe expert. Explain this COBOL program in plain English. List the paragraphs, any file I/O, and anything a modern developer would find surprising. Keep the answer under 200 words
This COBOL program reads a flat file called EMPLOYEE.DAT and prints each record to the screen.

Paragraphs/sections:

IDENTIFICATION DIVISION: names the program as READFLATFILE.
ENVIRONMENT DIVISION: tells COBOL the file is a sequential input file named EMPLOYEE.DAT.
DATA DIVISION:
FILE SECTION: defines EMP-RECORD with fields:
EMP-ID PIC 9(5) (5-digit numeric ID)
EMP-NAME PIC X(20) (20-char name)
EMP-DEPARTMENT PIC X(15) (15-char dept)
WORKING-STORAGE: WS-EOF is a 1-character flag initialized to 'N'.
PROCEDURE DIVISION:
000-MAIN-LOGIC opens the file, reads until end-of-file, and prints each record.
When READ hits end-of-file, it sets WS-EOF to 'Y'; otherwise it displays the record.
File I/O:

OPEN INPUT EMP-FILE
READ EMP-FILE ... AT END / NOT AT END
CLOSE EMP-FILE
STOP RUN
Surprising for modern developers:

COBOL is very verbose and fixed-format historically.
File structure is explicitly described in the DATA DIVISION, not inferred from code.
Sequential file reading uses a loop plus end-of-file flag instead of iterators.
DISPLAY is the standard output statement; there is no console API.
