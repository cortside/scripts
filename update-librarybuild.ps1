if (-Not (Test-Path -Path .env)) {
	$project = (grep "SONAR_PROJECT:" .\appveyor.yml)
	$project = $project.replace(": ", "=");
	$project = $project.replace(":", "=");
	$project.Trim() > .env
}

cp ../cortside.bowdlerizer/.env.local
cp ../cortside.bowdlerizer/.gitignore
cp ../cortside.bowdlerizer/appveyor.yml
cp ../cortside.bowdlerizer/appveyor-build.ps1
cp ../cortside.bowdlerizer/appveyor.yml
cp ../cortside.bowdlerizer/dotenv.ps1

rm update-scripts.ps1
rm update-targetframework.ps1

..\coeus\shoppingcart-api\update-targetframework.ps1
..\coeus\shoppingcart-api\update-scripts.ps1

.\update-nugetpackages.ps1 -NoVersionLock
dotnet outdated ./src --include Cortside --pre-release Always --upgrade
./format.ps1
