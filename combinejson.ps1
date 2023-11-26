$first = Get-Content -Path ".\options.json" -Raw | ConvertFrom-Json -Depth 10
$second = Get-Content -Path ".\outbounds.json" -Raw | ConvertFrom-Json -Depth 10

$first | Add-Member -MemberType NoteProperty -Name oubounds -Value $second.outbounds
$first | ConvertTo-Json -Depth 10 | Out-File -FilePath ./merged.json
