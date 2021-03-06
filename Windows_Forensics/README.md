# Windows Forensics

- [My Notes: Windows Beginnings (Easy to check registry locations)](Windows_Beginnings.md)
- [My Windows Forensics Cheat Sheet](myWindowsForensicsCheatSheet.xlsx) - artifacts and traige order
- [Active Directory](active_directory)
- [Kerberoasting (SpectreOps 4/8/20)](SpectreOps_Keberoasting.md)
- [My USB Info](USB_info.md)
- [The Windows Tools and Artifacts: "The Definative Compendium"](https://aboutdfir.com/toolsandartifacts/windows/) and [DB of Windows Artifacts Github LINK](https://github.com/ForensicArtifacts/artifacts/blob/master/docs/Artifacts%20definition%20format%20and%20style%20guide.asciidoc)
- [5/22/20 Magnet Forensics: Emoting Over Emotet and Maldoc](EmotingMaldoc.md)  - Lots of step-by-steps using tools to analyze different types of malicious docs. Check out [Malwareoverview](https://github.com/alexandreborges/malwoverview), Didier Stevens' [Blog](https://blog.didierstevens.com/) and [Tools Suite](https://github.com/DidierStevens/DidierStevensSuite), and [Lazy Office Analyzer](https://github.com/tehsyntx/loffice).  
- [5/28/20 Magnet Forensics: Creating a Digital Forensic Workflow to Combat Data Exfiltration](DFWorkflow.md) - Unique look on DF investigation. **USB (Case 3)** and **Final Workflow** are the highlights.
- [9/2020 GRIMMCon0x2: How to Build a SOC](GRIMMCon0x2.md)

## Tools and Scripts

- [Windows Registry lookup bash script](windowsplus.sh)

## Practice Drives

- <https://www.forensicfocus.com/challenges-and-images/>
- <https://www.cfreds.nist.gov/>

## Virtualization Hints

From VMware to Vbox: `ovftool “C:\Users\NAME\Documents\Virtual Machines\Windows 7 x64\Windows 7 x64.vmx” C:\Users\NAME\export.ovf`
