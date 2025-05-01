oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\custom.omp.yaml" | Invoke-Expression

Import-Module -Name Terminal-Icons
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

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