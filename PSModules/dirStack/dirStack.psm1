$Script:dirs_stack = New-Object System.Collections.Generic.List[string]
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
      Write-Host "  $i  " -NoNewline -ForegroundColor Cyan
      Write-Host "|  " -NoNewline -ForegroundColor Cyan
      Write-Host "$($dirs_stack[$i])"
    }
    Write-Host "-------------------------------------------------------------" -ForegroundColor Yellow
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
