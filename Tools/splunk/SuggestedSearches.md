# Splunk Suggested Searches

Basic search format: `index=<main> sourcetype=<nginx:plus:access> source=main_access.log ...`

## Listing

- For forensics purposes, being able to list all sourcetypes (via `|metadata type=sourcetypes`) and see the totalCount field at *0*, it can be known that the entires were deleted. Especially if a firstTime and lastTime are present and not negative or a 1900's date.

| Purpose              |             Search            |
|----------------------|:-----------------------------:|
| list all hosts       |    `\|metadata type=hosts`    |
| list all sourcetypes | `\|metadata type=sourcetypes` |

## Important Searches

| Purpose                                                      |                            Search                            |
| ------------------------------------------------------------ | :----------------------------------------------------------: |
| Non-normal Response Codes that have an abnormally high bytes returned, sorted | `source="main_access.log" index="main" sourcetype="nginx:plus:access" status!=200 bytes_out>800 \|sort -bytes_out` |
| Non-normal status codes, sorted, more than 1 connection (Works well with Bar Chart) | `source="main_access.log" index="main" sourcetype="nginx:plus:access" NOT (status IN ("200","301")) \|stats count as "Connections" by src_ip \|where Connections > 1 \|sort -Connections` |
| Non-normal Protocol, sorted                                  | `source="main_access.log" index="main" sourcetype="nginx:plus:access" protocol="HTTP/1.0" \|sort -src_ip \|dedup src_ip` |
| Top visitors                                                 | `source="main_access.log" index="main" sourcetype="nginx:plus:access"\|top limit=20 src_ip` |
| IP by country (Can use Cluster Map)                          | `source="main_access.log" index=main sourcetype="nginx:plus:access" \| iplocation src_ip prefix=srcip_ \| geostats latfield=srcip_lat longfield=srcip_lon count by srcip_Country` |
| Send Results via email                                       | `...\| sendemail to="john@example.com"`|
| Pages that produce the most 500 errors                       | `source="main_access.log" index=main sourcetype="nginx:plus:access" status >= 500 \| stats count(status) as cnt by uri_path, status \| sort cnt punct`|

- [Lzone cheatsheet for Nginx](https://lzone.de/cheat-sheet/Splunk)
- [Nginx logs in splunk -- Must translate](https://geekeries.org/2018/04/integrer-des-logs-nginx-dans-splunk/)