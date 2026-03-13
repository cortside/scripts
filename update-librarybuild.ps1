# create .env file for sonar if it does not exist
if (-Not (Test-Path -Path .env)) {
	$project = (grep "SONAR_PROJECT:" .\appveyor.yml)
	$project = $project.replace(": ", "=");
	$project = $project.replace(":", "=");
	$project.Trim() > .env
}

Copy-Item ../amqptools/.env.local
Copy-Item ../amqptools/.gitignore
Copy-Item ../amqptools/appveyor.yml
Copy-Item ../amqptools/appveyor-build.ps1
Copy-Item ../amqptools/appveyor.yml
Copy-Item ../amqptools/dotenv.ps1

Remove-Item update-scripts.ps1 -ErrorAction Ignore
Remove-Item update-targetframework.ps1 -ErrorAction Ignore

Write-Output "Updated"
