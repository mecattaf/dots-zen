#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Akiflow productivity
Exec=flatpak run --command=/app/bin/chrome com.google.Chrome --profile-directory=Default --app=https://web.akiflow.com/
Icon=akiflow
