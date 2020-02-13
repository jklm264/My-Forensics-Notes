#  Black Hills Webcast (2/13) -  OSINT
#osint
## Info
- Hunt Team Operations Center

## Intro
Company info on the internet: Organization history, employees pii, leadership, technologies, security, partners/vendors/clients
- **Hr is your friend**: consider them the SME of the company’s social media
- [Grey literature - Wikipedia](https://en.wikipedia.org/wiki/Grey_literature)
* Exifdata of leaderships pictures 
* BeenVerified is great but costly

## Sources
![](sources.png)
￼￼
## Google search results
![](googlesearch.png)

## Cert transparency 
* SSLMate on GitHub -  _SSLMate/certspotter_
* for enumeration
* DNSTwister tool

### More Recon
- HackerTarget.com is online tools
	- Part of it: Dnsdumper is great for enumeration via api
- MXToolbox - mail loops, does anything go down or up?
	- has api
- url crazy - does typo squatting well
- monster, Glassdoor, etc 
- Facebook, twitter, instagram, vin numbers on carmax, reddit
	- Hashtags: #ciscosystems, #nicebadge, #workplace
- Hunter.io for email addresses
	- has api calls
- Even haveibeenpwnd.com with domain monitoring
* Re-active SPF Auto-Recon
	* sending emails not from internal domain
	* github.com/Relkci/AutoSPFRecon
		* [Offensive SPF: How to Automate Anti-Phishing Reconnaissance Using Sender Policy Framework - Black Hills Information Security](https://www.blackhillsinfosec.com/offensive-spf-how-to-automate-anti-phishing-reconnaissance-using-sender-policy-framework/)
		* DMARC forensic report
* Grayhatwarefare - allows you to search Amazon S3 Buckets
* LinkedINT and Peasant
	* point peasant to cookie file
* Twitter scraper
	* github.com/twintproject/twint


## Questions
* how do osint tools , how do they parse data or just apis? APIs :) 
- ![](myQ.png)
