<# : #
@echo off && setlocal && cd %~dp0 && powershell -nol -nop -ex bypass -c "iex $($PSScriptName='%~nx0';$DnDFile='%~f1';type '%~dpf0' -raw)" && endlocal && goto:eof
#>
$PSScriptRoot = (gl).Path
try{
	$VlcPath = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\VideoLAN\VLC' -Name InstallDir -ErrorAction Stop
}catch [System.Exception]{
	$VlcPath = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\WOW6432Node\VideoLAN\VLC' -Name InstallDir
}
$EscFilePath = [uri]::EscapeUriString($DnDFile)
$VlcExe = $VlcPath + '\vlc.exe'
$Args = 'bluray:///' + $EscFilePath
Start-Process -FilePath $VlcExe -ArgumentList $Args
