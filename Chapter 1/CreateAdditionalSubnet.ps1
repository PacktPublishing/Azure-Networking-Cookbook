$VirtualNetwork = Get-AzureRmVirtualNetwork -Name 'Packt-Script' -ResourceGroupName 'Packt-Networking-Script' 

Add-AzureRmVirtualNetworkSubnetConfig -Name BackEnd -AddressPrefix 10.11.1.0/24 -VirtualNetwork $virtualNetwork

$virtualNetwork | Set-AzureRmVirtualNetwork
