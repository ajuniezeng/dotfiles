function y {
  $tmp = [System.IO.Path]::GetTempFileName()
  yazi $args --cwd-file="$tmp"
  $cwd = Get-Content -Path $tmp -Encoding UTF8
  if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
      Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
  }
  Remove-Item -Path $tmp
}

Set-Alias -Name ls -Value "eza"

function la {
    eza -a
}

function ll {
    eza -l --icons=always
}

function lla {
    eza -a -l --icons=always 
}

oh-my-posh init pwsh | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })