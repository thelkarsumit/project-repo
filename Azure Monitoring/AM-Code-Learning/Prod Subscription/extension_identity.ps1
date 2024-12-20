$sub = Get-AzSubscription -SubscriptionName 'Prod Subscription'
Set-AzContext -Subscription $sub.Id
# $RGName = "RG-AM-Prod-Subscription" 
# $storageAccountName = "saprodsubscriptiontf"
# $location = "North Europe"

# New-AzResourceGroup -Name $RGName -Location $location

# New-AzStorageAccount -Name $storageAccountName -ResourceGroupName $RGName -SkuName "Standard_LRS" -Location $location
# $storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $RGName -AccountName $storageAccountName).Value[0]
# $ctx = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey
# New-AzStorageContainer -Name "new-container" -Context $ctx

# $receiver = New-AzActionGroupReceiver -Name "DBCInfraMgmt" -EmailAddress "DBCInfraMgmt@hcl.com"
# $actionGroup = Set-AzActionGroup -ResourceGroupName $RGName -Name "AG-AM-Prod-Subscription" -ShortName "AG-AM-Prod" -Receiver $receiver 
#$actionGroupId = $actionGroup.id

#$ip_address = @("10.13.0.4", "10.221.152.4", "10.221.152.5", "10.221.152.132", "10.221.152.133", "10.221.152.6", "10.221.152.7", "10.221.152.37", "10.221.152.100", "10.221.152.102", "10.221.152.101", "10.221.153.36", "10.221.152.69", "10.221.152.70", "10.221.152.68", "10.221.152.39", "10.221.152.38", "10.221.152.42", "10.221.152.44", "10.221.152.36", "10.16.0.4", "10.221.157.36", "10.221.156.228", "10.221.157.37", "10.15.0.4", "10.221.161.68", "10.221.160.197", "10.221.161.69", "10.221.161.101", "10.221.160.164", "10.221.160.165", "10.221.160.166", "10.221.160.36", "10.221.160.133", "10.221.160.134", "10.221.160.132", "10.221.161.102", "10.221.161.100", "10.18.0.4", "10.221.165.36", "10.221.164.228", "10.221.165.37")
#$ip_address = @("10.221.160.164", "10.221.160.165", "10.221.160.166", "10.221.160.36", "10.221.160.133", "10.221.160.134", "10.221.160.132", "10.221.161.102", "10.221.161.100", "10.18.0.4", "10.221.165.36", "10.221.164.228", "10.221.165.37")
#$ip_address = @("10.221.152.5")
$ip_address = @("10.221.152.38", "10.221.152.46")
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
    



 
