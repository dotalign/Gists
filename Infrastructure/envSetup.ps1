New-Module -Name EnvSetup -ScriptBlock {
    # Install nuget
    $sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
    $targetNugetExe = ".\nuget.exe"
    Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
    
    echo $env:DotFeedUri
    
    Set-Alias nuget $targetNugetExe -Scope Global -Verbose
    
    # Add DotFeed as source
    nuget sources add -Name DotFeed -Source $env:DotFeedUri -username buildAgent -password $env:DotFeedPassword -Verbose
    nuget sources list
}
