# Refer to ServerReport.ps1 for more info on below script

# Retrieve system name (Dynamic assignment: Variable subject to change)
$Name = $env:COMPUTERNAME
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion
$DiskCount = (Get-CimInstance CIM_LogicalDisk).count 
$FreeSpace = (Get-CimInstance CIM_LogicalDisk).FreeSpace


# Make a custom object
$obj = [PSCustomObject]@{
    ComputerName = $Name  #preset value - using stored variable
    OsVersion = $Version
    DiskCount = $DiskCount
    'GB Free' = $FreeSpace / 1Gb
}

# Show Output
Write-Output $obj


