# Refer to ServerReport.ps1 for more info on below script
function Get-PowerSmell {
    [CmdletBinding()]
    param (
    [ValidateSet("C","D","E","F","G","H")]
    [string]$DriveLetter = 'C'
    )
    # Retrieve system name (Dynamic assignment: Variable subject to change)
    $Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion
    $Name = $env:COMPUTERNAME
    $DiskInstance = Get-CimInstance CIM_LogicalDisk
    $DiskCount = $DiskInstance.count 
    $FreeSpace = ($DiskInstance | Where-Object {$_.DeviceID -eq ($DriveLetter + ":")}).FreeSpace
    
    
    # Make a custom object
    $obj = [PSCustomObject]@{
        ComputerName = $Name  #preset value - using stored variable
        OsVersion = $Version
        DiskCount = $DiskCount
        'GB Free' = [System.Math]::Round($FreeSpace / 1Gb, 2) ## Add a class from C# (Compiler for PS) to perform math functions. Divide diskspace by 1gb and round to 2 decimal places
        
    }
    
    # Show Output
    Write-Output $obj
    
}
