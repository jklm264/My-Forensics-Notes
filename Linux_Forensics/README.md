# Linux Forensics

## My Notes


1. Basics
2. Acquisition
3. Dead disk
4. Live box
5. Notable antiforensics techniques
6. Security Suggestions

---

---

## 1. Linux Basics

- everything's a file
- least privilege

### The Boot Process

> For more info, see [my notes here](LinuxSecurityCourse/LinuxOSSecurity.md)

Old: BIOS/MBR || New: UEFI/GPT

- Can boot with MBR too

<br>

During the boot process, if there is an issue will boot into "Single-User Mode".

- Can boot with *F5* for normal boot, over the network, or via USB.
- Gives you limited shell run at run-level 1 (Disabled networking services)
- For more info on this, see [my notes here](singleusermode.md)

<br>

Last step in boot process is running *init* (pid 1) script which runs `rc.[1-6].d`, including daemons.

### Run Levels

> For more info, see [my notes here](runLevels.md)

Linux **Run-Levels** defines different modes for OS to run in. Each level determines resources and programs that can be started and stopped.

| Level | Definition                                                  |
| ----- | ----------------------------------------------------------- |
| 0     | Halt - doesn't process anything just immediately shuts down |
| 1     | Single User Mode                                            |
| 2     | Multiuser, some networking                                  |
| 3     | Normal Boot without GUI (Multiuser, networking)             |
| 4     | Typically unused                                            |
| 5     | X11 GUI - default for login processes                       |
| 6     | Reboot - `$shutdown -r` or `$telenit 6` (not recommended)   |

- Can edit default run level via `$sudo gedit /etc/inittab`

### IPC

For more on IPC, process monitoring, and more see [here](PandS.md).

Threads are forks of processes…multithreading

- Process (or fork): Contains code, data, files, registries, and stacks
- Fork: A complete copy of a process except for address space, stacks, and heaps
- Thread: shares code and global data with entire process while **still maintaining its own stack and registers** - all in same address space. Threads can access other threads memory.
- Signals: [CPD lecture 6](LinuxSecurityCourse/6signals.pptx) and [CPD lecture 8](LinuxSecurityCourse/8ipc.pptx)

#### Process Monitoring

**NICE values** define how proc interacts with others. High nice values have lower priority, vice versa.

- Owner can never decrease value, however can make it more nice; unless root.
- Set at creation time with `#nice -7 <task>` will lower by 7 priority or `#renice 7 <task>` to set at 7 value.
- Ex: NTP is set to -12 (high priority)

##### Tools

- `$ps -aux`- shows all procs, even those you don't have control over  as a snapshot (a different user)
- `$top` show real-time proc stats
- Both pull info from `/proc`

### OS layout

> For my full notes, see [here](LinuxSecurityCourse/README.md).

<img src="https://media.geeksforgeeks.org/wp-content/uploads/linuxDir.jpg" height=350 />



- `/proc`
- `/dev/shm`

### File

> For my full notes from AoMF on files, see [here](LinuxBooting.md).

