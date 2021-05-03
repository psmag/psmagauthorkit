function Get-PSMagArticleCategory {
    [CmdletBinding()]
    param 
    (

    )

    $catUrl = 'https://powershellmagazine.com/categories/index.xml'
    $categories = Invoke-RestMethod -Uri $catUrl -UseBasicParsing -ErrorAction Stop

    $categories | Select-Object @{Name = "Category"; Expression = { $_.title } }, link
}