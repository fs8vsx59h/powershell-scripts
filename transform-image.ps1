#!/bin/pwsh
$ITEMS = Get-ChildItem -Path $PWD\* -Include *.png 
foreach ($ITEM in $ITEMS) {
    Write-Output "$ITEM is transcoding to webp."
    $ITEMNEW =  $ITEM.NameString.Replace('png','webp')
    ffmpeg -i $ITEM -lossless 1 "$ITEMNEW"
    Remove-Item $ITEM
}
