<# : B
@echo off && setlocal && cd %~dp0
powershell -nol -nop -ex bypass -c "iex $($PSScriptName='%~nx0';$file='%~f1';type '%~dpf0' -raw)"
endlocal && goto:eof
#>
$PSScriptRoot = (gl).Path
try{
	$VlcPath = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\VideoLAN\VLC' -Name InstallDir -ErrorAction Stop
}catch [System.Exception]{
	$VlcPath = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\WOW6432Node\VideoLAN\VLC' -Name InstallDir
}
$esc_file_path = [uri]::EscapeUriString($file)
$VlcExe = $VlcPath + '\vlc.exe'
$args = 'bluray:///' + $esc_file_path
Start-Process -FilePath $VlcExe -ArgumentList $args
