function Get-GravatarProfile {
    [CmdletBinding()]
    param 
    (
        [Parameter(Mandatory = $true)]
        [String]
        $Email,

        [Parameter()]
        [String]
        $Path,

        [Parameter()]
        [Switch]
        $Passthru
    )

    # Get hash of email address
    $string = $Email.ToLower()
    $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $utf8 = New-Object -TypeName System.Text.UTF8Encoding
    $hash = ([System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($string)))).ToLower().Replace('-', '')

    # Create a request for profile JSON
    $profileUrl = "https://gravatar.com/${hash}.json"
    $response = Invoke-RestMethod -Uri $profileUrl -UseBasicParsing -ErrorAction SilentlyContinue

    if ($response) {
        if ($Passthru) {
            return $response.entry
        }
        else {
            $response.entry | ConvertTo-Json | Out-File -FilePath $Path -Force
        }
    }
    else {
        throw "Specified email has no associated Gravatar profile"    
    }
}