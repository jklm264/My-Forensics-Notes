# SpectreOps Keberoasting 4/8/20

[Slides (must re-register)](https://specterops.zoom.us/webinar/register/rec/WN_yGZkfss_TT-LtaorBx287Q?meetingId=_9xvJLj_9TtJQq_u-UHjcLZ4DJrJT6a81yEYq6YPz0v4uHzYCCC09aiI2brfV6LL&playId=7pMsf-D6p2g3T9XA4QSDU6V-W469Jvms1yFN-fUFz0-9VCYLYQGgbuQbYeoJXPVTqtWsf7MSy4K0_lpt&action=play&_x_zm_rtaid=vqaO1UqiRjuoPamf_6OFpQ.1586541569152.fd5ae7a5221d078dc55c7a9f50383f6f&_x_zm_rhtaid=264)

[Github](https://github.com/GhostPack/Rubeus)

[Check Out Later](#Check-Out-Later)



## Summary

- How it works
- msDS-SupportedEncryptionTypes
- Previous approaches (ex: proxy-net, powerUinternals)
- Building a better approach with Rubeus
- Defenses (and OPSEC)

 .

History: Attacking Kerberos: Kicking the Guard Dog of Hades (Tim Medin - Derbycon)



## How It Works

- The target service and the domain controller have to share some key so the service can decrypt the ticket. Usually its the Service Principal Names( SPNs) `computer$` account key/hash

- What if the PSN is registered for a user account? The user has admin privs.
  - We crack the key and forge any secret
  - **Any user can request a service ticket for any SPN (by design)**
  - Silver key/ticket - forging/rewriting the cracked ticket with some new details that benefit me as an attacker ([src](https://adsecurity.org/?p=2011))
  - if a user has a non-null servicePrincipalName property we can crack their password offline (w/ GPU software, hashcat)



- Service tickets (just like Ticket Granting Tickets (TGTs)) use AES25 or RC4/NTLM
  - AES was introduced in 2008 but for backwards compatibility RC4 has been kept
  - RC4 is easier/faster to crack
  - So we're looking at a downgrade attack
  - built-in methods for user-backed SPNs always have RC4
    - aka the TGT will return as RC4



## msDS-SupportedEncryptionTypes

- KDC uses this information (msDS-SupportedEncryptionTypes) while generating a service tickets for an account
- this will determine the encryption used
- Default value (0x1c -- RC4|AES) is set on *computer* accounts, not **user** or **trust** accounts will use (0x7 -- RC4)
  - Though, can explicitly set user accounts to AES (0x18 [*not the same as default value*])
- Why still do this? Because if an account/passwd was created in a 2003 product and hadn't changed their password since, Microsoft would beed it wouldn't stop it.



## Kerb Approaches

#### 1. External-In

- Need creds of existing domain accoutns to first get a TGT so service tickets can be requested (ex: Metasploit)
- But can granualarly controll all aspects of the exchange

#### 2. Domain-Joined Windows Host

- Dont need creds, just execution in a domain user's context



### Downsides of current approaches

Both would use setspn.exe or .NET's KerberosRequestorSecurityToken boy carving tickets out of memory (Mimikatz) or .Net (via PowerView)

- doing this will cache a ticket on the requesting machine for each SPN we roast (leaving a footprint). No beuno.



### New Approach

- We can request an outgoing service ticket request for a SPN on an unconstrained delegration server (the DC). This results in a delegated TGT for the current user being presetn in the AP-REQ in a way we can retrieve. 
  - TLDR: we can get a usable TGT for the current user without carving memory or touch LSASS.exe

- New Tool: Rubeus (get url)
  - using the tgtdeleg trick - thanks kiwi
  - so wont need current user's key/passowrd, avoids caching service tickets on the attacker-controlled host, and more



## Kerberoasting Defenses

- Long passwords and password vaulting solutions to rotate service account password
- Used to check for RC4 encryption but since it's (RC4 fallback) needed, just look for explicitly configured AES
- Detect anomalous service ticket request
  - Request tracking of all tickets -- a big data problem
  - Windows Log EventID is 4769 ([src](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventID=4769))
- Use a kerberoasting honeypot - [Talk](https://www.youtube.com/watch?v=yrMGRhyoyGs) by Sean Metcalf ([article](https://adsecurity.org/?p=3458))



## Defeating the Defenses

- You don't just Rubeus.exe Kerberoasting b/c of honeypots.
- Plan only necessary accounts. With Rubeous tool, can be passive with `C:// Rubeus.exe kerberoast /stats`
- Or just roast with passwords set before 



## Check Out Later

- [Attacking Kerberos: Kicking the Guard Dog of Hades (Tim Medin - Derbycon)](https://www.youtube.com/watch?v=PUyhlN-E5MU)
- Silver Key - https://adsecurity.org/?p=2011
