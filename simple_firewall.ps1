
# Function to add a firewall rule
function Add-FirewallRule {
    param (
        [string]$Name,
        [string]$DisplayName,
        [string]$Description,
        [string]$Group,
        [string]$Direction,
        [string]$Action,
        [string]$Protocol,
        [string]$LocalPort,
        [string]$RemoteAddress,
        [string]$Owner,
        [string]$PolicyAppId
    )

    New-NetFirewallRule -Name $Name -DisplayName $DisplayName -Description $Description -Group $Group -Direction $Direction -Action $Action -Protocol $Protocol -LocalPort $LocalPort -RemoteAddress $RemoteAddress -Owner $Owner -PolicyAppId $PolicyAppId

    # Output formatted result
    Write-Output "# Adding the '$DisplayName' rule"
    Write-Output "Name                  : $Name"
    Write-Output "DisplayName           : $DisplayName"
    Write-Output "Description           : $Description"
    Write-Output "Group                 : $Group"
    Write-Output "Direction             : $Direction"
    Write-Output "Action                : $Action"
    Write-Output "Protocol              : $Protocol"
    Write-Output "LocalPort             : $LocalPort"
    Write-Output "RemoteAddress         : $RemoteAddress"
    Write-Output "Owner                 : $Owner"
    Write-Output "PolicyAppId           : $PolicyAppId"
    Write-Output "Status                : The rule was successfully added.`n"
}

# Function to remove a firewall rule
function Remove-FirewallRule {
    param (
        [string]$Name,
        [string]$DisplayName
    )

    Remove-NetFirewallRule -Name $Name

    # Output formatted result
    Write-Output "# Removing the '$DisplayName' rule"
    Write-Output "Name                  : $Name"
    Write-Output "DisplayName           : $DisplayName"
    Write-Output "Status                : The object was deleted.`n"
}

# Example usage with different names, display names, and owner
Add-FirewallRule -Name "BlockIPRule" -DisplayName "BlockIP" -Description "Block specific IP" -Group "NetworkSecurity" -Direction "Inbound" -Action "Block" -Protocol "TCP" -LocalPort 80 -RemoteAddress "192.168.164.127" -Owner "Administrators" -PolicyAppId "YourAppPackageFamilyName"
Add-FirewallRule -Name "AllowIPRule" -DisplayName "AllowIP" -Description "Allow specific IP" -Group "NetworkSecurity" -Direction "Inbound" -Action "Allow" -Protocol "TCP" -LocalPort 80 -RemoteAddress "192.168.164.128" -Owner "Administrators" -PolicyAppId "YourAppPackageFamilyName"
Remove-FirewallRule -Name "BlockIPRule" -DisplayName "BlockIP"
Remove-FirewallRule -Name "AllowIPRule" -DisplayName "AllowIP"
