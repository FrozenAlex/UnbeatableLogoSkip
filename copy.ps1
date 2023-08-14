# Build and copy the plugin to the game folder for testing

dotnet build 

# If the build fails, stop the script
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

# Kill game Process
Stop-Process -Name "UNBEATABLE*" 

# Wait for game to close
Start-Sleep -s 2

Copy-Item .\bin\Debug\netstandard2.0\UnbeatableLogoSkip.dll "D:\SteamLibrary\steamapps\common\UNBEATABLE [white label]\BepInEx\plugins\" -Force

# Start game
Start-Process "D:\SteamLibrary\steamapps\common\UNBEATABLE [white label]\UNBEATABLE [white label].exe"