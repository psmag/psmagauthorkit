function Show-PSMagArticleTag
{
    [CmdletBinding()]
    param 
    (

    )

    $tagUrl = 'http://localhost:1313/tags/index.xml'
    $tags = Invoke-RestMethod -Uri $tagUrl -UseBasicParsing -ErrorAction Stop

    $tags | Select-Object title, link
}