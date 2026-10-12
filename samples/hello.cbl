       IDENTIFICATION DIVISION.
       PROGRAM-ID. READFLATFILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *    Maps the internal program file to an external physical file
           SELECT EMP-FILE ASSIGN TO "EMPLOYEE.DAT"
           ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
      *    Defines the structural layout of the flat file records
       FD  EMP-FILE.
       01  EMP-RECORD.
           05  EMP-ID        PIC 9(5).
           05  EMP-NAME      PIC X(20).
           05  EMP-DEPARTMENT PIC X(15).

       WORKING-STORAGE SECTION.
      *    Flag used to control the end-of-file reading loop
       01  WS-EOF            PIC X(1) VALUE 'N'.

       PROCEDURE DIVISION.
       000-MAIN-LOGIC.
      *    Open the sequential file for reading
           OPEN INPUT EMP-FILE.

      *    Read and process records until the End of File flag is set
           PERFORM UNTIL WS-EOF = 'Y'
               READ EMP-FILE
                   AT END 
                       MOVE 'Y' TO WS-EOF
                   NOT AT END 
                       DISPLAY "ID: " EMP-ID 
                               " | Name: " EMP-NAME 
                               " | Dept: " EMP-DEPARTMENT
               END-READ
           END-PERFORM.

      *    Close file and release system resources
           CLOSE EMP-FILE.
           STOP RUN.
