$ITEMS = Get-ChildItem -Path $PWD\* -Include *.mp4
foreach ($ITEM in $ITEMS) {
    Write-Output "Using age encrypt your file: $ITEM"
    age.exe -R "Your SSH pub" -o "$ITEM.age" "$ITEM"
}
