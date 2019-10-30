# Acquisition Tools

* osxpmem
	* https://ponderthebits.com/2017/02/osx-mac-memory-acquisition-and-analysis-using-osxpmem-and-volatility/
	* Use the 1.5.1 Furka Release that contains `osxpmemm-2.1.post4.zip`
	* `$wget https://github.com/google/rekall/releases/download/v1.5.1/osxpmem-2.1.post4.zip`
		* [Youtube of Sierra Acquisition with Volatility](https://www.youtube.com/watch?v=wmU3MlHZxg8)
	* https://isc.sans.edu/forums/diary/An+Introduction+to+Mac+memory+forensics/20989/
	* https://groups.google.com/forum/#!topic/rekall-discuss/fUvzOERzQMw
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
