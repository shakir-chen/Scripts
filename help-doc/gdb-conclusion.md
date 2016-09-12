
## Index
Running Program Under GDB
Running programs backwards

Stopping and Continuing

Recording Inferior's Execution and Replaying it
Examing the stack
Examing Source Files
Examing Data
Debugging Optimized Code
C Preprocessor Macros
Tracepoints
Debugging Programs that Use Overlays
Using gdb with Different Languages
Examing the Symbol Table
Altering Execution
gdb Files
Specifying a Debugging Target
Debugging Remote Programs
Configuration-Specific Inforamtion
Controlling GDB
Extending gdb
Command Interpreters
gdb Text User Interface

## Concepts

Breakpoints:
stop execution in a particular place
Watchpoints:
stop execution whenever the value of an expression changes, without having to predict a particular place where this may happen
Catchpoints:
stop for certain kinds of program events, such as C++ exceptions or the loading of a shared library. Use the catch command to set a catchpoint.

## Watch Variables
```
p xxx       #print variables
```

## Running Program Backward
```
reverse-next
reverse-step
reverse-continue
```
But it needs environment-support
