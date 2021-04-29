function Get-GravatarImage
{
    [CmdletBinding()]
    param 
    (
        [Parameter(Mandatory = $true)]
        [String]
        $Email,

        [Parameter()]
        [ValidateRange(1,1024)]
        [Int]
        $Size = 300,

        [Parameter(Mandatory = $true)]
        [String]
        $Path
    )

    # Get hash of email address
    $string = $Email.ToLower()
    $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $utf8 = New-Object -TypeName System.Text.UTF8Encoding
    $hash = ([System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($string)))).ToLower().Replace('-','')

    # Create a request for avatar image
    $avatarUrl = "https://gravatar.com/avatar/${hash}?s=${Size}&d=identicon"
    Invoke-WebRequest -Uri $avatarUrl -UseBasicParsing -OutFile $Path
}