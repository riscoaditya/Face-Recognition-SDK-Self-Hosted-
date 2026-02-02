$File = "host_id.txt"

if (Test-Path $File) {
  Write-Host "[OK] host_id.txt already exists. Keeping existing host id."
  Get-Content $File
  exit 0
}

$guid = [guid]::NewGuid().ToString()
Set-Content -Path $File -Value $guid -Encoding ascii

Write-Host "[OK] Generated host_id.txt:"
Get-Content $File
Write-Host ""
Write-Host "Do NOT delete this file. It is used to bind the license to this server."
