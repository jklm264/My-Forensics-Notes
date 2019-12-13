# Artifacts

* Recall ntuser.dat is really just HKCU hive
* usrclass.dat is more segmentation (UAC)
  * Used to record configuration information from user rpoc's that do not have access to write to the standard registry hives.
  * Is **NOT** parsed in FTK Imager, does do ntuser.dat

### Registry Artifacts

* If a conflict between HKLM and HKCU, Windows loads from HKCU.
* ComDlg32 - for recent paths in programs. Ex: MSWord recent docs
* RecentDocs - will usually be lnk files
* RunMRU - in regedit, more easibly readable
* TypedPaths - those typed into File Explorer's browser bar
* UserAssist - rot13'd but GUID paths
* `HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Shares` - all shares on the system
* `HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces` - all ifaces
  * Also `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList`
  * `HKLM\SOFTWARE\Microsoft\WZCSVC\Parameters\Interfaces\{GUID}`
    * 0x06:Wired, 0x17:Broadband, 0x47:Wireless
    
#### Shellbags

* Customization configurations (sizes, placements, etc)
* BagMRU || Bags
* Use a tool.

#### Recycling Bin

*$Recycle.Bin
 * $R ("recovery") is the data
 * $I is metadata
* [Tool](https://df-stream.com/recycle-bin-i-parser/)

#### LNK

* persist even if the orgiinal system file was deleted.
* file containing a pointer to another file on the FS.
 * Magic Bytes: `4C 00 00 00`
 * Contains: Network Share information, original file location, host system name, MAC address,...
* Locations:
 * `C:\Users\Mussm\AppData\Roaming\MS\Win\Recent`
 * `C:\Users\Mussm\AppData\Roaming\Microsoft\Office\Recent`

#### Jump Lists

* Intro'd in Win7
* Locations:
 * `C:\Users\Mussm\AppData\Roaming\Microsoft\Office\Recent`
* Automatic Destinations - common api features and Object Linking and Embedding Compound Files.
 * Each Stream is its own link file
* Custom Destinations
 * App-specific, developer made
 
#### Prefetch

* Windows “prefetches” the necessary code and data to a single location. Then, prevents the system from seeking across system files for DLLs and other needed data.

#### Thumbcache

* Created when the user uses the Thumbnails or Filmstrip folder viewing options in File Explorer.
* Location: `<System Volume>\Users\<User Name>\AppData\Local\Microsoft\Windows\Explorer.`
* Stored in SQLite db
* [Tool](https://thumbcacheviewer.github.io/)

### USBs 
* `%ControlSet%\ENum\USBSTOR\%DEVICE_NAME%\%SerialNumber%`
* CurrentControlSet will only show on live system or vmem capture
  * ...\CurrentControlSet\\...\USBStor
 
1.  Device serial number: 
  * If '&' at end of string means can be found in an online lookup table somewhere. Though, if '&' in second charecter means EOM didn't follow MS's instructions and WinOS assigned the device its own random serial number
  * Wil find LastWrite Timestamp in UTC

2. `SYSTEM\CurrentControlSet\Enum\USB`
  * Will find VID & PID
  * VID & PID should match a lookup of the Serial Number

3. `SOFTWARE\Microsoft\Windows Portable Devices\Devices\%SerialNumber%`
  * Will find *FreindlyName*
  * Can also confirm LastWriteTime
  
4. `SYSTEM\MountedDevices\`
  * Will find Drive Letter and Volume GUID
  * Looking for GUID (WinOS given) here by matching the SerialNumber in the dot-seperated entries
  * Would be ?\\Volume
  
5. `SOFTWARE\Microsoft\Windows NT\CurrentVersion\EMDMgmt`
  * Will find the Volume Serial Number
  * Only present if device is **not** an SSD
  * something about ReadyBoost in Win Vista
  
6.`NTUSER.dat\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2`
  * Will find first time and last time device connected, and removal time.
  * Use Volume Serial Number to correlate.
  * Does anyone know what happned to MountPoints1?

7. `SYSTEM\%CurrentControlSet%\Enum\USBSTOR\Ven_Prod_Version\USB iSerial #\Properties\GUID\Properties`
  * 0064 - Will find first install (Win7/8) :: also found in setupapi.dev.log (Vista+)
  * 0066 - Will find Last Connected (Win8+) :: also found in \enum\USB\VID last writetime and \mountpoint2\GUID
  * 0067 - Last Removal (Win8+)

* [Recommended USB tool](https://github.com/woanware/usbdeviceforensics)
* [Niresoft's tool](https://www.nirsoft.net/utils/usb_devices_view.html)
* [More Source](https://hatsoffsecurity.com/2014/06/07/usb-forensics-pt-2-vendor-id-vid-product-id-pid/)
* Last, [SANS USB Checklist](https://blogs.sans.org/computer-forensics/files/2009/09/USBKEY-Guide.pdf)

## Tools

* [Access Data Registry Explorer](https://accessdata.com/product-download/registry-viewer-1-8-0-5)
* Access Data Shellbags Explorer [download](https://www.oit.va.gov/Services/TRM/ToolPage.aspx?tid=11030)
* RegRipper (Might use in Automated tool)
* [TZWorks jmp.exe for LNK files](https://tzworks.net/download_links.php)
  * LNK files are actually in db structure in AutomaticDestinations





## Further Reading:
* https://cyberforensicator.com/
* [13Cubed](https://www.youtube.com/watch?v=VYROU-ZwZX8&t=2328s)
* [Shellbags](https://www.sans.org/reading-room/whitepapers/forensics/windows-shellbag-forensics-in-depth-34545)
* [Website that shows you all registry creations & modifications by application](http://greatis.com/pcapps/teamviewer/teamviewerforwindows-11-0-64630.html#rega)

