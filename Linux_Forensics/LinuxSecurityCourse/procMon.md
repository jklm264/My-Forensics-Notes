# Linux Process Monitoring

NICE values - define how proc interacts with others. High nice values have lower priority, vice versa.

- Owner can never decrease value, however can make it more nice; unless root.
- Set at creation time with `#nice -7 <task>` will lower by 7 priority or `#renice 7 <task>` to set at 7 value.
- Ex: NTP is set to -12 (high priority)



## How to Monitor Procs

`$ps -aux` - shows all procs, even those you don't have control over  as a snapshot (a different user)

`$top` - real-time proc stats

- Both pull info from `/proc`
- See AoMF notes for this (procfs section)