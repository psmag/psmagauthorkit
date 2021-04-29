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
        $DraftPath
    )

    $privatePath = "$(Split-Path -Path $PSScriptRoot -Parent)\Private"
    $tentativePublishDate = Get-Date (Get-Date).AddDays(5) -Format yyyy-MM-dd
    $articleUrl = "${tentativePublishDate}-$($Title.ToLower() -replace ' ','-')"
    $draftObject = [Ordered]@{
        title = $Title
        author = $AuthorName
        type = 'regular'
        date = $tentativePublishDate
        url = $articleUrl
        categories = @()
        tags = @()
    }

     $articleMeta = ConvertTo-Yaml $draftObject
     $draftContent = Get-Content -Path "$privatePath\draftContent.txt" -Raw
     $articleHeader = @"
---
$articleMeta
---
$draftContent
"@

    $articleHeader | Out-File -FilePath "$DraftPath\${articleUrl}.md" -Force
}

