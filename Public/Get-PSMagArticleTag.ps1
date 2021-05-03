function Get-PSMagArticleTag {
    [CmdletBinding()]
    param 
    (

    )

    $tagUrl = 'https://powershellmagazine.com/tags/index.xml'
    $tags = Invoke-RestMethod -Uri $tagUrl -UseBasicParsing -ErrorAction Stop

    $tags | Select-Object @{Name = "Tag"; Expression = { $_.title } }, link
}