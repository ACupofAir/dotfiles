# Should install psreadline, starship firstly
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Invoke-Expression (&starship init powershell)

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
  (& "C:\Users\june\anaconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression 
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

function Change-EOL-LF($folderPath) {
  $fileList = Get-ChildItem -Path $folderPath -File -Recurse
  foreach ($file in $fileList) {
    Write-Host $file
    $text = [IO.File]::ReadAllText($file) -replace "`r`n", "`n"
    [IO.File]::WriteAllText($file, $text)
    # $fileContent = Get-Content -Path $file.FullName -Raw
    # $fileContent = $fileContent -replace "`r`n", "`n"  # Replace CRLF with LF
    # Set-Content -Path $file.FullName -Value $fileContent
  }
  Write-Host "EOL characters changed from CRLF to LF in all files."
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
Set-Alias -Name pd Add-Dir-Item
Set-Alias -Name pp Remove-Dir-Stack-Item
Set-Alias -Name jp Set-Stacked-Dir
Set-Alias -Name ll Show-Link-Files
Set-Alias -Name draw Write-Big-Char
Set-Alias -Name which Get-Command

###############################################################################
################################My-Env-Var#####################################
###############################################################################
$env:http_proxy="http://127.0.0.1:7890"
$env:https_proxy="http://127.0.0.1:7890"
