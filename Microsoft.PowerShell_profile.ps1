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

function Get-Dir-Stack
{
  Write-Host "Directory Stack:" -ForegroundColor green
  Write-Output "-------------------------------------------------------------"
  [String]$dirs_text = Get-Location -stack
  if ($dirs_text.Length -gt 0)
  {
    [String[]]$script:dirs_arr = $dirs_text -split " " |  Select-Object -Unique
    for ($i = 0; $i -le ($dirs_arr.length -1); $i += 1)
    {
      Write-Output "$i    $($dirs_arr[$i])"
    }
  } else
  {
    Write-Host "The stack is empty, use 'pushd dir_name' to push the directory to the stack" -ForegroundColor red
  }
}

function Set-Dir-Stack($input_text)
{
  if ($null -eq $input_text)
  {
    Push-Location
  } elseif ($input_text -is [ int ] -and $input_text -ilt $dirs_arr.length)
  {
    Set-Location $dirs_arr[$input_text]
  } elseif ($input_text -is [ string ])
  {
    Push-Location $input_text
  } else
  {
    Write-Error("The directory stack length is $($dirs_arr.length)")
    Get-Dir-Stack
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
Set-Alias -Name pd Set-Dir-Stack

###############################################################################
################################My-Env-Var#####################################
###############################################################################
$env:http_proxy="http://127.0.0.1:7890"
$env:https_proxy="http://127.0.0.1:7890"
