# Turn Off Power Saving Function of All Network Adapters
# A simple script running on PowerShell in Windows 10+

$adapters = Get-NetAdapter -Physical | Get-NetAdapterPowerManagement

foreach ($adapter in $adapters)
{
    $adapter.AllowComputerToTurnOffDevice = 'Disabled'
    $adapter | Set-NetAdapterPowerManagement
}
