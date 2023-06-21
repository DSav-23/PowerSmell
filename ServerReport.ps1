# Retrieve system name (Dynamic assignment: Variable subject to change)
$Name = $env:COMPUTERNAME

# Operating system version 
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion