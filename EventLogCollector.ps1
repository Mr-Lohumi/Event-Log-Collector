<#
.SYNOPSIS
    Collects System and Application event logs from the last 24 hours.

.DESCRIPTION
    This PowerShell script retrieves error and warning event logs from both the System 
    and Application logs for the last 24 hours. It outputs the logs to the console 
    and optionally exports them to a CSV file.

.PARAMETER startTime
    The time range for log collection is set to the last 24 hours by default.

.EXAMPLE
    .\EventLogCollector.ps1

    Retrieves and displays the system and application logs from the last 24 hours 
    and exports them to C:\EventLogs.csv.
#>

# Define the time range for log collection (last 24 hours)
$startTime = (Get-Date).AddDays(-1)

# Retrieve System log entries (errors and warnings from the last 24 hours)
$systemLogs = Get-EventLog -LogName System -EntryType Error, Warning -After $startTime

# Retrieve Application log entries (errors and warnings from the last 24 hours)
$applicationLogs = Get-EventLog -LogName Application -EntryType Error, Warning -After $startTime

# Combine System and Application logs
$allLogs = $systemLogs + $applicationLogs

# Display log details in a readable format
foreach ($log in $allLogs) {
    Write-Host "----------------------------------------"
    Write-Host "Log Name       : $($log.Log)"
    Write-Host "Entry Type     : $($log.EntryType)"
    Write-Host "Source         : $($log.Source)"
    Write-Host "Event ID       : $($log.EventID)"
    Write-Host "Message        : $($log.Message)"
    Write-Host "Time Generated : $($log.TimeGenerated)"
}

# Export logs to CSV
$allLogs | Export-Csv -Path "C:\EventLogs.csv" -NoTypeInformation
Write-Host "Logs have been exported to C:\EventLogs.csv"
