# Refer to ServerReport.ps1 for more info on below script

# Retrieve system name (Dynamic assignment: Variable subject to change)
$Name = $env:COMPUTERNAME
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion
$DiskCount = (Get-CimInstance CIM_LogicalDisk).count 
$FreeSpace = (Get-CimInstance CIM_LogicalDisk | Where-Object {$_.DeviceID -eq 'C:'}).FreeSpace


# Make a custom object
$obj = [PSCustomObject]@{
    ComputerName = $Name  #preset value - using stored variable
    OsVersion = $Version
    DiskCount = $DiskCount
    'GB Free' = [System.Math]::Round($FreeSpace / 1Gb, 2) ## Add a class from C# (Compiler for PS) to perform math functions. Divide diskspace by 1gb and round to 2 decimal places
    
}

# Show Output
Write-Output $obj


