# Linux OS Security (FedVTE)

## Booting Linux

- Least privilege



## UEFI

- BIOS - runs self diagnostic tests and detects CPU, memory, key components (POST)

- Newer systems have UEFI
- Passes control from BIOS to kernel securely and can't be tampered with (key signing and checksums)
  - Bootloader (GRUB) will load **EFI system partition** (ESP) located in `/boot/efi`
    - ESP is a vfat partition labeled with a GUID
    - ESP contains EFI bootloaders and application software

## Boot Process

- Boot code stored in Read Only Memory (ROM) which figures out how to load the **Kernel**
- The **Kernel** initially goes out and probes for hardware and software (POST-like) and device drivers
  - Also starts *init* process (PID 1)
- During boot, FS is checked for corruption before being mounted.
  - Might have you going into "Single-User Mode" to fix these errors
- Then Daemons (services) are started; e.g. httpd, apached, cupsd, systemd-journal
- Then init scripts are run from *init* process



## The Real Boot Order

1. Boot loader is read from MBR (Master boot record)
   - This is the very first block on the harddrive
2. Kernel is loaded and initialized; checks for FS errors and might boot into "recovery mode" (same as SUM)
3. Kernel proc is created
4. Init scripts
5. Get program into memory
   - Kernel lives at `/boot/vmlinuz`
   - Done in two phases: **1)** Boot loader is loaded into ROM **2)** figures out how much RAM there is and sets aside some memory for itself (can't be used by userland procs).
6. Checks the hardware (not drivers yet)
   - If exists will then check for drivers
7. Software that starts up now
   - `kjournald` - file system journaling
   - `kswapd` - memory swap if low memory
   - `ksoftirqd` - manages software interrupts (irq's)
   - `khubd` - USB devices (USB hub)



## When a user starts up a Terminal

/etc/rc.*, /etc/profile, /etc/bashrc, ~/.bashrc, ~/.login, ~/.profile, and more!



## Learn Later

- SCSI