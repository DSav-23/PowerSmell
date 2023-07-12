#Retrieve process information and declare variables

(
$Processes = (Get-Process)
$PName = ($Processes).Name
$PID = ($Processes).Id 
$PStartTime = ($Processes).StartTime
# for each loop to get runtime for each process
$PRunTime = 
foreach ($Process in $Processes) {
    $RunTime = (Get-Date) - $PStartTime
    $formattedTime = '{0:dd} days, {0:hh} hours, {0:mm} minutes' -f $RunTime

    Write-Host "Process Name: $($PName)"
    Write-Host "Running Time: $formattedTime`n"
}
$Totalnum = ($Processes).count 
)

#Custom objects and output

$obj = [PSCustomObject]@{
    ProcessName = $PName
    ProcessID = $PID
    ProcessUptime = $PStartTime
    TotalProcessCount = $PRunTime
}

# Show Output
Write-Output $obj