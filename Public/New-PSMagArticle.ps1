function New-PSMagArticle
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $Title,

        [Parameter(Mandatory = $true)]
        [String]
        $AuthorName,

        [Parameter(Mandatory = $true)]
        [String]
        $DraftPath,

        [Parameter()]
        [String[]]
        $Category = @(),

        [Parameter()]
        [String[]]
        $Tag = @()
    )

    $privatePath = "$(Split-Path -Path $PSScriptRoot -Parent)\Private"
    $tentativePublishDate = Get-Date (Get-Date).AddDays(5) -Format yyyy-MM-dd
    $cleanTitle = ($Title -replace '[^a-zA-Z0-9\s]', '') -replace '[^a-zA-Z0-9]','-'

    $articleFileName = "${tentativePublishDate}-${cleanTitle}.md"
    $articleUrl = "/$(($tentativePublishDate).Replace('-','/'))/${cleanTitle}/"
    
    $draftObject = [Ordered]@{
        title = $Title
        author = $AuthorName
        type = 'regular'
        date = $tentativePublishDate
        url = $articleUrl
        categories = $Category
        tags = $Tag
        draft = $true
    }

     $articleMeta = ConvertTo-Yaml $draftObject
     $draftContent = Get-Content -Path "$privatePath\draftContent.txt" -Raw
     $articleHeader = @"
---
$articleMeta
---
$draftContent
"@

    $articleHeader | Out-File -FilePath "$DraftPath\${articleFileName}" -Encoding utf8 -Force
}
