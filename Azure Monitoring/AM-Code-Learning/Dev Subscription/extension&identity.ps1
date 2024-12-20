$sub = Get-AzSubscription -SubscriptionName 'Dev Subscription'
Set-AzContext -Subscription $sub.Id

$RGName = "RG-AM-Dev-Subscription" 
$storageAccountName = "sadevsubscriptiontf"
$location = "North Europe"

# New-AzResourceGroup -Name $RGName -Location $location

# New-AzStorageAccount -Name $storageAccountName -ResourceGroupName $RGName -SkuName "Standard_LRS" -Location $location
# $storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $RGName -AccountName $storageAccountName).Value[0]
# $ctx = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey
# New-AzStorageContainer -Name "new-container" -Context $ctx
# # $receiver = New-AzActionGroupReceiver -Name "DBCInfraMgmt" -EmailAddress "DBCInfraMgmt@hcl.com"
# $actionGroup = Set-AzActionGroup -ResourceGroupName $RGName -Name "AG-AM-Dev-Subscription" -ShortName "AG-AM-Dev" -Receiver $receiver 
#$actionGroupId = $actionGroup.id

# $ip_address = @("10.14.0.4", "10.221.168.196", "10.221.168.198", "10.221.168.37", "10.221.168.43", "10.221.170.164", "10.221.169.5", "10.221.168.165", "10.221.168.166", "10.221.168.36", "10.221.168.4", "10.221.168.137", "10.221.168.164", "10.221.168.5", "10.221.169.4", "10.221.169.6", "10.17.0.4", "10.221.177.132", "10.221.177.36", "10.221.176.229", "10.221.177.100", "10.221.177.101", "10.221.168.38", "10.221.168.135", "10.221.168.136", "10.221.168.6", "10.221.168.7", "10.14.1.185", "10.221.168.8", "10.221.168.132", "10.221.168.133", "10.221.177.68", "10.221.168.45", "10.221.168.46", "10.221.168.47", "10.221.168.134", "10.221.176.228")

#$ip_address = @("10.221.168.8", "10.221.168.132", "10.221.168.133", "10.221.177.68", "10.221.168.45", "10.221.168.46", "10.221.168.47", "10.221.168.134", "10.221.176.228")
#$ip_address = @("10.221.168.139", "10.221.168.138", "10.221.176.132")
$ip_address = @("10.17.0.4")
$vms= @()

foreach ($ip in $ip_address) {
    $nic = Get-AzNetworkInterface | Where-Object {$_.IpConfigurations.PrivateIpAddress -eq $ip}
    $vmId = $nic.VirtualMachine.Id
    $vms += (Get-AzVM | Where-Object {$_.Id -eq $vmId})
    
}
    foreach($vm in $vms){
        if($vm.Identity.Type){

            write-output "$($vm.Identity.Type) is already enabled on $($vm.Name)"
           
           }
           else{
       
           write-output "Enabling system assigned Identity on $($vm.Name)"
       
           Update-AzVM -VM $vm -IdentityType SystemAssigned -ResourceGroupName $vm.ResourceGroupName
           
           }

    #write-output $vm.StorageProfile.OsDisk.OsType
    $statuscheck = Get-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -Status 

    if ($statuscheck.Statuses.DisplayStatus[1] -eq "VM running") { 
        $extension = Get-AzVMExtension -VMName $vm.Name -ResourceGroupName $vm.ResourceGroupName
        if ($extension.ExtensionType -eq "AzureMonitorLinuxAgent" -or $extension.ExtensionType -eq "AzureMonitorWindowsAgent") {
            $extensionName = $extension.ExtensionType
            Write-Output "$extensionName already exists."
        }
        else {
            if ($vm.StorageProfile.OsDisk.OsType -eq "Windows") {
                write-output "windows"
                write-output $vm.Name
                write-output $vm.Location
                write-output $vm.ResourceGroupName
                Set-AzVMExtension -Name AzureMonitorWindowsAgent -ExtensionType AzureMonitorWindowsAgent -Publisher Microsoft.Azure.Monitor -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -Location $vm.Location -TypeHandlerVersion 1.6
            }
            else {
                write-output "linux"
                write-output $vm.Name
                write-output $vm.Location
                write-output $vm.ResourceGroupName
                Set-AzVMExtension -Name AzureMonitorLinuxAgent -ExtensionType AzureMonitorLinuxAgent -Publisher Microsoft.Azure.Monitor -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -Location $vm.Location -TypeHandlerVersion 1.6  
            }
        }
    }

}
    



 
