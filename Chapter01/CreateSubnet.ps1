$VirtualNetwork = Get-AzureRmVirtualNetwork -Name 'Packt-Script' -ResourceGroupName 'Packt-Networking-Script' 

Add-AzureRmVirtualNetworkSubnetConfig -Name FrontEnd -AddressPrefix 10.11.0.0/24 -VirtualNetwork $virtualNetwork

$virtualNetwork | Set-AzureRmVirtualNetwork