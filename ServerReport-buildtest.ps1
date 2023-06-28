# Retrieve system name (Dynamic assignment: Variable subject to change)
$Name = $env:COMPUTERNAME

# Operating system version 
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion

# Count number of logical disks
$DiskCount = (Get-CimInstance CIM_LogicalDisk).count 
# Also $DiskCount = Get-CimInstance CIM_LogicalDisk
# $DiskCount.count

#How to run output 
#Write-Output "Computer name: $Name" #provides the name of current working machine - defined in line 2

#Make a custom object
$obj = [PSCustomObject]@{
    Name = "bits"
    Status = "Stopped"
    DisplayName = "Backgroud Intelligent Transfer service"
}

<#
$obj = [PSCustomObject]@{
    Name = "bits"
    Status = "Stopped"
    DisplayName = "Backgroud Intelligent Transfer service"
}
    #>

$obj = [PSCustomObject]@{
    ComputerName = $Name  #preset value - using stored variable
    OsVersion = $Version
    DiskCount = $DiskCount
}

Write-Output $obj


