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

