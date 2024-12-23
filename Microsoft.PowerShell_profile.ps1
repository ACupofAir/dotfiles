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
  (& "C:\Users\timet\scoop\apps\miniconda3\current\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
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

function Get-Folder-Size($folderPath) {
  $folderSize = Get-ChildItem -Path $folderPath -Recurse | Measure-Object -Property Length -Sum
  $folderSizeBytes = $folderSize.Sum
  $folderSizeMB = $folderSizeBytes / 1MB
  $folderSizeGB = $folderSizeBytes / 1GB
  Write-Host "Folder Size: $folderSizeBytes bytes ($folderSizeMB MB or $folderSizeGB GB)"
}

function Get-File-Size($filePath) {
  $fileSizeBytes = (Get-Item -Path $filePath).Length
  $fileSizeKB = $fileSizeBytes / 1KB
  $fileSizeMB = $fileSizeBytes / 1MB
  $wordCount = (Get-Content -Path $filePath | Measure-Object -Word).Words
  $lineCount = (Get-Content -Path $filePath | Measure-Object -Line).Lines
  Write-Host "File Size: $fileSizeBytes bytes($fileSizeKB KB or $fileSizeMB MB)"
  Write-Host "Word Count: $wordCount words"
  Write-Host "Line Count: $lineCount lines"
}

function Get-Files-Info($path) {
  if (Test-Path -Path $path) {
    $item = Get-Item -Path $path
    # Check if the item is a file
    if ($item.PSIsContainer -eq $false) {
      Get-File-Size($item)
    }
    # Check if the item is a folder (directory)
    else {
      Get-Folder-Size($item)
    }
  } else {
    Write-Error "The path '$path' does not exist."
  }
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
Set-Alias -Name du Get-Files-Info

###############################################################################
################################My-Env-Var#####################################
###############################################################################
$env:http_proxy="http://127.0.0.1:7890"
$env:https_proxy="http://127.0.0.1:7890"

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

