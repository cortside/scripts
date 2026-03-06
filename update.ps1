cp c:\work\cortside\cortside.templates\templates\api\.gitignore
cp c:\work\cortside\cortside.templates\templates\api\.gitattributes

cp c:\work\cortside\cortside.templates\templates\api\clean.ps1
cp c:\work\cortside\cortside.templates\templates\api\create-release.ps1
cp c:\work\cortside\cortside.templates\templates\api\dependabot.ps1
cp c:\work\cortside\cortside.templates\templates\api\generate-changelog.ps1
cp c:\work\cortside\cortside.templates\templates\api\prebuild.ps1
cp c:\work\cortside\cortside.templates\templates\api\src\coverlet.runsettings.xml src
cp c:\work\cortside\cortside.templates\templates\api\update-nugetpackages.ps1

git add .gitignore
git add .gitattributes
git add clean.ps1
git add create-release.ps1 
git add dependabot.ps1
git add generate-changelog.ps1 
git add prebuild.ps1
git add src/coverlet.runsettings.xml
git add update-nugetpackages.ps1

rm nuget.config
rm pack.ps1
git add nuget.config
git add pack.ps1

if (Test-Path 'src/config.json.example') {
	rm src/config.json.example
	git add src/config.json.example
}
.\prebuild.ps1
