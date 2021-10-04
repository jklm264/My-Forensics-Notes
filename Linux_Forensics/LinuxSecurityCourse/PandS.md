# Linux Processes and Signals

See CPD notes.



**Process** - an address space set aside by the kernel (via memory pages) and a set of data structures



Kernel - keeps track of data about a process:

	- Address space map
	- status
	- execution priority
	- owner
	- resources the process in using or has used
	- signal masks and signal blocks



Threads are forks of processes…multithreading

- Process (or fork): Contains code, data, files, registries, and stacks
- Fork: A complete copy of a process except for address space, stacks, and heaps
- Thread: shares code and global data with entire process while **still maintaining its own stack and registers** - all in same address space. Threads can access other threads memory.



Process ID numbers (PID) and Parent PID (PPID) 

- Can track down a proc with PPID

- Use `$ps` to easily see

User ID (UID) - person who created the process and is a copy of the parent process

Effective UID (EUID) determine what files the process has access to at any given point in time

Group ID (GID) and Effective GID (EGID)

- GID is seen only when a file is created and the file may take on the GID of the creation process



## Process Lifecycle

- A proc creates a coy of itself with *fork*
- Recall
- Init does the start up scripts with PID 1.

- Can `kill` or `wait` procs.



## Signals

[CPD lecture 6](6signals.pptx) and[CPD lecture 8](8ipc.pptx)



