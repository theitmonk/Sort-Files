$spath="C:\Users\AjithSadanandan\Downloads\"
$dpath="C:\Users\AjithSadanandan\Downloads\"
$files = Get-ChildItem -Recurse -File -Path $spath

$files | ForEach-Object {
    $_.Name
    $sp = $_.Name -split '\.'
    $ext = $sp[$sp.length-1]
    $ext
    if (!(Test-Path "$dpath$ext"))
        {
            New-Item -ItemType Directory -Path "$dpath" -Name $ext -Force
        }
    $_.FullName
    Move-Item $_.FullName "$dpath$ext" -Force
}