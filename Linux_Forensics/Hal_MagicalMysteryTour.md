# Hal Pomeranz Blackhills Webinar

Around 54 min mark he does a live demo for deleted data in multiple blocks.



hrpomeranz@gmail.com / @hal_pomeranz
"strict" atime updates - last time a program was run
- every file read is actually a write for journaling, makes fs very inefficient and many stopped this (Win7 NTFS atime updates aren't a thing by default)

- However on Linux did something wierd. It did "relative atime updates".
  - Will update if file is being access and atime is more than 24 hours old **OR** atime is earlier than mtime or ctime
    - $ stat /sbin/<executable> #init atime check
    - $ /sbin/<executable>
    - $ stat /sbin/<executable> #see atime change
    - $ /sbin/<executable>
    - $ stat /sbin/<executable> #atime will be the same
  - This resulted in atime to now indicate *first use*, rather than *last use*
  
  
  
  ## Analyze Directory Forensically
  
  Ext4 directories are unsorted lists of records:
  
  - 4B inode numbeer
  - 2B (4B aligned) entry length - how long, including inode number (4B)
  - 1B file name length
  - 1B file type
    - If 1, regular file
    - If 2, directory
  - File name
  
  ### Steps
  
  1. Make test directory: `$touch these aree some new files`
  2. Find inode number of directory: `$ls -id .`
  3. Use TSK to see directory via its inode: `$icat /dev/sdb1 <inode> | xxd | head`



- Directory slack space is still a thing

## Deleting a File

The record before the deleted one will grow to consume the space of the record that was just deleted.

- Previous directory entry's legntth field is increased.
- This means though that file type, inode number, etc. still exist plainly via running `$icat` again!

Until space in that directory is reused, that recently deleted data will persist.

**This is up until Ext2!**

Then came along Ext3 where all the extent information is zeroed out (except the inode)



## File Allocation

### Math

- Unix uses Blocks organized into 32Kb block groups

- Each block contains inodes (metadata) and data blocks
- Each block/inode bitmap is 1 block - default block size is 4Kb; hence you can track 32K blocks with a single 4Kb bitmap (4*8bits=32)
- 1 inode to every 4 data nodes. So there are 16 inodes/ data node so you need 512 blocks for the 32k block in a block group



### Allocation Strategy

- based on least used block group. Until that block group filles up all new files are added to same block group as directory.
- If a directory outgrows a single group block they fragment!



1. Use directory entry to determine inode of deleted file
2. Determine block group number from inode number
3. search block group unallocated space for deteled data
4. $Profit$