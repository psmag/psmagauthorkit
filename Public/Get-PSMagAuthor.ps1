function Get-PSMagAuthor {
    [CmdletBinding()]
    param 
    (

    )

    $authUrl = 'https://powershellmagazine.com/author/index.xml'
    $authors = Invoke-RestMethod -Uri $authUrl -UseBasicParsing -ErrorAction Stop

    $authors | Select-Object @{Name = "Name"; Expression = { $_.title } }, link
}