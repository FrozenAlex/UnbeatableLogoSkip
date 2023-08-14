Param(
    [String]$zipName=""
)

if ($zipName -eq "")
{
    Write-Output "Give a proper name for a zip and try again"
    exit
}

# Build release
dotnet build --configuration Release

$mod = "./bin/Release/netstandard2.0/UnbeatableLogoSkip.dll"
$filelist = @($mod)

$zip = "./$zipName.zip"

if (Test-Path $zip) {
    Remove-Item -Path $zip -Force 
}

# Create temp dir
$dir = New-Item -ItemType Directory -Path "./temp" -Force

# Create dir BepInEx in temp dir
$bepinexDir =  New-Item -ItemType Directory -Path "./temp/BepInEx" -Force

# Create dir plugins in BepInEx dir
$pluginsDir = New-Item -ItemType Directory -Path "./temp/BepInEx/plugins" -Force


# Copy files to temp dir
Copy-Item -Path $filelist -Destination $pluginsDir -Force

# Compress release
Compress-Archive -Path $bepinexDir -DestinationPath $zip -Update

# Remove temp dir
Remove-Item -Path $dir -Force -Recurse
