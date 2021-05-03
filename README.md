# PowerShell Magazine Author Toolkit
PowerShell Magazine moved from WordPress platform to a statically generated GitHub pages based platform. We use Hugo to compile markdown content to HTML and host that on GitHub pages. With this, every article and page on PowerShell Magazine will be written as a markdown file and the theme that we implemented has certain requirement in terms of the markdown frontmatter. We expect our contributing authors to follow a set of style guidelines to ensure that articles on this site are similarly formatted and easy to follow and read. To help our authors in the authoring process and ensure our publishing process is smooth, we came up with the idea of a PowerShell module called [PSMagAuthorKit](https://github.com/psmag/psmagauthorkit). We only offer limited functionality at this point in time but have plans to extend it to add more value.

You can download this module from PowerShell gallery.

```powershell
Install-Module -Name PSMagAuthorKit
```

Today, this module offers five commands.

### Create an article draft

You create an article draft using the `New-PSMagArticle` command. This command has the following parameters.

| Parameter Name | Required? | Description                                                  |
| -------------- | --------- | ------------------------------------------------------------ |
| Title          | Yes       | Title of the article. There is no limit on size that we impose today but try to limit it to not more than 30 characters. |
| AuthorName     | Yes       | Name of the author.                                          |
| DraftPath      | Yes       | Where you want to store the generated markdown file. This is only the folder path where the .md file will be stored. |
| Category       | No        | An array of category names. You can use the `Get-PSMagArticleCategory` command to get a list of categories that are already present. |
| Tag            | No        | An array of article tags. You can use the `Get-PSMagArticleTag` command to get a list of tags that are already present. |

For categories and tags, you can either leave them blank or add something that you think is missing. We will review the list and let you know our decision during publishing process.

```
New-PSMagArticle -Title 'This is an awesome article' -AuthorName 'Awesome Author' -DraftPath C:\Content
```

Do not include any hashtags in the title of the article. We will add those at the time of publishing.

### Create an author page

If you are a new PowerShell Magazine author or an existing featured author, you can use the `New-PSMagAuthorPage` command to create an author page and share it with us for an update on the site. This command has the following parameters.

| Parameter Name | Required | Description                                                  |
| -------------- | -------- | ------------------------------------------------------------ |
| AuthorName     | Yes      | Name of the author as it should appear on PowerShell Magazine. If you are an existing author and want to update the social media links or tagline or description, ensure you use the `Get-PSMagAuthor` command to see how your name is displayed today. While we can technically update all your articles to reflect the name of your choice, it is an overhead and requires careful updates. |
| Description    | Yes      | Your bio or your professional summary that you want PowerShell Manazine readers to see. There is no character limit but it is recommended to keep this concise. |
| Email          | No       | This must be your email ID registered with Gravatar. We don't store your email ID anywhere. We just use that in this command to retrieve your Gravatar and use it as an author image. If you don't have a Gravatar or want to use a different image, you can simply share that with us as a JPEG or PNG. |
| Tagline        | No       | This is the tagline that will appear under your name on the author page. |
| Twitter        | No       | This is your Twitter handle. You should only mention the username and not the complete URL. |
| GitHub         | No       | This is your GitHub handle. You should only mention the username and not the full URL. |
| Facebook       | No       | This is your Facebook username. You should only mention the username and not the full URL. |
| LinkedIn       | No       | This is the LinkedIn profile name. You should only mention the profilename and not the full URL. |
| Blog           | No       | This is your blog URL.                                       |
| YouTube        | No       | This is your YouTube channel URL.                            |
| Twitch         | No       | This is your Twitch username and not the complete URL.       |
| AuthorPagePath | Yes      | This is the folder where you want to store the generated author page. |

Whether you choose to use the Gravatar or a separate author image, you must send both author page and author image to editors@powershellmagazine.com.

### Get a list of all existing categories

You can use `Get-PSMagArticleCategory` command to retrieve a list of all existing article categories from PowerShell Magazine. This command has no parameters.

### Get a list of all existing tags

You can use `Get-PSMagArticleTag` command to retrieve a list of all existing article tags from PowerShell Magazine. This command has no parameters.

### Get a list of all featured authors

The `Get-PSMagAuthor` command to retrieve a list of all featured authors and their author page URLs. Use this command to retrieve your author page and verify the social links.

