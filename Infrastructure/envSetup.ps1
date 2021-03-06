New-Module -Name EnvSetup -ScriptBlock {
    # Install nuget
    $sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
    $targetNugetExe = ".\nuget.exe"
    Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
    Set-Alias nuget $targetNugetExe -Verbose
    
    # Add DotFeed as source
    nuget sources add -Name DotFeed -Source $env:DotFeedUri -username buildAgent -password $env:DotFeedPassword | Write-Host
    # Make sure we can access DotFeed
    nuget sources list -Name DotFeed | Write-Host
    nuget list Dot. -Source DotFeed | Write-Host
}
