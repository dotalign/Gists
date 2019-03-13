New-Module -Name EnvSetup -ScriptBlock {
    # Install nuget
    $sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
    $targetNugetExe = ".\nuget.exe"
    Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
    
    echo $env:DotFeedUri
    
    Set-Alias nuget $targetNugetExe -Verbose
    
    # Add DotFeed as source
    Write-Host "========== Adding feed now ==========="
    
    Write-Host (nuget sources add -Name DotFeed -Source "https://dotalign.pkgs.visualstudio.com/_packaging/DotFeed/nuget/v3/index.json" -username buildAgent -password $env:BuildAgentDotFeedPassword -Verbosity Detailed)
    Write-Host (nuget sources list -Name DotFeed)
    Write-Host (nuget list -Source DotFeed -verbosity detailed)
}
