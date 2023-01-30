[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$form = New-Object System.Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(450,250)
$form.Text = "Extract Magnets from RSS"

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,10)
$textBox.Size = New-Object System.Drawing.Size(400,20)
$form.Controls.Add($textBox)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(150,40)
$button.Size = New-Object System.Drawing.Size(150,30)
$button.Text = "Extract"
$button.Add_Click({
    $xml = [xml](Invoke-WebRequest -Uri $textBox.Text).Content
    $magnets = ($xml.SelectNodes("//item/enclosure")).Url
    $richTextBox.Lines = $magnets
})
$form.Controls.Add($button)

$richTextBox = New-Object System.Windows.Forms.RichTextBox
$richTextBox.Location = New-Object System.Drawing.Point(10,80)
$richTextBox.Size = New-Object System.Drawing.Size(400,150)
$form.Controls.Add($richTextBox)

$form.ShowDialog()
