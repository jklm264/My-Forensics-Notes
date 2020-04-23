# KAPE (Kroll Artifact Parser and Extractor)

![Kape](https://github.com/EricZimmerman/KapeFiles/blob/master/kapeLogo.png?raw=true)

## Working with KAPE

- When trying to access a network drive via cmd: `pushd \\vmware-host\Shared Folders`
- When viewing files in excel, start by freezing top row AND autofilter.
- With RECmd_Batch, in `Registry/\*.csv` check the **Deleted** column.
- With Amcache, in `ProgramExecution\*AssociatedFileEntires`, nice to see *what else* a program installed.
- With PECmd, check the `\*PECmd_Output{,_Timeline}.csv`
- In `EventLogs\EvtxECmd_Output.csv` you can find the correlated Computer Username ('@Name":"Username","#text":"<name>"') and User's SID ('@Name":"UserSid","#text":"S-1-5-21....') 
- Can run multiple targets/modules at once with comma seperated list.
- Should include [this RECmd_Batch_MC](https://github.com/EricZimmerman/RECmd/blob/master/BatchExamples/RECmd_Batch_MC.reb) for the RECmd Module.
  
  ## Useful Cmds
  
  ```
  C:>kape --mlist . # List KAPE's Modules
  C:>kape --tlist . # List KAPE's Targets
  C:>kape --sync    # Update KAPE's Targets and Modules from Github
  
  # Ran KAPE on WinToolTester for collection step
  C:>kape --tsource c --target !BasicCollection --tdest Z:\WinToolTester\KAPE_output 
  
  # Ran KAPE on Investigator machine after transfering collected files from VMware shared folder
  C:>kape --msource c:\Users\investigator\Desktop\KAPE_output\c --module !EZParser --mdest C:\Users\investigator\Desktop\KAPE_output\module.output 
```
