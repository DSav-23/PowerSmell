# Retrieve system name (Dynamic assignment: Variable subject to change)
$Name = $env:COMPUTERNAME

# Operating system version 
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion

# Count number of logical disks
$DiskCount = (Get-CimInstance CIM_LogicalDisk).count 
# Also $DiskCount = Get-CimInstance CIM_LogicalDisk
# $DiskCount.count
