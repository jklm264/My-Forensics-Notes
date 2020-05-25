# Magnet Forensics: A Blessing in Disguise: How to Conduct Remote Mobile Acquisitions for Investigations & Preservation 5/25/20

Presenter: Tony Knutson 

- [Important Notes](#Summary)
- [Check Out Later](#Check-Out-Later)



## iOS

- Requires:
  - iTunes backup password
  - Phy access to the device plus passcode

- Can use `$rvictl` with mac as proxy

### JailBreak method

1. Presenter used [checkrain](https://checkrain.com/) exploit
2. Then ssh or can use Cyberduck for ease of viewing and exfil

### Non-Jailbreak method

- iOS cloud – pushed Magnet Axiom
- WhatsApp QR Extractor with [Oxygen](http://www.oxygen-forensic.com/en/)



## Android

- Requires:
  - Phy + passcode
  - Almost need to root the phone
  - In-Memory keys needed

- Multiple extractions may be needed
- Will notify vendor if phone has been rooted
- Airline and Hotel apps, in their db have a column will tell whether your phone is jailbroken or not

- use `$adb` for proxy without tethering (usually port 5555)
- Commercial Tool: [AirDroid](https://www.airdroid.com/)
- Android cloud – pushed Magnet Axiom

- many android apps are now encrypted



## Summary

- You can't remote into non-jailbroken iPhones

- Android, cannot be backed up locally natively AND `$adb` doesn't get you everything



## Workflow

- Make sure you have iTunes and have both regular and backup password
- Remote into machines with Magnet Cyber, F-Response, GRR, or Velociraptor
- If it takes too long, back up to company-approved cloud storage
- May need [Elcomsoft](https://www.elcomsoft.com/) to beat 6-digit verification or have owner on the phone at the time of entry



## Check Out Later

- Since checkra1n came out, [Mattia Epifani has blogged tons]( https://blog.digital-forensics.it/2019/12/checkra1n-era-ep-5-automating.html)
- Check out [MacOS tcc.db](https://eclecticlight.co/2018/11/20/what-does-the-tcc-compatibility-database-do/) with [github tool](https://github.com/jacobsalmela/tccutil)