Executable and Linking Format is the main *E* file format in *Nix systems. [Documentation](http://www.skyfree.org/linux/references/ELF_Format.pdf)

A file can be broken into parts: Header, Sections, and Program Headers.

 [File Analysis by Malwareandstuff.com](https://malwareandstuff.com/linux-windows-internals-process-structures/?utm_source=rss&utm_medium=rss&utm_campaign=linux-windows-internals-process-structures)

#### Header

- Can use `7fELF` for signature scans

- Uses *Elf32_Ehdr* or *Elf64_Ehdr* data structures
  - *e_entry* is the entry point of the program!

#### Sections

- ELFs are divided into sections and *sh_name* holds an index into the string table of section names.
- Common ELF Sections: .text, .data, .rdata, .bss, .bss, .got
- When an ELF is packed/obfuscated (think malware) it's headers are removed [as they are optional and not used at runtime]. Instead, **program header's are what is used during runtime.**

#### Program Headers

- Used to map the file and its sections into memory *at runtime*

When packing a program though it becomes static! The dynamic portions (like loading libraries) are now compiled into the app. Running `$file <file>` will show *statically linked, stripped*. However, this is for simple/understood packers like UPX. For more complicated ones RE professionals first have to understand the packer, unpack the binary, then start to do the actual RE. Earlier in AoMF, the method of unpacking a binary was as simple as getting the DLL loaded to keep it in memory long enough to get a capture (the example goes `C:> rundll32 some.dll,FakeExport` did the trick [see page 248]).

#### Misc

- Shared Library Loading - Shared objects (*.so files); think Window's DLLs
- Global Offset Table - stores runtime address for external symbols
- Procedural Linkage Table - Supports calling functions within shared libraries and calls those functions whose address isn't known in the time of linking, and is left to be resolved by the dynamic linker at run time.
- [Great writeup on GOT, PLT, etc.](https://systemoverlord.com/2017/03/19/got-and-plt-for-pwning.html)



### Systemd Journal

- Contains USB mount info, networkmanager logs, logins, (re)boots, vpns, app/daemon errors, pgp/gpg agent activity, and more!
- Forward Secure Sealing provides integrity to logs (Chain of Custody)

For more on this, see [here](systemd_ddive.md)

## 2. Acquisition

> For more info, see [my notes here](https://github.com/jklm264/AoMF_Notes/blob/master/linuxMemoryAcquisition.md)

### Full Disk/Image Acquisition

Essentially just dd'ing.

#### Tools

- dd,dc3dd, vdmk/vm-state files, ftkimager

### Memory Acquisition

Historically, **memory ** acquisition was done via `/dev/mem`. This method only addresses the first 896 MB of RAM. This was misused and was disabled.

Then came `/dev/kmem` which could acquire a subset of memory on 32-bit systems. It exported the kernel virtual address space. This was misused and was disabled.

`ptrace` is the userland debugging interface. Only acquires pages of memory from running processes; thereby missing kernel memory, freed pages, and more. Still available but should only be used on 1 file, usually malware.



On modern systems there are only 3rd party tools now.

- [fmem](http://hysteria.sk/~niekt0/foriana/fmem_current.tgz) works by loading kernel driver that creates the `/dev/fmem` iface. Practically recreates `/dev/mem`, that allows you to export PHY memory for other programs to access. It also checks if PHY pages are in memory (via *page_is_ram()* before accessing). Also, it can access PHY pages above the 896MB limit set by `/dev/mem`. The down side is that `/proc/iomem` must be checked to figure out where RAM is mapped [since not all machines map main memory at PHY offset 0]. 
  - Can see this by running `$cat /proc/iomem/` or `$grep "System RAM" /proc/iomem` to see non-contigiouity.
- [Linux Memory Extractor (LiME)](https://code.google.com/p/lime-forensics) - works by loading kernel driver. With LiME, the driver does not create a device, instead the acquisition is done within the kernel. With no need to context switch this makes the tool more accurate. The tool automatically knows the address ranges that contain main memory by walking the kernel's *iomem_resource* linked list of descriptors for each PHY memory segment (`if segment_name == "System RAM":` get start and end members). A *lime* file format is used for the acquisition which removes the padded zeros along with metadata including a PHY offset lookup table; vol.py can read this file. However, you can also get raw or padded formats. *Andrew Case worked on this!* 
  - `$sudo insmod lime.ko "path=/mnt/externaldrive/memdmp.lime format=lime"`
  - Network-based: (On victim machine) `$sudo insmod lime.ko "path=tcp:4444 format=lime"` then (On forensic workstation) `$nc target_machine_ip > memdmp.lime`
- `/proc/kcore` - will export the kernel's virtual address space to userland as an ELF file. As with `/dev/mem` on 32-bit systems you are limited to the first 896MB of memory. Though on 64-bit systems, the kernel keeps a static virtual map of all RAM (found in `Documentation/x86/x86_64/mm.txt`). A PoC tool is in vol.py that parses the ELF and compares with `/proc/iomem`. However, `/proc/kcore` can be disabled (like in Gentoo) and malware can hook the read function and filter out data received by the userland tool.
- [Microsoft's Memory Acquisition Tool AMVL (github)](https://www.google.com/url?q=https://github.com/microsoft/avml&sa=D&source=calendar&usd=2&usg=AOvVaw0Vxnz37F8W9s1cowdhIWvy)

#### Tools

- dd, libewf, afflib, awfacquire, dc3dd, qemu-image (converts snapshots into raw disk image), if vm pause instance and take vmdk file, ewfacquire, ftkimager, [Project Freta (that provides automated full-system volatile memory inspection of Linux systems)](https://docs.microsoft.com/en-us/security/research/project-freta/) 



## 3. Dead Disk

1. Overview

You're looking at only files, keep that in mind.

1. Topics
   1. ELF analysis
      1. See [my notes](https://github.com/jklm264/AoMF_Notes/blob/master/linuxOS.md) for advanced file structure details
      2. Hidden files/scripts
         - Startup files in `/etc/rc{3,5}.d` and `/etc/init/` and (if there) `/etc/rc.local`. You can read up more on these [here](startupScripts.md)
         - Systemd configs: `/lib/systemd/system/*` and `/etc/systemd/system/*`
         - Check default run-level via: `/etc/inittab`
      3. Based on modified times: Ex `# find / -newermt "2019-09-06 18:30:00" - not -newermt "2019-09-08 00:15:00" > quicktimeline.txt` [src](https://github.com/ashemery/LinuxForensics/blob/master/OSDFCon19-Final.pdf)
      4. open files, searched strings, cmd_lines, and more: `~/.viminfo`
      5. Find recently accessed executable files by a user: `$find . -type f -perm /111 -user thole -atime -7 -printf “%AY%Am%Ad%AH%AM%AS %h — %s — %f\n” |sort -n`
   2. File System Analysis
      1. `/etc/` includes a ton of info inlcuidng hostname, timezone, network/interfaces, host (custom DNS resolution)
   3. Linux Logging
      1. Logins - failed logins(`/log/faillog` and `/var/log/btmp`), user logins (`wtmp`), auth logs [contains sudo usage] (`/var/log/auth.log`)
         - cron: `$grep -v cron auth.log* | grep -v sudo | grep -i <user>`
         - Cron logs can be found in `/var/log/syslog`
      2. Bash - `.bash{_history,_aliases,_profile,rc}`, env_vars, 
         - `/etc/profile`
         - `/root/.bashrc`
      3. syslog (`/var/log/*` & `/var/log/secure`)
      4. `/proc` aka `$ps` (might want to run through volatility for `$vol.py linux_pslist`)
      5. Events by background deamons: `/var/log/deamon.log`
2. Tool list
   1. TSK
   2. Testdisk



## 4. Live Box

1. Overview

Live box is obviously great for a number a reasons, over deadbox. One specific reason is because it includes the `/proc`,`/sys`,`/dev`, and `/run` directories.

2. Topics

   1. Procfs/sysfs
   2. Cache and swapfile

   - Found `/etc/fstab`

   - If swap is the size of ram or larger, it can be used for hibernation:

   - A hibernating system has a complete memory dump saved to disk
   - Large amounts of cached user data in /home/user/.cache, this contains application data

3. Tool list

   1. Volatility
      1. [Android Mind Reading: Memory Acquisition and Analysis with LiME and Volatility](https://web.archive.org/web/20200207152230/https://www.sans.org/cyber-security-summit/archives/file/summit-archive-1493741700.pdf)
      2. [13Cubed Linux & Vol.py vid](https://www.youtube.com/watch?v=6Frec5cGzOg)
      3. [Warlock memory forensics walk throughs](https://medium.com/@mohit.r.phy/around-memory-forensics-in-80-days-part-3-volatility-process-list-27dffb1f97e3)
   2. [Hal Pomeranz Github](https://github.com/halpomeranz/dfis)
   3. [Linux Forensics Harvester (written in rust)](https://github.com/theflakes/Linux_Forensic_Harvester)
   4. [Sekoia Lab's Tool](https://github.com/SekoiaLab/Fastir_Collector_Linux)
   5. [imagemounter](https://github.com/ralphje/imagemounter) - MITRE uses this in their [thumbtack program](https://github.com/mitre/thumbtack).
   6. [libewf](https://github.com/libyal/libewf)



## 5. Anti-forensics

> For more info, see [my Processes and Process Memory notes here](https://github.com/jklm264/AoMF_Notes/blob/master/procsandProcMem.md)

### Using Single User Mode

- Can go into single user mode and then `#passwd` to change root password

### Other techniques

- Hiding files - `.<filename>`
- Time stomping
- Tunneling
- Disabled logging
- steganography
- packed binaries - check entropy then quarantine
- more…



## 6. Security Suggestions

Do defend again Single User Mode password reset:

- `#vim /etc/sysconfig/init`
- edit *SINGLE=/sbin/sushell* to */sbin/sulogin*

<br/>

To convert epoch to human readable: `$date -d @1535347485`

<br/>

[Linux Tripwire](https://www.linuxjournal.com/article/8758) (IDS) can tell if system files have been malicious modified or replaced.



## Thank you Hal Pomeranz

- [Hal Pomeranz Linux Forensics (slide 64)](https://archive.org/details/HalLinuxForensics/page/n1/mode/2up)
- [Hal at Blackhill (vid)](https://www.blackhillsinfosec.com/webcast-linux-forensics-magical-mystery-tour-with-hal-pomeranz/) - [my notes](Hal_MagicalMysteryTour.md)
- [Drive of his exercises](https://drive.google.com/drive/folders/1mb5Qf8PEuf03RJNR0Bs1KSQfiL8zanBR)


 ## Linux Analysis by Others

- [Champlain presentation](MagnetChamplain_linux.md)
- [Lookup site for unix bins](https://gtfobins.github.io/)
- [Explainshell.com](https://explainshell.com)
- [LinPeas - then best enum script](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS)
- [Any enum script- LinEnum by rebootuser](https://github.com/rebootuser/LinEnum/blob/master/LinEnum.sh)
- [Conda's youtube channel](https://www.youtube.com/watch?list=PLDrNMcTNhhYrBNZ_FdtMq-gLFQeUZFzWV&v=E4_n_RbyoxQ&feature=emb_logo)

### Miscellaneous

- [usbrip](https://www.youtube.com/watch?v=DP4ScSp_2yE)
- [Linux Swap Analyzer](https://github.com/sevagas/swap_digger)
- [LinuxLeo starting page 22](https://linuxleo.com/Docs/LinuxLeo_4.93.pdf)
- [GTFOBins - Unix binaries and how to get root](https://gtfobins.github.io/)
- [SANs whitepaper: Dead Linux Machines Tales](https://www.sans.org/reading-room/whitepapers/forensics/dead-linux-machines-tales-34227)
- [Linux upskills challenge](https://github.com/snori74/linuxupskillchallenge/blob/master/0%20-%20AWS%20Free%20Tier.md)

