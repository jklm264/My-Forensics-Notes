# SpecterOps: Everything You Always Wanted to Know about BloodHound 4/7/20

- [Github](https://github.com/BloodHoundAD/BloodHound)
- [Important Note](#Note)
- [Check out for later](#Check-out-later)

## What is Bloodhound

- BloodHound, written in Javascript, uses graph theory to reveal the hidden and often unintended relationships within an Active Directory environment.  ([the wiki](https://github.com/BloodHoundAD/Bloodhound/wiki))
- There is also SharpHound which is built on top on Windows-**native** _C#_ APIs
  - LDAP use _System.DirectoryServices.Protocols_ namespace to get info from a Domain Controller (DC)
- Note: Sharphound is a C# Rewrite of the BloodHound Ingestor



## Under the Hood

![image (SpecterOps_Bloodhound4:7.assets/image%20(4).png)](linkuriouslogic.png)

- During [Linkurious](https://linkurio.us/) calculating layout, GPU rendering



- Runas /netwonly -- allows you to auth as a different user. The flag auth's you as a different user for ONLY networked purposes
- '\\' is called a _back-whack_ (lol)



## Note

**This tool will get flagged by AV**

To avoid:

- change source code to change hash
- run in memory only



## Check out later

- [hunting from home (previous talk)](https://twitter.com/SpecterOps/status/1247261956161048581)
- [BadBlood - Tool that fills a domain](https://github.com/davidprowe/BadBlood)
  - [Instructions to build BadBlood with vmWare](https://medium.com/@vartaisecurity/lab-building-guide-virtual-active-directory-5f0d0c8eb907)
- [Active Directory - Workgroup vs Domain](https://www.techtron.co.za/domains-vs-workgroups/) 
