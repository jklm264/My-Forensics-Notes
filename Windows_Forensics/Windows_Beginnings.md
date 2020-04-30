# Artifacts

- Recall ntuser.dat is really just HKCU hive
- usrclass.dat is more segmentation (UAC)
  - Used to record configuration information from user rpoc's that do not have access to write to the standard registry hives.
  - Is **NOT** parsed in FTK Imager, does do ntuser.dat



### Registry Artifacts

- If a conflict between HKLM and HKCU, Windows loads from HKCU.
- ComDlg32 - for recent paths in programs. Ex: MSWord recent docs
- RecentDocs - will usually be lnk files
- RunMRU - in regedit, more easibly readable
- TypedPaths - those typed into File Explorer's browser bar
- UserAssist - rot13'd but GUID paths
- `HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Shares` - all shares on the system
- `HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces` - all ifaces
  - Also `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList`
  - `HKLM\SOFTWARE\Microsoft\WZCSVC\Parameters\Interfaces\{GUID}`
    - 0x06:Wired, 0x17:Broadband, 0x47:Wireless
- **Service Tracing**
  - Basic debug info about reunning servies and modules.
  - local user permission
  - `HKLM\SOFTWARE\Microsoft\Tracing`
  - Present from XP to current
  - [More Info on exploit](itm4n.github.io/cve-2020-0668-windows-service-tracing-eop/)

#### Shellbags

- Customization configurations (sizes, placements, etc)
- BagMRU || Bags
- Use a tool.

#### Recycling Bin

- $Recycle.Bin
- $R ("recovery") is the data
- $I is metadata
- [Tool](https://df-stream.com/recycle-bin-i-parser/)

#### LNK

- persist even if the orgiinal system file was deleted.
- file containing a pointer to another file on the FS.
  - Magic Bytes: `4C 00 00 00`
  - Contains: Network Share information, original file location, host system name, MAC address,...
- Locations:
  - `C:\Users\Mussm\AppData\Roaming\MS\Win\Recent`
  - `C:\Users\Mussm\AppData\Roaming\Microsoft\Office\Recent`

#### Jump Lists

- Intro'd in Win7
- Locations:
  - `C:\Users\Mussm\AppData\Roaming\Microsoft\Office\Recent`
- Automatic Destinations - common api features and Object Linking and Embedding Compound Files.
  - Each Stream is its own link file
- Custom Destinations
  - App-specific, developer made

#### Prefetch

- Windows “prefetches” the necessary code and data to a single location. Then, prevents the system from seeking across system files for DLLs and other needed data.

#### Thumbcache

- Created when the user uses the Thumbnails or Filmstrip folder viewing options in File Explorer.
- Location: `<System Volume>\Users\<User Name>\AppData\Local\Microsoft\Windows\Explorer.`
- Stored in SQLite db
- [Thumbcache Viewer Tool](https://thumbcacheviewer.github.io/)

### USBs

- [See here for step-by-step](USB_info.md) 



## Tools

- KAPE
- [Access Data Registry Explorer](https://accessdata.com/product-download/registry-viewer-1-8-0-5)
- Access Data Shellbags Explorer [download](https://www.oit.va.gov/Services/TRM/ToolPage.aspx?tid=11030)
- RegRipper (Might use in Automated tool)
- [TZWorks jmp.exe for LNK files](https://tzworks.net/download_links.php)
  - LNK files are actually in db structure in AutomaticDestinations



## Further Reading:

- <https://cyberforensicator.com/>
- [This Youtube Playlist](https://www.youtube.com/playlist?list=PLlY54XJEpOzyj8Dvqu8e78AcH6s5ZKmZM)
- [13Cubed](https://www.youtube.com/watch?v=VYROU-ZwZX8&t=2328s)
- [Shellbags](https://www.sans.org/reading-room/whitepapers/forensics/windows-shellbag-forensics-in-depth-34545)
- [Website that shows you all registry creations & modifications by application](http://greatis.com/pcapps/teamviewer/teamviewerforwindows-11-0-64630.html#rega)
