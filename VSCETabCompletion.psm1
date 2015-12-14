Import-Module TabExpansionPlusPlus

function VSCECompletion {
    param($wordToComplete, $commandAst)

    Set-Alias -Name nct -Value New-CommandTree

    function Get-VSCEPublishers {
        nct {
            param($wordToComplete, $commandAst)

            vsce ls-publishers |
                ForEach {
                    New-CompletionResult $_ "Publisher: $($_)"
                }
        }
    }

    $commandTree = & {
        nct ls "Lists all the files that will be published"
        nct publish "Publishes an extension"

        nct package "Packages an extension" {
            nct -Argument "--out" "Location of the package"
            nct -Argument "--baseContentUrl" "If found, all relative links in README.md will be prepended with this url"
            nct -Argument "--baseImagesUrl" "If found, all relative image links in README.md will be prepended with this url"
        }

        nct ls-publishers "List all known publishers"
        nct create-publisher "Creates a new publisher"

        nct delete-publisher "Deletes a publisher" {
            Get-VSCEPublishers
        }

        nct list "Lists all extensions published by the given publisher" {
            Get-VSCEPublishers
        }

        nct login "Add a publisher to the known publishers list" {
            Get-VSCEPublishers
        }

        nct logout "Remove a publisher from the known publishers list" {
            Get-VSCEPublishers
        }
    }

    Get-CommandTreeCompletion $wordToComplete $commandAst $commandTree
}

VSCECompletion

Register-ArgumentCompleter -Command 'vsce' -Native -ScriptBlock $function:VSCECompletion -Description 'Complete parameters and arguments to vsce.cmd'