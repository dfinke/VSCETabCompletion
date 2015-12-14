
$p = @{
    Name = "VSCETabCompletion"
    NuGetApiKey = $NuGetApiKey
    LicenseUri = "https://github.com/dfinke/VSCETabCompletion/blob/master/LICENSE.txt"
    Tag = "TabCompletion","vsce"
    ReleaseNote = "Enables tab completion for vsce commands"
    ProjectUri = "https://github.com/dfinke/VSCETabCompletion"
}

Publish-Module @p