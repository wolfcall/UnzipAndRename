$files = Get-ChildItem -name -filter *.zip

$unzippedName = @()

foreach ($file in $files){
    $unzippedName += $file.Replace(".zip", ".pdf")
}

echo $unzippedName