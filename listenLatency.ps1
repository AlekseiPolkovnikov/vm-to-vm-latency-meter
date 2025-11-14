Param(
  [string]$SourceIPPort
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


Start-Job -ArgumentList $AppPath,$SourceIPPort -ScriptBlock 
{
    Param (
        [string]$AppPath,
        [string]$SourceIPPort
    )
    Set-Location $AppPath
    .\psping.exe -q -accepteula -s $SourceIPPort 
} 


