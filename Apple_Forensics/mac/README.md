# Apple Mac Notes

[My Mac Was Hacked](mymacwashacked.md)


## Thing to Look into Next

- [ ] Take another look at [GRR](https://github.com/google/grr) with [osquery](https://github.com/osquery/osquery) for analysis
- [ ] Mac\_apt, and other acquisition tools

## Mac Internals

- [Art of Memory Forensics Notes](AoMF_Mac.md)
- [Jonathan Levin's Mac Internals Book](MacInternals.md)
- [Clipboard Hacking Notes](Clipboard.md)
- [BlackBag Spotlight and Keychain Deep Dive 3/26/20](BlackBag_SpotlightAndKeychain.md)
  - Metadata 'item-use count' is a thing. In spotlight you can find deleted files, successful searches, and more. These can be found in `/Volumes/*/Spotlight-V100` compressed. The common security services manager Keychain can be found at `/Library/Keychains` with the SystemKey (when needing system access).
- [BlackBag New Catalina Artifacts 4/9/20](BlackBag_CatalinaArtifacts.md)
  - There are many new artifacts that have just been added to Catalina version. First, the changes made were that all 32-bit app support was dropped, there is stricter code signing requirements, and there are now seperated System and Data Volume Groups. The new features include APFS containers as well as pooled storage, the idea of Firmlinks, relocated items directory, sidecar (and it's [meta]data), and less informational unified logs.
- [BlackBag iCloud File Sharing 4/30/20](BlackBag_iCloudFS_sharing.md)
  - iCloud locations are in `MobileDocumets/`and access to this data can be used for a variety of purposes.
- [5/20/20 macOS Forensics: The Next Level - Taming the T2 Chip & More](TamingtheT2Chip.md) - T2 chip only encrypts APFS volumes. Check out [Mac_apt](https://github.com/ydkhatri/mac_apt) and the [presenter's github](https://github.com/ydkhatri/MacForensics)
- [5/21/20 Take a byte! Exploring Apple's MacOS Operating System Artifacts](ExploringMacOSArtifacts.md) - How to image a Catalina Mac, KnowledgeC.db, USB, and Airdrop.

## Tools

- [Tool List](ActiveDev.md)

## Talks

- [Patrick Wardle - Fire and Ice Making and Breaking macOS Firewalls](https://www.youtube.com/watch?v=UlT5KFTMn2k)
- [DEF CON 25 - Patrick Wardle - Offensive Malware Analysis: Dissecting OSX FruitFly](https://www.youtube.com/watch?v=q7VZtCUphgg&t=1s)
- [Patrick Wardle - Harnessing Weapons of Mac Destruction - DEF CON 27 Conference](https://www.youtube.com/watch?v=InL3YA_6P6s)
- [301 Black Box Mac OSX Forensics Brian Martin - start at ~27m](https://www.youtube.com/watch?v=AG72W_LVidI)

## Links

- [Gatekeeper Link](http://www.theinstructional.com/guides/gatekeeper-fundamentals-part-2)
* [Determine Precise User and Application Usage](https://www.mac4n6.com/blog/2018/8/5/knowledge-is-power-using-the-knowledgecdb-database-on-macos-and-ios-to-determine-precise-user-and-application-usage)
* [SpecterOps: Hunting for Bad Apples via Launch Daemon](https://posts.specterops.io/hunting-for-bad-apples-part-1-22ef2b44c0aa)
* [Mac and Mac-Apt Basics](https://medium.com/dfir-dudes/mac-forensics-no-one-said-it-would-be-easy-8bf2f5e4956c)
* [White Paper **2018**:Testing Memory Forensics Tools for the Macintosh
  OS X Operating System](https://commons.erau.edu/cgi/viewcontent.cgi?article=1491&context=jdfsl)
* www.dfir.training (great forum too)


## Mac OS X vs OS X vs macOS Difference

- Mac OS was 2001 - 2011 <img src="Mac_README.assets/macversions.png" height=380 align="right" />

- OS X was 2012 - 2015
- macOS is 2016 - present
