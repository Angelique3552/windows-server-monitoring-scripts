$threshold = 80
$drives = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3"

foreach ($drive in $drives) {
    $used = (($drive.Size - $drive.FreeSpace) / $drive.Size) * 100
    if ($used -ge $threshold) {
        Write-Output "WARNING: $($drive.DeviceID) $([math]::Round($used,2))% full"
    }
}
