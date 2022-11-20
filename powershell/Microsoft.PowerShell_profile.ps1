Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

oh-my-posh init pwsh --config 'C:\Users\Gene\Documents\PowerShell\themes\multiverse-neon.omp.json' | Invoke-Expression
