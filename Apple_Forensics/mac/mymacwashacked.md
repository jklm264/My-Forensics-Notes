# "jklm264, I think my Mac was hacked what can I do?"

### Indicators of Compromise (Chrome):

- too many ads/pop-ups/alert boxes
- too many notifications

### Easy things to check that don't require downloads:

- Check Users & Groups *Login Items*
- Make sure SIP is on via: `$csrutil status`
- Check StartUp Programs ([Yelp's OSXCollector](https://github.com/Yelp/osxcollector) and [Yonts Malicious Streams](http://www.malicious-streams.com/article/Mac_OSX_Startup.pdf)) all used by *launchd*
  - `/System/Library/LaunchAgents/`
  - `/System/Library/LaunchDaemons/`
  - `/Library/LaunchAgents/`
  - `~/Library/LaunchAgents/`
  - `/Library/LaunchDaemons/`
  - `/System/Library/ScriptingAdditions/`
  - `/Library/ScriptingAdditions/`
  - `/System/Library/StartupItems/`
  - `/Library/StartupItems/`
  - `~/Library/Preferences/com.apple.loginitems.plist`
  - `/Library/Preferences/com.apple.loginwindow.plist` -  set to launch at user login. Also serves as backend to GUI *Login Items* tab in System Preferences.
  - `~/Library/Preferences/loginwindow.plist`
- Check Security & Privacy allowed apps
	- Make sure firewall is turned on
- [Thomas Reed's Adware Removal Guide (from Malwarebytes)](https://www.thesafemac.com/arg/)
- Check if the log files or `.bash_history` are missing
- `.bash_history`

### FREE software to download to survey and remove any bad stuff:

- Malwarebytes
- [Ransomwhere](https://objective-see.com/products/ransomwhere.html)
- [TaskExplorer](https://objective-see.com/products/taskexplorer.html)

### FREE software to download to protect you from here on out:

- LuLu Firewall (and other Patrick Wardle/Objective-See [products](https://objective-see.com/products.html))
- Turn on Firewall
- Turn on Full Disk Encryption
- Another firewall: [LittleSnitch](https://obdev.at/products/littlesnitch/index.html)

## If too many notifications from Chrome:

1. Check chrome extensions via browser address bar --> `chrome://extensions/`
2. Check notification statuses and block those that seem to be giving you problems via browser bar --> `chrome://settings/content/notifications`

## Final Warning
Never blindly copy-paste code/commands

<br /> 
<br /> 
<br /> 
<br /> 

*This was written up in response to reddit question: "Stalkerware for iOS" in r/Computerforensics*
