#Delete
gwmi -Namespace root/subscription -Classname __EventFilter | Remove-WMIObject
gwmi -Namespace root/subscription -Classname CommandLineEventConsumer | Remove-WMIObject
get-wmiobject -namespace root\subscription -Class __FilterToConsumerBinding | where-object {$_} | Remove-WMIObject #Will remove all