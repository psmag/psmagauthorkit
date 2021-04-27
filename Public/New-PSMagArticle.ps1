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
     $articleHeader = @"
---
$articleMeta
---
### Heading - First Level
All First level headings should start at H3 level.

#### Heading - Second Level
This is a second level heading.

### Code Snippets
Always enclose code snippets between a pair of ``````.

```
Get-ChildItem -Path C:\
```
### Images
Avoid images as much as possible. Instead, paste console output directly when dealing with command console.
If you must use images, always provide PNG format and insert the images using ```![](/images/thisisanimage.png)```

### Videos
You can insert YouTube videos using ```{{< youtube pxs-uk-XOws >}}```
"@

    $articleHeader | Out-File -FilePath "$DraftPath\${articleUrl}.md" -Force
}

