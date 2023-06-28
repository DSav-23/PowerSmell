# Refer to ServerReport.ps1 for more info on below script

# Retrieve system name (Dynamic assignment: Variable subject to change)
$Name = $env:COMPUTERNAME
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion
$DiskCount = (Get-CimInstance CIM_LogicalDisk).count 

# Make a custom object
$obj = [PSCustomObject]@{
    ComputerName = $Name  #preset value - using stored variable
    OsVersion = $Version
    DiskCount = $DiskCount
}

# Show Output
Write-Output $obj


