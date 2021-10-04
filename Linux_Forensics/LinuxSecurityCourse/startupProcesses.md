# Linux Startup Processes

##  Run Levels

| Level | Definition                                                  |
| ----- | ----------------------------------------------------------- |
| 0     | Halt - doesn't process anything just immediately shuts down |
| 1     | Single User Mode                                            |
| 2     | Multiuser, some networking                                  |
| 3     | Multiuser, networking                                       |
| 4     | Typically unused                                            |
| 5     | X11 GUI - default for login processes                       |
| 6     | Reboot - `$shutdown -r` or `$telenit 6` (not recommended)   |

- 10 run levels are supported
- Default run level on boot in `/etc/inittab`

- common practice - custom scripts should be added to `/etc/rc.d/rc.local`
  - `$Chkconfig` will add/remove startup scripts from the system and the run level at which they run
  - Ubuntu tried *Upstart* where scripts are handled in `/etc/event.d/*`  but [ditched it in late 2015](https://www.linuxjournal.com/content/ubuntu-ditches-upstart#:~:text=On%20April%2023%2C%202015%2C%20Ubuntu,Upstart%20init%20system%20to%20systemd.).



Network configs

- `/etc/sysconfig/network` includes network interfaces (iface's) and configuration parameters.



## Suggested Procs to Disable on Boot

- netfs, pcmcia, sendmail, nfs, nfslock, cups



## Switch Service States

To stop: `#/etc/init.d/*service* stop`

To permanently disable: `#chkconfig *service* off`



## Incorrect Shutdown/Reboots

- issues with integrity of system files and database corruption
- The shutdown/restart scripts cleanly make sure this doesn't happen