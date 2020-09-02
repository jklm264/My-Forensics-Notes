# Linux Run Levels

- defines different modes for OS to run in. Each level determines resources and programs that can be started and stopped.

| Level | Definition                                                  |
| ----- | ----------------------------------------------------------- |
| 0     | Halt - doesn't process anything just immediately shuts down |
| 1     | Single User Mode                                            |
| 2     | Multiuser, some networking                                  |
| 3     | Normal Boot without GUI (Multiuser, networking)             |
| 4     | Typically unused                                            |
| 5     | X11 GUI - default for login processes                       |
| 6     | Reboot - `$shutdown -r` or `$telenit 6` (not recommended)   |

- Can edit default runlevel via `$sudo gedit /etc/inittab`

  > ```bash
  > id:5:initdefault:
  > ```
  >
  > After change just reboot with `$sudo init 6` to verify

- To see what run level you are via `$who -r`



## Security Protections

If OS is damaged, can run `$sudo init 1`

- Disables networking services

- Allows user at keyboard to now be root

- To defend
  - `#vim /etc/sysconfig/init`
  - edit *SINGLE=/sbin/sushell* to */sbin/sulogin*