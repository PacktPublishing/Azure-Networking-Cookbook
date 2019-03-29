﻿$nsg=Get-AzureRmNetworkSecurityGroup -Name 'nsg1' -ResourceGroupName 'Packt-Networking-Script'
$nsg | Add-AzureRmNetworkSecurityRuleConfig -Name 'Allow_HTTPS' -Description 'Allow_HTTPS' -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 443 | Set-AzureRmNetworkSecurityGroup