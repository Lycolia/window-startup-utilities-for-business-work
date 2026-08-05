Set-Location C:/env/tools/batch
powershell -ExecutionPolicy Bypass -command "& { . C:/env/tools/batch/SFTA.ps1; Set-PTA MSEdgeHTM http; Set-PTA MSEdgeHTM https; Set-FTA MSEdgeHTM .htm; Set-FTA MSEdgeHTM .html }"
