# Mac Tools
  
## Acquisition

- osxpmem
  - Make sure to copy the entire .app/ contents and then run `$sudo chown -R root:wheel osxpmem.app/` to give correct permissions.
    - Then run `$./osxpmem.app/osxpmem -o /tmp/<name of dump>.aff4`
  - Thanks Rekall working group!
  - [Google Group says not updated for a while](https://groups.google.com/forum/#!topic/rekall-discuss/fUvzOERzQMw)
  - [PondertheBits How-to osxpmem](https://ponderthebits.com/2017/02/osx-mac-memory-acquisition-and-analysis-using-osxpmem-and-volatility/)
    - Use the 1.5.1 Furka Release that contains `osxpmemm-2.1.post4.zip` OR
    - `$wget https://github.com/google/rekall/releases/download/v1.5.1/osxpmem-2.1.post4.zip`
    - [Youtube of Mac Sierra Acquisition with Volatility](https://www.youtube.com/watch?v=wmU3MlHZxg8)
    - [SANS ISC Rekall's osxpmem v2.0.1](https://isc.sans.edu/forums/diary/An+Introduction+to+Mac+memory+forensics/20989/)
- FTKImager
  - `$sudo dd if=/dev/rdisk1 | ./ftkimager - ~/Forensics/disk1_decrypted.raw` from [soruce](https://medium.com/@bromiley/imaging-with-apple-ftkimager-c529c174497a)
- Mandiant Mac Memoryze
  - ~~[Download - German link but trusted](https://www.fireeye.com/services/freeware/memoryze-for-the-mac.html)~~
  - [Fireeye Freeware Download link](https://www.fireeye.com/services/freeware/memoryze.html)
  - [Mandiant Memoryze Blog](https://digital-forensics.sans.org/blog/2010/11/08/digital-forensics-howto-memory-analysis-mandiant-memoryze)
- Mac Memory Reader - Download site is offline
  - Referer site: [https://digital-forensics.sans.org/blog/2011/01/28/mac-os-forensics-howto-simple-ram-acquisition-analysis-mac-memory-reader-part-1](https://digital-forensics.sans.org/blog/2011/01/28/mac-os-forensics-howto-simple-ram-acquisition-analysis-mac-memory-reader-part-1)
  - [~~Mac Memory Reader - Download site is offline~~](https://digital-forensics.sans.org/blog/2011/01/28/mac-os-forensics-howto-simple-ram-acquisition-analysis-mac-memory-reader-part-1)
- [Magnet Acquire](https://www.magnetforensics.com/resources/magnet-acquire/)
  - Only iOS or Android
- [Carbon Copy Cloner 5](https://bombich.com/)
  - Not sure how much I trust this but says it works with Catalina BUT not enough for ["forensics-level backup"](https://bombich.com/kb/ccc3/block-level-copy)
- *$$$ RECON Imager with Sumuri from Paladin (paid)[https://sumuri.com/software/paladin/]

## Live System Analysis

- [CrowdStrike AutoMacTC](https://github.com/CrowdStrike/automactc) - easy, amazing, love it!
- [OSXCollector](https://github.com/Yelp/osxcollector)
  - Does not default to */*, must specify -- even though docs say otherwise
  - This is built on other tools. For example, the autorun portion of the tool is really just taken from [osxautoruns.py](https://micksmix.wordpress.com/2011/06/29/mac-os-x-auto-run-locations/). Another example is [OSXAuditor](https://github.com/jipegit/OSXAuditor) (now deprecated in favor of this).
  - Just one massive json file that is very difficult to read.

## Host & Memory Analysis

- Mac_apt
- Volatility
- Rekall (@Google)  
- MacFUSE (@Google) - [https://code.google.com/archive/p/macfuse](https://code.google.com/archive/p/macfuse/)
- $$$ [Black Light](https://www.blackbagtech.com/products/blacklight/) 
- $$$ [X-Ways](https://www.x-ways.net/)

## Misc

- Best plist viewer: Apple's Property List Editor (native)
  - Other: [Plisteditpro](https://www.fatcatsoftware.com/plisteditpro/) 
- [Any tool from Jonathan Levin's site](newosxbook.com/tools)
- [otool (@Apple)](https://www.unix.com/man-page/osx/1/otool/)
- [jtool (@JLev)](http://www.newosxbook.com/tools/jtool.html)
- [Any Objective-See Tool](https://objective-see.com/products.html)
- [OSquery](https://github.com/osquery/osquery)
- [otool](https://github.com/gdbinit/otool-ng)
- $$$ [Black Bag free tools](https://www.blackbagtech.com/resources/free-tools/) are that useful

> "We recommend using Mac Memory Reader from ATC-NY, Mac Memoryze, or OSXPmem for this purpose. Remember to check the list of supported OS versions for each tool before using them. [Src](https://github.com/volatilityfoundation/volatility/wiki/Mac)" - AoMF

