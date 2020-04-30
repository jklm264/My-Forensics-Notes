# USB (Universal Serial Bus) Notes

- Some of the keys start `9&` which as I understand means that they did not have a readable VSN so the computer generated an ID for them but the others look like hex strings and end in either $0 or $1 they're just too long. [Src](https://www.forensicmag.com/article/2012/08/windows-7-registry-forensics-part-6)

- USB Key phrase = "USB Mass **Storage Device**", else it might just be a peripheral device like mouse, keyboard, etc.
- Remember CurrentControlSet is for **current** (not previous, like 001, 002, etc.) peripherals and storage devices that are plugged into the machine.
- USBStor will only show for those that are “currently” (volatile) plugged in



## Step-by-step


- `%ControlSet%\ENum\USBSTOR\%DEVICE_NAME%\%SerialNumber%`
- CurrentControlSet will only show on live system or vmem capture
  - ...\CurrentControlSet\\...\USBStor

1. Device serial number: 

   - If '&' at end of string means can be found in an online lookup table somewhere. Though, if '&' in second charecter means EOM didn't follow MS's instructions and WinOS assigned the device its own random serial number
   - Wil find LastWrite Timestamp in UTC

2. `SYSTEM\CurrentControlSet\Enum\USB`
   - Will find VID & PID
   - VID & PID should match a lookup of the Serial Number

3. `SOFTWARE\Microsoft\Windows Portable Devices\Devices\%SerialNumber%`
   - Will find *FreindlyName*
   - Can also confirm LastWriteTime

4. `SYSTEM\MountedDevices\`

   - Will find Drive Letter and Volume GUID
   - Looking for GUID (WinOS given) here by matching the SerialNumber in the dot-seperated entries
   - Would be ?\\Volume

5. `SOFTWARE\Microsoft\Windows NT\CurrentVersion\EMDMgmt`

   - Will find the Volume Serial Number
   - Only present if device is **not** an SSD
   - something about ReadyBoost in Win Vista

6. `NTUSER.dat\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2`

   - Will find first time and last time device connected, and removal time.
   - Use Volume Serial Number to correlate.
   - Does anyone know what happned to MountPoints1?

7. `SYSTEM\%CurrentControlSet%\Enum\USBSTOR\Ven_Prod_Version\USB iSerial #\Properties\GUID\Properties`

   - 0064 - Will find first install (Win7/8) :: also found in setupapi.dev.log (Vista+)
   - 0066 - Will find Last Connected (Win8+) :: also found in \enum\USB\VID last writetime and \mountpoint2\GUID
   - 0067 - Last Removal (Win8+)




## Other Sources

- [HatsOffSecurity USB Security](https://hatsoffsecurity.com/2014/06/07/usb-forensics-pt-2-vendor-id-vid-product-id-pid/)
- [Niresoft's tool](https://www.nirsoft.net/utils/usb_devices_view.html)
- [SANS USB Checklist](https://blogs.sans.org/computer-forensics/files/2009/09/USBKEY-Guide.pdf)
