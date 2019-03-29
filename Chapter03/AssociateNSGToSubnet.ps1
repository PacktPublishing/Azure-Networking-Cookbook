
$vnet = Get-AzureRmVirtualNetwork -Name 'Packt-Script' -ResourceGroupName 'Packt-Networking-Script'
$subnet = Get-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name BackEnd
$nsg = Get-AzureRmNetworkSecurityGroup -ResourceGroupName 'Packt-Networking-Script' -Name 'nsg1'
$subnet.NetworkSecurityGroup = $nsg
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet