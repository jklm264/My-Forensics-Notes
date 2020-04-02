# Helpful Notes

## Contents

- [Remove Date](How-to-remove-data)
- [Nginx Logs](Nginx-Logs)

### How to remove data

1. List sources:  ` | metadata type=hosts index=* OR index=_*` [StackOverflow](https://answers.splunk.com/answers/120461/how-to-see-all-source-and-sourcetype-list.html)
2. Delete: `source=path\to\sourcename | delete` [GoSplunk](https://gosplunk.com/clean-or-delete-data-in-a-given-source/)

### Nginx Logs

- Types of logs: access, error, fail2ban, ...
- Checking for suspicious IP's and malicious logins

[Suggested Searches](SuggestedSearches.md)
