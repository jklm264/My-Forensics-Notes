# SPLUNK

The following notes are from the Fundamentals Part 1 course.

There is a section [at the bottom](#Post-Exam) for other splunk notes.

## 1. Machine Data (Monster)

- 90% of todays data
- aka Mr. Big is all the data which can give insights
	- data can be voicemails, emails, or other logs
- Pinpoint, correlate, and alert - thnx splunk
- An intelligent, searchable index

## 2. What is SPLUNK

### Components

1. Index Data
	- Collects data from any source
	- raw machine data enters this to decide how to process. It will then label as a source type which will then be labeled and finally stored in the index to be later on searched for.
2. Search & Investigate
	- Enter query in search bar using SPLUNK language
3. Add Knowledge
	- Affects how data is interpretted
	- Gives classification (e.g. shirt), add enrichment (e.g. US Sales), normalize it, and save for future use
4. Monitor & Alert
	- identify issues and attacks automatically with responses (email alerts)
5. Report & Analyze
	- dashboards

### 3 Main components

1. Indexer - process incoming data. Creates files in directories by age. Search by time is very important.
2. Search Head - Allows users to use SPLUNK search language which send the request to the indexers to actually perform the search. The Head's then enrich the data. Includes functions to create dashboards, reports, and visualizaitons.
3. Forwarders - SPLUNK instances that forward data to indexers for processing. Ex: Install forwarder on Webserver in organization (think end point). FOrwarders serve as the primary way data is supplied for indexing.

### How it scales

- Single Instance = input, parsing, indexing, and searching
- Full Distributed Infrastructure 

## 3. Installing Splunk

- Can be done on Windows, Mac, Linux, and Cloud

- Apps - workspace built to solve a specific use-case. Home and 'Search and Reporting App'
  - To find more apps: https://splunkbase.splunk.com/

**peanuts : Sn00p3e#**

#### 3 roles

1. Admin - Can install apps, and create knowledge objects for all users.
2. Power - Can create and share knowledge objects for users of an app and do real time searches.
3. User - Can only see own knowledge objects and those shared with them



## 4. Getting Data In

### Types of Input

- Adding data is done by the Admin user for the deployment.
  1. Upload - good for data that will never change. Searching small data set that doesn't need to be updated
     - **Sourcetype** is the type of data being ingested via the Indexer
     - App context - tells splunk which app to apply the Sourcetype to
     - Host Name should be the machine that the data was taken from
     - Indexes are directories where data is stored. Should use multiple indexes. 
       - Retention policies
  2. Monitor - specific known data (e.g. evtx logs in Windows)
     - Continuously monitoring
     - Can whitelist/blacklist files
  3. Forward
     - Out of scope of this course!



## 5. Basic Searching

- can create knowledge objects, data, or reports

- host is host name, fully qualified domain name, or IP
- source is file or directory path, port, or script from which the event originated
- source type is classification of data

### Using the search bar

`> failed`

- Limiting a search by time is a best practiced recommended. 

- **Transforming Commands** are commands that create statics and visualizations (data tables)

- By default, a search job will remain active for 10 minutes after it has been run. Then Splunk will need to run the job again
  - Shared search jobs will remain active for 7 days
- Search modes
  - Fast - cuts down on info returned, field discovery is disabled (so only default fields)
  - Smart - toggles behavior based on query
  - Verbose - returns as much as possible

- Zoom links
  - Zoom out is only time when SPLUNK needs to rerun the search

### Events

- Timezone is that set in the user account on Splunk, very helpful!
- Kleene Star (*), And/or/not (bool operations; not, or, then and) can all be used
- Use backslash as escape char



## 6. Using Fields

- Selected vs Interesting
  - interesting have at least 20% of values in events
- alpha - string value
- \# - numeral

- Quick reports creates a "Transforming search"

### Searching Fields

- By sourcetype: `sourcetype=linux_secure`
  - field names are case sentitive, values are not. E.g. `FieldName=values`
- = or != can be used for numerical or string values. Else can just be used with numerical, duh.
  - Ex: `sourcetype=linux_secure action=failure NOT (host=mail* OR host=www1)`
  - NOT and != will retrieve different results. Thanks discrete math!
- `IN` value can be used too.
  - Instead of `index=web (status=500 OR status=503 OR status=505)`, can do `index=web status IN ("500","503","505")`



## 7. Best Practices

- Time to limit is most efficient - the less data you have to search, the faster it will go
  - Relative, ranges, realtime (E.g. 10 min ago will add/remove)
    - Customize time range under advance tab
    - `mon` for months, `m` for minutes
    - `@` round down to nearest unit
    - `earliest` and `latests` are great field names
- THEN index, source, host, Sourcetype - these fields are extracted at index time
  - indexes - where SPLUNK stores event data for searching. Multiple indexes should be used.
- The more you search for the better your search will be: E.g. instead of password, search failed password
- inclusion > exclusion
  - E.g. "access denied" > "Not access granted"
- Filter early limits number of events



## 8. SPL Fundamentals

1. Search Terms - see section 6/7
2. Commands - what we want to do with search results (e.g. make charts, computing stats, formating)
3. Functions - how we want to chart, compute, and evaluate results
4. Arguments - variables we want to apply to function
5. Clauses - how we want results groups or defined

![image-20200324141934328](/home/papapeanut/.config/Typora/typora-user-images/image-20200324141934328.png)

### Visual Pipeline

- boolean operators and command modifiers in ORANGE
- commands in BLUE
- args in GREEN
- functions in PURPLE
- ctl+\ is hotkey to newline
  - can customize more in SPL editor in preferences

### Limits

- reads from disk and makes a copy from memory -- like a normal computer operates
  - once removed from memory, no longer available to search for (without running new query)

### Fields cmd

- Basic field search = `index=web sourcetype=access_combined | fields status clientip`
  - Will return on events status and ip
  - Use `-` to remove fields from results
- Field extraction is one of the most costly parts of search
  - Field inclusion happens BEFORE extractions so improved performance.
  - Since exclusion happens AFTER field extraction, no performance hit (improve or impair) will occur

### Table cmd

- returns data in tabulated format
- Ex: `index=web sourcetype=access* status=200 productname=* | table  JSESSIONID, product_name, price`
  - column header is field name

### Rename cmd

- renames field
- Ex: `index=web sourcetype=access* status=200 productname=* | table  JSESSIONID, product_name, price | rename JSESSIONID as "User Session" product_name as Item`
  - Phrases need quotation marks
  - if changed, further down pipeline the 'AS $name' will have to be used in next use identifiers

### Dedup cmd

- removes duplicate events that share common values

- Ex:

  ````text
  index=security sourcetype=history* Address_Description="San Francisco"
  |dedup First_Name Last_Name
  |table Username First_Name Last_Name`
  ````



Sort cmd

- shows results in ascending or descending order
- string data is sorted alphanumerically
- numeric data is sorted numerically
- Ex:

````
sourcetype=vendor_sales
|table Vendor product_name sale_price
|sort sale_price

+ ascending
- descending
Careful of spaces

|sort -sale_price Vendor # price in descending order, Vendor in ascending

|sort -sale_price Vendor limit=20 # price in descending order, Vendor in ascending, prints first 20 events
````



**SHIFT + ENTER** is newline on Linux



## 9. Transforming Cmds

- they order search results
- **Top** -  finds the most common values of given field
  - ie. `|top Vendor`
  - Clauses: countfiled, percentfield, showcount, showperc, showother, otherstr
    - **by** clause
    - `|stats dc(JSESSIONID) as Logins by clientip` - shows login by IP
- **Rare** - finds the least common values ....(same as top)
- Stats - products statistics
  - count, distinct count (unique values per field), sum, avg, min, max, list, values (list unique values of a given field)
    - `index=sales sourcetype=vendor_sales |stats count as "Total Sells By Vendor" by product_name` - returns a count **BY** each product
    - `| rare file by date_month` - make a report more granular



## 10. Reports and Dashboards

- saving and sharing searches is easy with **Reports** (*save reports as*)

- naming conventions are best practice

- can be run per user permissions or on a scheduled

- *Accelerated* reports

  ### Visualizations
  - Can be viewed as charts, maps, etc
  - [Adv Dashboards and Visualizations](https://www.splunk.com/en_us/training/courses/advanced-dashboards-and-visualizations.html)

  ### Dashboards

  - Collection of reports compiled into a single pane of glass



## 11. Pivot and Datasets

### Pivot

- simple interface without crafting search string
- Data models - knowledge objects that provide the data structure that drives pivots done by Admin or Power roles
- Data sets - smaller collections of data, represented as tables, for a specific purpose
- children data sets can be thought of as an 'AND' clause
- Default is 'All Time'

### Instant Pivot

- Quickly create a new report that doesn't already have a data model ready
- This uses the entire event pool

### Datasets

- Datasets make up data models
- Via Datasets menu



## 12. Lookups

- allow you to add other fields and values to events not included in the index data
  - csv files, scritps, or geospatial data
- E.g. Tying employees name to id OR text descriptions for productIds
- A lookup is categorized as a dataset

![Lookup](/home/papapeanut/.config/Typora/typora-user-images/image-20200327182809876.png)

#### Steps

1. Define lookup table
2. Define lookup

### Lookup cmd

`index=web sourcetype=access_combined NOT status=200 | lookup http_status code as status` # any http status not == to 200. Match the status values to lookup values

- **output** clause what fields out lookup returns
  - `|OUTPUT code as "HTTP CODE", description as "HTTP Description"`
- **outputnew** clause when you don't want to overwrite existing fields
- By default, all fields in the lookup table are returned as output fields.



### Automatic Lookups

- will no longer need to use Lookup cmd

![image-20200327183615693](/home/papapeanut/.config/Typora/typora-user-images/image-20200327183615693.png)



### Misc

- Populate Lookup table with search results
- Define lookup based on external script or cmd
- use spunk db connection app
- use geospatial lookups to create queries that can be used to generate choropleth map visualizations
- populate events with KV Store fields



## 13. Scheduled Reports and Alerts

- report that runs on scheduled interval and can trigger an action to run
  - Can: weekly reports, dashboards, auto-send emails
- reports can be run in a window for when many reports have to be run at a specific time
- An embedded report will give access to anyone that has the html page
- An embedded report will not show data until the scheduled search is run.
- After embedded a report, you cannot change it.

### Alerts

- Scheduled intervals or when results meet a defined condition
- Triggered only when search is completed
- Can: list in interface, log events, output to lookup , send to a telemetry endpoint, trigger scripts, send emails, use a webhook, run a custom alert
- Can trigger once or for each result; Once is better
- Can throttle alerts





![This is good to use!](/home/papapeanut/.config/Typora/typora-user-images/image-20200330182923977.png)



Play data for more fun! 

<https://docs.splunk.com/Documentation/Splunk/8.0.2/SearchTutorial/Systemrequirements#Download_the_tutorial_data_files>



## Post-Exam

### How to remove data

1. List sources:  ` | metadata type=hosts index=* OR index=_*` [StackOverflow](https://answers.splunk.com/answers/120461/how-to-see-all-source-and-sourcetype-list.html)
2. Delete: `source=path\to\sourcename | delete` [GoSplunk](https://gosplunk.com/clean-or-delete-data-in-a-given-source/)



### To analyze Nginx Logs

Logs: access, error

- Checking for suspicious IP's and malicious logins
