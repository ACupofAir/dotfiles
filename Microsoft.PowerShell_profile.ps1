# Should install psreadline, starship firstly
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Invoke-Expression (&starship init powershell)
Import-Module -Name ./PSModules/writeBig/ -DisableNameChecking
Import-Module -Name ./PSModules/dirStack/ -DisableNameChecking

###############################################################################
##############################My-Functions#####################################
###############################################################################
function Set-Proxy
{
  $env:http_proxy="http://127.0.0.1:7890"
  $env:https_proxy="http://127.0.0.1:7890"
}

function Set-Git-Proxy
{
  git config --global http.proxy "http://127.0.0.1:7890"
  git config --global https.proxy "http://127.0.0.1:7890"
}

function Clear-Proxy
{
  $env:http_proxy=""
  $env:https_proxy=""
}

function Get-Historys
{
  Get-Content (Get-PSReadlineOption).HistorySavePath
}

function Start-Conda
{
   (& "C:\Users\air\anaconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
}

function Get-Weather-Report
{
  Invoke-RestMethod https://wttr.in
}

function Get-Translated-Text($text)
{
  python -m googletranslate zh-CN -r "plain" $text
}

function Show-Link-Files($dir_name)
{
  Get-ChildItem $dir_name -force | Where-Object{$_.LinkType} | Select-Object FullName,LinkType,Target
}

###############################################################################
################################My-Alias#######################################
###############################################################################
Set-Alias -Name pxon Set-Proxy
Set-Alias -Name pxoff Clear-Proxy
Set-Alias -Name wc measure
Set-Alias -Name historys Get-Historys
Set-Alias -Name weather Get-Weather-Report
Set-Alias -Name trans Get-Translated-Text
Set-Alias -Name dv Get-Dir-Stack
Set-Alias -Name pd Set-Dir-Stack
Set-Alias -Name pp Remove-Dir-Stack-Item
Set-Alias -Name ll Show-Link-Files

###############################################################################
################################My-Env-Var#####################################
###############################################################################
$env:http_proxy="http://127.0.0.1:7890"
$env:https_proxy="http://127.0.0.1:7890"
