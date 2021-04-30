function Show-PSMagArticleCategory
{
    [CmdletBinding()]
    param 
    (

    )

    $catUrl = 'http://localhost:1313/categories/index.xml'
    $categories = Invoke-RestMethod -Uri $catUrl -UseBasicParsing -ErrorAction Stop

    $categories | Select-Object title, link
}