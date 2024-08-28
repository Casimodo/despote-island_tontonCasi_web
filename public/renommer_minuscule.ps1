# Vérifier si un dossier est passé en argument
param (
    [string]$FolderPath
)

if (-not $FolderPath) {
    Write-Host "Usage: .\renommer_minuscule.ps1 -FolderPath <chemin_vers_dossier>"
    exit
}

# Vérifier si le dossier existe
if (-not (Test-Path $FolderPath -PathType Container)) {
    Write-Host "Le dossier '$FolderPath' n'existe pas."
    exit
}

# Parcourir tous les fichiers du dossier
Get-ChildItem -Path $FolderPath -File | ForEach-Object {
    $filename = $_.Name
    $lowercase = $filename.ToLower()
    # Renommer le fichier si le nom en minuscule est différent
    
        Rename-Item -Path $_.FullName -NewName $lowercase
        Write-Host "Renommé : $filename -> $lowercase"
    
}

Write-Host "Tous les fichiers ont été renommés en minuscule."
