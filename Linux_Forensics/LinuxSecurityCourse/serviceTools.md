# Chkconfig and Upstart

- *S\** is start, *K\** is kill services
- To check bootup status via `#chkconfig –list <service>`
- To edit: `#chkconfig <service> [on|off] –-level <0-6>`
  - If no level specified, will use 2 through 5.
  - **If you edit**, will change run levels above specified level as well

- To add a service to bootup process: `#chkconfig –add <name_of_service>`
  - This will add entry in level-specific `/etc/rc?.d` directory
  - Delete: `#chkconfig -del <name_of_service>`



**Upstart notes left out because this was never continued past 2005.** ([Ubuntu ditched it in 2015](https://www.linuxjournal.com/content/ubuntu-ditches-upstart#:~:text=On%20April%2023%2C%202015%2C%20Ubuntu,Upstart%20init%20system%20to%20systemd.).)