# systemd

This is the `$sudo systemctl status nginx.server`.

Traditional init systems initlaize the userland components after the Linux kernel is booted. It is also responsible for managing services and daemons. In *systemd* **units** are resources to be managed. Units are categorized by their type, usually in their suffix (e.g. At `/etc/systemd/system/` has *sshd.service*, *snap.lxd.daemon.unix.socket*, etc.).

When you run "`$sudo systemctl enable/disable <application>`", you are creating (or deleting) a symbolic link from `/lib/systemd/system` to `/etc/systemd/system/<some_target>`.

<details>
  <summary>To see system units: `$systemctl list-units`</summary>

```bash
UNIT                               LOAD   ACTIVE SUB     DESCRIPTION
atd.service                        loaded active running ATD daemon
avahi-daemon.service               loaded active running Avahi mDNS/DNS-SD Stack
dbus.service                       loaded active running D-Bus System Message Bus
dcron.service                      loaded active running Periodic Command Scheduler
dkms.service                       loaded active exited  Dynamic Kernel Modules System
getty@tty1.service                 loaded active running Getty on tty1
```
</details>


<br/>

|  Column | Defined|
| ---- | ---- |
|  Unit    | Column Name|
|  Load    | if unit's config has been parsed by systemd|
|  Active    | check if unit started successfully|
|  Sub    | lower-level state of unit|
|  Description | trivial|

<br/>

**Of note**, LOAD is kept in memory. 

Also, list-units only shows active units. To see all units, use `$systemctl list-units --all`. This will show any unit that systemd loaded or attempted to load.

## Deep Dive

To display a unit file loaded into the system, `$systemctl cat apache2.service`:

```bash
# /lib/systemd/system/apache2.service
[Unit]
Description=The Apache HTTP Server
After=network.target remote-fs.target nss-lookup.target
Documentation=https://httpd.apache.org/docs/2.4/

[Service]
Type=forking
Environment=APACHE_STARTED_BY_SYSTEMD=true
ExecStart=/usr/sbin/apachectl start
ExecStop=/usr/sbin/apachectl stop
ExecReload=/usr/sbin/apachectl graceful
PrivateTmp=true
Restart=on-abort

[Install]
WantedBy=multi-user.target
```

Can also check unit low-level properties. Of importance are dependancies (*list-dependencies*) and miscellaneous properties (*show*). You can even **mask** services (aka masking the unit), meaning to make services completely unstartable by linking it to `/dev/null`. When you run `$systemctl list-unit-files | grep masked` you'll be able to see them.

```bash
$sudo systemctl mask nginx.service # not allow nginx to start automatically or manually
$sudo systemctl start nginx.service
> Failed to start nginx.service: Unit nginx.service is masked.
$sudo systemctl unmask nginx.service # will unmask
> # It'll start now
```

## Editing Unit Files

This must be done with the *edit* parameter (e.g. `$sudo systemctl edit nginx.service`). By running the full command, systemd will actually create a directory (e.g. */etc/systemd/system/nginx.service.d/*) that will contain said new directive. To edit the full unit file instead of just creating a snippet, you pass *--full* to the inital command; after, the newly modified file in `/etc/systemd/system` will take precedence over the system's unit definition found in (usually) `/lib/systemd/system`.

## Adjusting the System State (Runlevel) with Targets

> Targets are special unit files that describe a system state or synchronization point

Targets group units together. They are used mainly in runlevels, but can also be used to allow certain units to be available at a desired state (e.g. *swap.target* indicates swap is ready for use. It contains *Wanted/RequiredBy=* and also *After=*).

You can get the default target with `$systemctl get-default`.

You can isolate (stop) targets with `$sudo systemctl isolate <*.target>`.

There are event are "shortcuts" target. Like in `rescue` when you want the system to go into single-user mode ;). Note, all users will be alerts of the event.

[DigitalOcean systemd overview src](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
