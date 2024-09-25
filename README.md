# Event-Log-Collector

---

# Event Log Collector Script

## Overview

This PowerShell script collects System and Application event logs from the last 24 hours, filtering for errors and warnings. It displays the logs in the console and optionally exports them to a CSV file.

## Features

- Retrieves error and warning logs from both System and Application event logs.
- Collects logs from the last 24 hours.
- Outputs logs to the console with details like log name, entry type, source, event ID, message, and timestamp.
- Optionally exports logs to a CSV file.

## Requirements

- PowerShell (v5.0 or later)
- Proper permissions to access event logs

## How to Use

1. **Run the script**:
   - Simply execute the script to collect and display logs from the last 24 hours:
     ```powershell
     .\EventLogCollector.ps1
     ```
   
2. **Export logs**:
   - The script automatically exports the logs to `C:\EventLogs.csv` by default. You can modify the file path in the script as needed.

## Example Output

Here’s an example of the console output for each log entry:
```
Log Name: System
Entry Type: Error
Source: Service Control Manager
Event ID: 7000
Message: The xyz service failed to start.
Time Generated: 09/24/2024 11:45:03 AM
----------------------------------------
```

## Customization

- **Time Range**: You can adjust the `$startTime` variable in the script to customize the time range.
- **Log Export**: Modify the file path for the CSV export by editing the line with `Export-Csv`.

## License

This script is licensed under the MIT License.
