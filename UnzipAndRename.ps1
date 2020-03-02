$files = Get-ChildItem -name -filter *.zip

foreach ($file in $files){
    Expand-Archive -Path $file
}

$directories = dir -Directory -name

foreach ($dir in $directories){
    $newName = $dir.Replace("-SingleFile", "")
    $children = Get-ChildItem -name $dir
    foreach ($file in $children){
        Rename-Item $dir/$file $newName".pdf"
        Move-Item $dir/$newName".pdf" ./
    }
}

New-Item -Path ./ -Name "originalZips" -ItemType "directory"

foreach ($file in $files){
    Move-Item $file -Destination ".\originalZips\"
}