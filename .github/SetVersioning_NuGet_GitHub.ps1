$rev = $env:GITHUB_RUN_NUMBER
Write-Host "rev number is " $rev

$branch = $env:GITHUB_REF;

if($branch -like '*feature*'){
    #get the branch name from the last / 
    $featureName = $branch.Substring($branch.LastIndexOf('/')+1)
    $ver = -join("1.0.", $featureName, ".", $rev)
} else {
    $ver = -join("1.0.", $rev)
}
echo "NUGET_VERSION=$($ver)" >> $GITHUB_ENV
#Lets try setting an output parameter
Write-Host "ver = $($ver)"
echo "::set-output name=NUGET_VERSION::$($ver)"
echo "::set-output name=RELEASE_NAME::$($ver)"