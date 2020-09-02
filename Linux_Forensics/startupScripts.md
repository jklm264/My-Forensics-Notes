# Linux Startup Scripts

- Equivalent to Window's startup locations in registry keys, services, etc. 
- On Linux, after kernel is loaded we start executing init scripts.
- Main script located usually in `/etc/init.d` while various helper scripts are in `/etc/rc.0.d`,`/etc/rc.1.d`, etc.
  - Numbers are run-level



### Common Scripts

- timezone
- disk checking with `$fsck`
- config networking
- mounting disks
- Security functions: Deny hosts, AV, Nfslock, fw



[Linux Tripwir](https://www.linuxjournal.com/article/8758)e (IDS) can tell if system files have been malicious modified or replaced.