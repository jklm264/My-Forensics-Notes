# Email Analysis

**Mail User Agent (MUA)** - Ex: Apple Mail, Msft Outlook

**Mail Transfer Agent (MTA)** - Accepts messages and routes along to their destinations per domain. Ex: Postfix or Msft Exchange. Protocols: POP3 allowed MUA to communicate to MTA; replaced with iMAP (internet message protocol) b/c mail can remain on server- allows for consistency between different devices with same account.

Mail Delivery Agent (MDA) - responsible for final delivery of mail from MTA to MUA.

Send Policy Framework (SPF) - Defines specify server(s) which are allowed to send mail on behalf of that domain that is published via DNS TXT record. 

DomainKeys Identified Mail (DKIM) - crypto to verify mail to domain



Tool: [Email Header by Richard Davis for Sublime3](https://packagecontrol.io/packages/Email%20Header)

- Need a `.eml`



X-<headers> are experimental

- spam, auth, tracking, etc

- *X-Originating-IP* - IP email was sent from



**DMARC** combines DKIM and SPF with an action.



## Forensics

1. See bottom-most recv'd header - then go up
   1. To drill on domains can do `$dig @1.1.1.1 rosepointeapartments.com mx #shows mail-exchange records`
2. Then check *recv'd-spf* info
   1. To drill down `$dig @1.1.1.1 domain txt +short`
   2. Also check the dkim value=
3. Return-path
4. X-headers -> X-originating-ip OR x-originating-domains