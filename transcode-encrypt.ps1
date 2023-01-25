$ORIPATH = ""
$VIDEOFORMATE = ""
$DESFORMAT = ""
$AGEKEY = ""

# transcode 
$VIDEOS = Get-ChildItem -Path "$ORIPATH\*"  -Include "*.$VIDEOFORMATE"
foreach ( $VIDEO in $VIDEOS ) {
    Write-Output "Transcoding Video: $VIDEO"
    $VIDEONEWNAME = $VIDEO.NameString.Replace("$VIDEOFORMATE","ffmpeg-transcoded.$DESFORMAT")
    ffmpeg -hwaccel cuda -i  $VIDEO -vcodec "libx265" -acodec copy "$ORIPATH\$VIDEONEWNAME"
}

# encrypt
$ORIAGES = Get-ChildItem -Path "$ORIPATH\*"  -Include "*ffmpeg-transcoded*"
foreach ($ORIAGE in $ORIAGES) {
    Write-Output "Age is encrypt file: $ORIAGE"
    age -R "$AGEKEY" -o "$ORIAGE.age" $ORIAGE
}
