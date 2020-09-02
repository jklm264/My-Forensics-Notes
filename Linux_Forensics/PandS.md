# Linux Processes and Signals

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

## Linux Process Monitoring

NICE values - define how proc interacts with others. High nice values have lower priority, vice versa.

- Owner can never decrease value, however can make it more nice; unless root.
- Set at creation time with `#nice -7 <task>` will lower by 7 priority or `#renice 7 <task>` to set at 7 value.
- Ex: NTP is set to -12 (high priority)

### How to Monitor Procs

`$ps -aux` - shows all procs, even those you don't have control over  as a snapshot (a different user)

`$top` - real-time proc stats

- Both pull info from `/proc`
- See AoMF notes for this (procfs section)



[Welcome to Procfs](https://www.tldp.org/LDP/sag/html/proc-fs.html)