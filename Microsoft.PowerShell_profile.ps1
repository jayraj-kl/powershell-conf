Clear-Host

Import-Module -Name Terminal-Icons
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward


oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\custom.omp.yaml" | Invoke-Expression

function n([Parameter(ValueFromRemainingArguments = $true)]$params) {
& fastfetch -c C:/Users/Lenovo/.config/fastfetch/config.jsonc $params
}

# Auto-activate venv and run unimatrix with Japanese katakana
function matrix([Parameter(ValueFromRemainingArguments = $true)]$params) {
    $venvPath = "C:\Users\Lenovo\.local\bin\venv\Scripts\Activate.ps1"
    if (Test-Path $venvPath) {
        & $venvPath
        try {
            unimatrix -l k
        }
        finally {
            deactivate
        }
    } else {
        Write-Warning "Virtual environment not found at $venvPath."
    }
}


# In your profile, instead of the direct activation and unimatrix call:
# Auto-activate venv and run unimatrix with Japanese katakana
# This will now be handled by the function:
# Start-UnimatrixWithVenv

# This is an example of a macro that you might use to execute a command.
# This will add the command to history.

# Set-PSReadLineKeyHandler -Key Ctrl+Shift+b `
#                          -BriefDescription BuildCurrentDirectory `
#                          -LongDescription "Build the current directory" `
#                          -ScriptBlock {
#     [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
#     [Microsoft.PowerShell.PSConsoleReadLine]::Insert("npm run build")
#     [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
# }