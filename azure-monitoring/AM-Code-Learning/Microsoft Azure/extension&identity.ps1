$sub = Get-AzSubscription -SubscriptionName 'Microsoft Azure'
Set-AzContext -Subscription $sub.Id

# $RGName = "RG-AM-Hub-Subscription" 
# $storageAccountName = "sahubsubscriptiontf"
# $location = "North Europe"
# #New-AzResourceGroup -Name $RGName -Location $location

# #New-AzStorageAccount -Name $storageAccountName -ResourceGroupName $RGName -SkuName "Standard_LRS" -Location $location
#  #$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $RGName -AccountName $storageAccountName).Value[0]
#  #$ctx = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey
#  #New-AzStorageContainer -Name "new-container" -Context $ctx
#  #$receiver = New-AzActionGroupReceiver -Name "DBCInfraMgmt" -EmailAddress "DBCInfraMgmt@hcl.com"
# #$actionGroup = Set-AzActionGroup -ResourceGroupName $RGName -Name "AG-AM-Hub-Subscription" -ShortName "AG-AM-Hub" -Receiver $receiver 
# #$actionGroupId = $actionGroup.id

# $ip_address = @("10.50.0.75","10.221.133.4","10.221.133.5","10.50.0.78","10.221.69.4", "10.221.69.8",
# "10.3.0.4","10.6.0.4","10.221.69.18","10.221.69.20","10.50.2.4")

# $ip_address = @("10.221.108.37","10.221.108.38","10.221.108.70","10.221.108.7","10.221.104.133","10.2.0.5","10.221.112.15","10.221.104.6","10.50.1.6","10.221.121.4","10.221.121.6","10.50.2.5","10.50.1.7","10.50.1.12","10.50.1.9","10.221.66.114","10.221.67.138","10.221.67.141","10.221.67.135","10.221.67.70","10.221.67.134","10.221.104.4","10.221.104.5","10.221.91.91","10.221.110.4","10.50.0.91","10.50.0.92","10.221.110.5","10.221.112.14","10.221.108.104","10.221.108.103","10.221.108.102","10.221.108.136","10.221.108.134","10.221.108.71","10.221.108.6","10.221.64.196","10.221.112.11","10.221.112.7",
# "10.221.64.103","10.221.64.104","10.221.65.84","10.221.113.84","10.221.65.6",   "10.221.111.68","10.221.113.68","10.221.98.4","10.221.88.39","10.221.88.40","10.221.116.8","10.221.116.7","10.221.116.5","10.221.88.217","10.221.88.196","10.221.99.72","10.221.106.4","10.221.72.39","10.221.72.40","10.221.102.4","10.221.80.39","10.221.80.40","10.221.80.208","10.221.80.201","10.221.69.6","10.50.1.4","10.221.70.4", "10.221.70.8","10.50.2.4","10.50.1.13","10.50.1.8", "10.221.112.8", "10.221.112.10","10.4.0.4","10.221.77.4","10.221.77.14","10.221.77.15","10.221.141.7","10.221.77.9","10.221.141.8","10.7.0.4","10.221.85.5",
# "10.221.137.4","10.221.137.5","10.221.120.5","10.221.67.137","10.221.67.140","10.221.120.12","10.221.120.6")

#Phase 2
# $ip_address = @("10.221.108.37","10.221.108.38","10.221.108.70","10.221.108.7","10.221.104.133","10.2.0.5","10.221.112.15","10.221.104.6","10.50.1.6","10.221.121.4","10.221.121.6","10.50.2.5","10.50.1.7","10.50.1.12","10.50.1.9","10.221.66.114","10.221.67.138","10.221.67.141","10.221.67.135","10.221.67.70","10.221.67.134","10.221.104.4","10.221.104.5","10.221.91.91","10.221.110.4","10.50.0.91","10.50.0.92","10.221.110.5","10.221.112.14","10.221.108.104","10.221.108.103","10.221.108.102","10.221.108.136","10.221.108.134","10.221.108.71","10.221.108.6","10.221.64.196","10.221.112.11","10.221.112.7",
# "10.221.64.103","10.221.64.104","10.221.65.84","10.221.113.84","10.221.65.6")
#$ip_address = @("10.221.67.135","10.221.67.70","10.221.67.134","10.221.104.4","10.221.104.5","10.221.91.91","10.221.110.4","10.50.0.91","10.50.0.92","10.221.110.5","10.221.112.14","10.221.108.104","10.221.108.103","10.221.108.102","10.221.108.136","10.221.108.134","10.221.108.71","10.221.108.6","10.221.64.196","10.221.112.11","10.221.112.7","10.221.64.103","10.221.64.104","10.221.65.84","10.221.113.84","10.221.65.6")
# $ip_address = @("10.221.64.104","10.221.65.84","10.221.113.84","10.221.65.6","10.221.111.68","10.221.113.68","10.221.98.4","10.221.88.39","10.221.88.40","10.221.116.8","10.221.116.7","10.221.116.5","10.221.88.217","10.221.88.196","10.221.99.72","10.221.106.4","10.221.72.39","10.221.72.40","10.221.102.4","10.221.80.39","10.221.80.40","10.221.80.208","10.221.80.201","10.221.69.6","10.50.1.4","10.221.70.4", "10.221.70.8","10.50.2.4","10.50.1.13",   "10.50.1.8", "10.221.112.8", "10.221.112.10","10.4.0.4","10.221.77.4","10.221.77.14","10.221.77.15","10.221.141.7","10.221.77.9","10.221.141.8","10.7.0.4","10.221.85.5",
# "10.221.137.4","10.221.137.5","10.221.120.5","10.221.67.137","10.221.67.140","10.221.120.12","10.221.120.6")

#$ip_address = @("10.221.65.84","10.221.113.84","10.221.65.6")

#$ip_address = @("10.221.120.5","10.221.67.137","10.221.67.140","10.221.120.12","10.221.120.6")

##########For VM where pipeline got stuck ##########################
#$ip_address = @("10.221.80.208")
$ip_address = @("10.2.0.5")
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
    
    Write-Output $statuscheck.Statuses.DisplayStatus[1]


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
    
