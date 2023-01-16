powershell -command "$esc_file_path = [uri]::EscapeUriString('%~f1');$args = 'bluray:///' + $esc_file_path;Start-Process -FilePath 'C:\Program Files\VideoLAN\VLC\vlc.exe' -ArgumentList $args;"
exit