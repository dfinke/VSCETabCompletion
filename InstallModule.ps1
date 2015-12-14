$ModuleName   = "VSCETabCompletion"
$ModulePath   = "C:\Program Files\WindowsPowerShell\Modules"
$TargetPath   = "$($ModulePath)\$($ModuleName)"

if(!(Test-Path $TargetPath)) { md $TargetPath | out-null}

$FilesToCopy = dir -ErrorAction ignore *.psm1, *.psd1

$FilesToCopy | ForEach {
    Copy-Item -Verbose -Path $_.FullName -Destination "$($TargetPath)\$($_.name)"
}