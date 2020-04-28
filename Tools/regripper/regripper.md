# RegRipper



Usage: `rip.py -r *.reg -p [certain reg type]`

| Reg Hive | Vol.py cmd    |
| -------- | ------------- |
| SOFTWARE | recentdocs    |
| SOFTWARE | profilelist   |
| SOFTWARE | product       |
| SOFTWARE | winlogon      |
| SOFTWARE | soft_run      |
| SOFTWARE | user_run      |
| SOFTWARE | installedcomp |
| SOFTWARE | shellexec     |
| SYSTEM   | shutdown      |
| userdat  | typedurls     |
| userdat  | muicache      |
| userdat  | cain          |



##  How to Access

> xmount -in ewf file.e01 /mnt/e01/
> fdisk -l /mnt/e01 #find partition you want
> sudo mount -o loop,offset$((512*xxx)) 4Dell.e01 second_mntpoint



How to encase mount: [link here](https://resources.infosecinstitute.com/registry-forensics-regripper-command-line-linux/)



## Sources

  - https://resources.infosecinstitute.com/registry-forensics-regripper-command-line-linux/
