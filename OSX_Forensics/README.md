# TLDR
**At the moment, I cannot find any acqusition tools which work on Mojave, or Catalina**
* The trusted tools are OSXpmem and [Macquisition(paid)](https://www.blackbagtech.com/products/macquisition/) for acquisition


# OSX vs MacOS
If you want to get technical, the answer is [yes](https://www.quora.com/Are-there-differences-between-macOS-and-OS-X):

* macOS describes the Apple operating system designed to run on Apple laptop and desktop computers starting with version numbers 10.12 and later.
* OS X describes the Apple operating system designed to run on Apple laptop and desktop computers starting with version number 10.8 through 10.11.

![macversions.png](macversions.png)
# Acquisition Tools

* osxpmem
	* https://ponderthebits.com/2017/02/osx-mac-memory-acquisition-and-analysis-using-osxpmem-and-volatility/
	* Use the 1.5.1 Furka Release that contains `osxpmemm-2.1.post4.zip`
	* `$wget https://github.com/google/rekall/releases/download/v1.5.1/osxpmem-2.1.post4.zip`
		* [Youtube of Sierra Acquisition with Volatility](https://www.youtube.com/watch?v=wmU3MlHZxg8)
* [Carbon Copy Cloner 5](https://bombich.com/)
	* Not sure how much I trust this but says it works with Catalina BUT not enough for ["forensics-level backup"](https://bombich.com/kb/ccc3/block-level-copy)
* FTKImager (free)
	* `$sudo dd if=/dev/rdisk1 | ./ftkimager - ~/Forensics/disk1_decrypted.raw` from [soruce](https://medium.com/@bromiley/imaging-with-apple-ftkimager-c529c174497a)
	* [**NOTE**](https://accessdata.com/product-download): Last release is for 10.5 & 10.6 ({Snow, } Leopard)
* RECON Imager with Sumuri from Paladin (paid)[https://sumuri.com/software/paladin/]

## Recommendations by Art of Memory Forensics (page 781)
* Mac Memory Reader
* Mac Memoryze
	* ~~[Download - German link but trusted](https://www.fireeye.com/services/freeware/memoryze-for-the-mac.html)~~
	* [Download](https://www.fireeye.com/services/freeware/memoryze.html) -- **Up Next**
	* https://digital-forensics.sans.org/blog/2010/11/08/digital-forensics-howto-memory-analysis-mandiant-memoryze
	* https://digital-forensics.sans.org/blog/2010/11/02/digital-forensics-time-stamp-manipulation/
* OSXpmem
	
# Active Development

* [Mac_apt](https://github.com/ydkhatri/mac_apt) -- **Up Next**
	* *"So far, we've tested this on OSX 10.9 (Mavericks) through 10.14 (Mojave)."* - [Src](https://github.com/ydkhatri/mac_apt/wiki)
* [OSquery](https://github.com/osquery/osquery) -- **Up Next**
* [Plisteditpro](https://www.fatcatsoftware.com/plisteditpro/) -- **Up Next**
* [Any tool from Jonathan Levin's site](newosxbook.com/tools) -- **Up Next**
* [otool (@Apple)](https://www.unix.com/man-page/osx/1/otool/)
* [jtool (@JLev)](http://www.newosxbook.com/tools/jtool.html) -- **Up Next**

# List of Forensics tools no longer being maintained for OSX

* Volatility
* osxpmem - https://groups.google.com/forum/#!topic/rekall-discuss/fUvzOERzQMw
* Rekall (@Google)  
* MacFUSE (@Google) - https://code.google.com/archive/p/macfuse/
* Mac Memory Reader - Download site is offline
	* https://digital-forensics.sans.org/blog/2011/01/28/mac-os-forensics-howto-simple-ram-acquisition-analysis-mac-memory-reader-part-1

* otool [https://github.com/gdbinit/otool-ng]

# Misc Links
* https://www.mac4n6.com/blog/2018/8/5/knowledge-is-power-using-the-knowledgecdb-database-on-macos-and-ios-to-determine-precise-user-and-application-usage
* https://posts.specterops.io/hunting-for-bad-apples-part-1-22ef2b44c0aa
