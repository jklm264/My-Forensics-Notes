# BlackBag Presents: Spotlight and Keychain with Macquisition

- Can find in metadata:
	- Airdrop status
- In folders
	- kMDItemUserCount - don't rely on this exactly b/c 
	- ![image](/Users/unlikelyhacker/Downloads/image.png)
- .app folders
	- LRU count, date (and previous dates) [apparently time isn't exact with macquisition]
	- ![safari history item plist PER ITEM](/Users/unlikelyhacker/Downloads/image (1).png)

- User-Level Stores

- iOS Stores

![image-20200326141523911](/Users/unlikelyhacker/Library/Application Support/typora-user-images/image-20200326141523911.png)



## Spotlight

- can find text files, sometimes (according to speaker) that aren't there any more
- can also track spotlight search AS LONG AS YOU CLICK/HIT-ENTER on a result. So won't keep searches that doesn't find what they were looking for.
- can be found at: /Volumes/*/.Spotlight-V100
  - Time machine backups (not covered on MacQuisition)
- remember its on macOS and iOS
- more than just files; metadata (LRU, GPS, .app residue, 3-rd party apps have 3rd party metadata, etc) and delete files
- Store files are compressed with multiple compression algorithms, but not encrypted
- Files are ONLY encrypted if FDE is on. But even if FDE, if computer is live then collection will be unencrypted



## Keychain - with Joe Sylve

- Password management system

  - includes passwords, session keys, private keys, certificates

  ![image-20200326143105547](/Users/unlikelyhacker/Library/Application Support/typora-user-images/image-20200326143105547.png)

  - If one user auth's a wifi, then all users do too
  - parsing system keychain will unlock everything else

- built of common security services manager (CSSM) going back many versions. However deprecated in OSX10.7, most structures are still the same.

  - CSSM reference: <https://pubs.opengroup.org/onlinepubs/9629299/1_chap02.htm>

  - Record types:

    - ![image-20200326143512566](/Users/unlikelyhacker/Library/Application Support/typora-user-images/image-20200326143512566.png)
    - ![image-20200326143535043](/Users/unlikelyhacker/Library/Application Support/typora-user-images/image-20200326143535043.png)
      - Internet and Generic are best places to look
    - Information found in them aka **Attributes**:
      - Record names (Connonical)
      - Service names
      - Account names
      - Email addresses
      - Service Names
      - MAC times (unencrypted!)

  - Security 3DES-CBC with 192 bit key -- NIST deprecated this.

    - Each database has a Data Encryption Key, Data Signing Key, and a Master Key that encrypts the KeyBlob (DEK, DSK, Metadata)

    - User keys aren't stored on Disk, they are derived by User accont password

      - Note: If user changes password the derived key might not be the same. Uses PBKDF2-SHA1 w/ 1000 iterations do derive key. 

        - NIST recommends 10,000 iterations but they don't care. 

        - Per speaker, dictionary attack would work within hours

          

### Key Takeaways 

- ![image-20200326145222182](/Users/unlikelyhacker/Library/Application Support/typora-user-images/image-20200326145222182.png)
  - System keychain does not need a password, just on disk
  - MacOS only, not iOS.
  - Keychain files on Disk; can also be backed-up, copied, and moved (.keychain or .keychain-db)



# Disk Acquisition tools

- Cellebrite and rakeie

- <https://en.wikipedia.org/wiki/List_of_digital_forensics_tools>