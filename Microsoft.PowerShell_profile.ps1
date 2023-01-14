# Should install psreadline, starship firstly
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Invoke-Expression (&starship init powershell)
$Script:dirs_stack = New-Object System.Collections.Generic.List[string]

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

function Get-Dir-Stack
{
  if ($dirs_stack.Count -eq 0)
  {
    Write-Host "The stack is empty, use 'pd dir_name' to push the directory to the stack" -ForegroundColor red
  } else
  {
    Write-Host "Directory Stack:" -ForegroundColor green
    Write-Host "-------------------------------------------------------------" -ForegroundColor Yellow
    for ($i = 0; $i -le ($dirs_stack.Count -1); $i += 1)
    {
      Write-Host "$i    " -NoNewline -ForegroundColor Cyan
      Write-Host "$($dirs_stack[$i])"
    }
  }
}

function Set-Dir-Stack($input_text)
{
  if ($null -eq $input_text)
  {
    # Put current directory into stack
    $current_dir = $(Get-Location)
    if ($current_dir -notin $dirs_stack)
    {
      $dirs_stack.Add($current_dir)
    } else
    {
      Write-Host "Current directory has been added in the stack" -ForegroundColor blue
    }
  } elseif ($input_text -is [ int ] -and $input_text -lt $dirs_stack.Count)
  {
    # Go to the directory in the stack whose index is the input_text
    Set-Location $dirs_stack[$input_text]
    Write-Host "Jump to " -NoNewline
    Write-Host "$($dirs_stack[$input_text])" -ForegroundColor Green
  } elseif ($input_text -is [ string ])
  {
    # Go to the directory of input, and put it in the stack
    Set-Location $input_text -ErrorAction stop
    $dirs_stack.Add($(Get-Location))
  } else
  {
    # If the input_text is unavailable, print error info and show the current stack
    Write-Error("The directory stack length is $($dirs_stack.Count)")
    Get-Dir-Stack
  }
}

function Remove-Dir-Stack-Item($index)
{
  if ($index -is [ int ] -and $index -lt $dirs_stack.Count)
  {
    $dirs_stack.RemoveAt($index)
  } else
  {
    Write-Error("The index $index must less than stack length $($dirs_stack.Count)")
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
Set-Alias -Name pp Remove-Dir-Stack-Item
Set-Alias -Name ll Show-Link-Files

###############################################################################
################################My-Env-Var#####################################
###############################################################################
$env:http_proxy="http://127.0.0.1:7890"
$env:https_proxy="http://127.0.0.1:7890"
