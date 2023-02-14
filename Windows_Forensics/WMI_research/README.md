# WMI Research

[AntiForensics Binding Scripts](AntiForensics)

## WMI vs CIM Differences

CIM should be used for PowerShell7+

```PowerShell
#When using WMI commandlets
Set-WMIObject -Namespace -Classname
#When using CIM commandlets
Get-CimInstance -Namespace -Class
```

## Helpful WMI commands to run for defenders

```PowerShell
wmic process where "name='<proc_name>'" get parentprocessid,commandline,executablepath /format:list

wmic service get name,processid,pathname,state,installdate /format:list

wmic computersystem get name

wmic startup get /format:list
```

Thanks:
- <https://adamtheautomator.com/your-goto-guide-for-working-with-windows-wmi-events-and-powershell/>
- <https://www.netspi.com/blog/technical/adversary-simulation/getting-started-wmi-weaponization-part-5/>
