# rough draft of script persistence through reboot


# Perform actions before reboot

# Check if a reboot is required
if (Test-Path "C:\RebootRequired.txt") {
    Write-Host "Reboot is required. Initiating reboot..."
    # Save current script state
    $scriptPath = $MyInvocation.MyCommand.Path
    $scriptArgs = $MyInvocation.MyCommand.Arguments
    $scriptState = Get-Content -Path $scriptPath
    # Perform any cleanup or saving of state before rebooting

    # Reboot computer
    Restart-Computer -Wait

    # Script will resume here after the reboot

    # Perform actions after reboot

    # Restore script state and continue execution
    Set-Content -Path $scriptPath -Value $scriptState
    $args = $scriptArgs | ForEach-Object { $_ -replace "`"" } # remove escaped double quotes from arguments
    & $scriptPath @args
}
else {
    Write-Host "No reboot is required. Continuing script execution..."
    # Perform actions after reboot
}