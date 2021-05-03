function New-PSMagAuthorPage {
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $AuthorName,

        [Parameter(Mandatory = $true)]
        [String]
        $Description,

        [Parameter()]
        [String]
        $Email,

        [Parameter()]
        [String]
        $Tagline = '',

        [Parameter()]
        [String]
        $Twitter = '#',

        [Parameter()]
        [String]
        $GitHub = '#',

        [Parameter()]
        [String]
        $Facebook = '#',

        [Parameter()]
        [String]
        $LinkedIn = '#',

        [Parameter()]
        [String]
        $Blog = '#',

        [Parameter()]
        [String]
        $YouTube = '#',

        [Parameter()]
        [String]
        $Twitch = '#',

        [Parameter(Mandatory = $true)]
        [String]
        $AuthorPagePath
    )

    $authorFileBaseName = "$($AuthorName.toLower() -replace '[^a-zA-Z0-9]','-')"
    $authorImage = "${authorFileBaseName}.jpg"
    if ($Email) {
        # Get gravatar image
        Get-GravatarImage -Email $Email -Path "${AuthorPagePath}\${authorImage}"
    }

    $authorObject = [Ordered]@{
        title       = $AuthorName
        description = $Tagline
        image       = "/images/author/${authorImage}"
        social      = @(
            [Ordered]@{
                icon = "fab fa-facebook"
                link = "https://facebook.com/${facebook}"
            },
            [Ordered]@{
                icon = "fab fa-twitter"
                link = "https://twitter.com/${twitter}"
            },
            [Ordered]@{
                icon = "fab fa-github"
                link = "https://github.com/${GitHub}"
            },
            [Ordered]@{
                icon = "fas fa-link"
                link = $Blog
            },
            [Ordered]@{
                icon = "fab fa-linkedin-in"
                link = "https://www.linkedin.com/in/${LinkedIn}/"
            },
            [Ordered]@{
                icon = "fab fa-youtube"
                link = $YouTube
            },
            [Ordered]@{
                icon = "fab fa-twitch"
                link = "https://www.twitch.tv/${Twitch}"
            }
        )
    }

    $authorMeta = ConvertTo-Yaml $authorObject
    $authorPage = @"
---
$authorMeta
---
$Description
"@

    $authorPage | Out-File -FilePath "$AuthorPagePath\${authorFileBaseName}.md" -Encoding utf8 -Force
}