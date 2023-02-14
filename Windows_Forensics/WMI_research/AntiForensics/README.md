# AntiForensics PoC

Goal: Anytime an incident responder attempts to check the event logs on the local system the current user's session will automatically log off.


To run, first make sure *bland.ps1* is in the intended location and make sure to run the bind_script.ps1 in an administrative PowerShell terminal.

```PowerShell
C:>.\bind_script.ps1
```

## Cleanup

When you are done messing around, to return your machine to it's normal state just run:

```PowerShell
C:> .\cleanup.ps1
```

## Miscellaneous Commands
```PowerShell
#To verify
gwmi -Namespace root/subscription -Classname __EventFilter 
gwmi -Namespace root/subscription -Classname CommandLineEventConsumer
gwmi -Namespace Root/Subscription -ClassName __FilterToConsumerBinding 
```