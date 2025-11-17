Param(
  [string]$TestIPPort,
  [int]$TestNumber,
  [string]$PacketSize
)

$AppPath = [Environment]::GetFolderPath("CommonApplicationData")+"\latencymeter"

$PsToolsSourceURL = "https://download.sysinternals.com/files/PSTools.zip"
$PsToolsArchive = $AppPath+"\PSTools.zip"

if (!(Test-Path $AppPath)){
    mkdir $AppPath | Out-Null
    Invoke-WebRequest $PsToolsSourceURL -OutFile $PsToolsArchive

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($PsToolsArchive, $AppPath)
    Remove-Item $PsToolsArchive 
}

Set-Location $AppPath
$latency = .\psping.exe -q -accepteula -l $PacketSize -n $TestNumber $TestIPPort | Select-String "Minimum = (.*)" | % { $_.Matches.Value }

"Latency: $latency"
