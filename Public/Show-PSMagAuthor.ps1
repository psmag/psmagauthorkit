function Show-PSMagAuthor
{
    [CmdletBinding()]
    param 
    (

    )

    $authUrl = 'http://localhost:1313/author/index.xml'
    $authors = Invoke-RestMethod -Uri $authUrl -UseBasicParsing -ErrorAction Stop

    $authors | Select-Object @{Name="Name";Expression={$_.title}}, link
}