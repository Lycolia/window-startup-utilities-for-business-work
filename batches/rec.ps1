Write-Host "録音を開始する場合は何かキーを押してください…" -NoNewLine
[Console]::ReadKey($true) > $null

$input = "マイク (Sound BlasterX G1)"
$filename = Get-Date -Format "yyyy-MM-dd_HH_mm_ss"

ffmpeg -f dshow -i audio=$input -f dshow -i audio=virtual-audio-capturer -filter_complex "[0:a][1:a]amerge=inputs=2[a]" -map "[a]" "C:/Users/濱口拓也/Desktop/$filename.mp3"
