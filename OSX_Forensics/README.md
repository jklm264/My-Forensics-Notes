# TLDR
**At the moment, I cannot find any forensic ACQUISITION tools which work on Mojave, or Catalina**
* The trusted tools are OSXpmem and [Macquisition(paid)](https://www.blackbagtech.com/products/macquisition/) for acquisition
* Take another look at [GRR](https://github.com/google/grr) with [osquery](https://github.com/osquery/osquery) for analysis

# OSX vs MacOS Difference
[Yes](https://www.quora.com/Are-there-differences-between-macOS-and-OS-X):

* macOS describes the Apple operating system designed to run on Apple laptop and desktop computers starting with version numbers 10.12 and later.
* OS X describes the Apple operating system designed to run on Apple laptop and desktop computers starting with version number 10.8 through 10.11.

![macversions.png](macversions.png)

# Mac Internals

- See [here](MacInternals.md)

#### Internals Links

* [**2018**:Testing Memory Forensics Tools for the Macintosh
OS X Operating System](https://commons.erau.edu/cgi/viewcontent.cgi?article=1491&context=jdfsl)
* [A paper on Mac Forensics](https://commons.erau.edu/cgi/viewcontent.cgi?article=1491&context=jdfsl)


# Mac Security
--

### Acquisition Tools
- See [here](Acquisition_Tools.md)
	
#### Active Development
* [Mac_apt](https://github.com/ydkhatri/mac_apt) -- *"So far, we've tested this on OSX 10.9 (Mavericks) through 10.14 (Mojave)."* [(Src](https://github.com/ydkhatri/mac_apt/wiki)
* [OSquery](https://github.com/osquery/osquery)
* [Plisteditpro](https://www.fatcatsoftware.com/plisteditpro/) 
* [Any tool from Jonathan Levin's site](newosxbook.com/tools)
* [otool (@Apple)](https://www.unix.com/man-page/osx/1/otool/)
* [jtool (@JLev)](http://www.newosxbook.com/tools/jtool.html)
* [Black Light](https://www.blackbagtech.com/products/blacklight/) -- Great tool but very expensive
* [X-Ways](https://www.x-ways.net/) -- Not free
* [OS X Collector - github!](https://github.com/Yelp/osxcollector)

##### List of Forensics tools no longer being maintained for OSX
* Volatility
* osxpmem - [https://groups.google.com/forum/#!topic/rekall-discuss/fUvzOERzQMw](https://groups.google.com/forum/#!topic/rekall-discuss/fUvzOERzQMw)
* Rekall (@Google)  
* MacFUSE (@Google) - [https://code.google.com/archive/p/macfuse](https://code.google.com/archive/p/macfuse/)
* Mac Memory Reader - Download site is offline
	* [https://digital-forensics.sans.org/blog/2011/01/28/mac-os-forensics-howto-simple-ram-acquisition-analysis-mac-memory-reader-part-1](https://digital-forensics.sans.org/blog/2011/01/28/mac-os-forensics-howto-simple-ram-acquisition-analysis-mac-memory-reader-part-1)
* otool - [https://github.com/gdbinit/otool-ng](https://github.com/gdbinit/otool-ng)

### Mac Hacking

- My Mac was hacked, [now what](mymacwashacked.md)?

### Security Videos

- [Patrick Wardle - Fire and Ice Making and Breaking macOS Firewalls](https://www.youtube.com/watch?v=UlT5KFTMn2k)
- [DEF CON 25 - Patrick Wardle - Offensive Malware Analysis: Dissecting OSX FruitFly
](https://www.youtube.com/watch?v=q7VZtCUphgg&t=1s)
- [Patrick Wardle - Harnessing Weapons of Mac Destruction - DEF CON 27 Conference
](https://www.youtube.com/watch?v=InL3YA_6P6s)
- [301 Black Box Mac OSX Forensics Brian Martin - start at ~27m](https://www.youtube.com/watch?v=AG72W_LVidI)

### Security Links

* [https://www.mac4n6.com/blog/2018/8/5/knowledge-is-power-using-the-knowledgecdb-database-on-macos-and-ios-to-determine-precise-user-and-application-usage](https://www.mac4n6.com/blog/2018/8/5/knowledge-is-power-using-the-knowledgecdb-database-on-macos-and-ios-to-determine-precise-user-and-application-usage)
* [https://posts.specterops.io/hunting-for-bad-apples-part-1-22ef2b44c0aa](https://posts.specterops.io/hunting-for-bad-apples-part-1-22ef2b44c0aa)
* [https://medium.com/dfir-dudes/mac-forensics-no-one-said-it-would-be-easy-8bf2f5e4956c](https://medium.com/dfir-dudes/mac-forensics-no-one-said-it-would-be-easy-8bf2f5e4956c)

## Community Forums
* BlackBag - need to be paid member
* Reddit: [r/osx](https://www.reddit.com/r/osx/), [r/dfir](https://www.reddit.com/r/dfir/), [r/Computer Forensics](https://www.reddit.com/r/computerforensics/)
* www.dfir.training

## Everyday Tools
See [here](everyday_tools.md)
