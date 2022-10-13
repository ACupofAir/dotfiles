# Should install psreadline, starship firstly
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Invoke-Expression (&starship init powershell)
