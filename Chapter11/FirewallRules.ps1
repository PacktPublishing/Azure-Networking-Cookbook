$RG="Packt-Networking-Portal"
$Location="West Europe"

#Add a rule to allow *packt.com
$Azfw = Get-AzureRmFirewall -ResourceGroupName $RG
$Rule = New-AzureRmFirewallApplicationRule -Name Rule1 -Protocol "http:80","https:443" -TargetFqdn "*packt.com"
$RuleCollection = New-AzureRmFirewallApplicationRuleCollection -Name RuleCollection1 -Priority 100 -Rule $Rule -ActionType "Allow"
$Azfw.ApplicationRuleCollections = $RuleCollection
Set-AzureRmFirewall -AzureFirewall $Azfw

#Add a rule to deny *google.com
$Azfw = Get-AzureRmFirewall -ResourceGroupName $RG
$Rule = New-AzureRmFirewallApplicationRule -Name Rule1 -Protocol "http:80","https:443" -TargetFqdn "*google.com"
$RuleCollection = New-AzureRmFirewallApplicationRuleCollection -Name RuleCollection1 -Priority 100 -Rule $Rule -ActionType "Deny"
$Azfw.ApplicationRuleCollections = $RuleCollection
Set-AzureRmFirewall -AzureFirewall $Azfw

#Create UDR rule
$Azfw = Get-AzureRmFirewall -ResourceGroupName $RG
$config = $Azfw.IpConfigurations[0].PrivateIPAddress
$Route = New-AzureRmRouteConfig -Name 'Route1' -AddressPrefix 0.0.0.0/0 -NextHopType VirtualAppliance -NextHopIpAddress $config
$RouteTable = New-AzureRmRouteTable -Name 'RouteTable1' -ResourceGroupName $RG -location $Location -Route $Route
