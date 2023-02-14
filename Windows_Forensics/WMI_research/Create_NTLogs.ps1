#Script will create Error logs every time notepad.exe is seen in the tasklist.
#WORKS, use as template!

$type="'win32_process'"
$process="'notepad.exe'"
$q="Select * from __InstanceOperationEvent WITHIN 1 where Targetinstance ISA $type AND Targetinstance.name=$process";
$filterProperty=@{
	Name="MMC Filter"
	EventNamespace="root\cimv2"
	QueryLanguage="WQL"
	Query=$q
}
$ff=New-CimInstance -Namespace 'root/subscription' -Classname __EventFilter -Property $filterProperty
$template=@('Youve sunk my battleship')
$consumerProperty=@{
	Name="MMC Consumer"
	Category=[uint16] 0
	EventID=[uint32] 8
	EventType=[uint32] 1 #Error
	Sourcename="WSH"
	NumberofInsertionStrings=[uint32] $template.length
	InsertionStringTemplates=$template
}
$cc=New-CimInstance -Namespace root/subscription -Classname NTEventLogEventConsumer -Property $consumerProperty
$bb=New-CimInstance -Namespace root/subscription -Classname __FiltertoConsumerBinding -Property @{Filter=[REF]$ff;Consumer=[REF]$cc}


#Get-WMIObject -Namespace root\Subscription -Class __FilterToConsumerBinding -Filter “__Path LIKE ‘%MMC%’” | Remove-WmiObject -Verbose
#get-ciminstance -namespace root\subscription -classname __FilterToConsumerBinding|where-object {$_.Filter.name -like "*MMC*"} | Remove-WMIObject