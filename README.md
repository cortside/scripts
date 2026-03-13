# scripts
Utilitarian and helper scripts

# build order of libraries
amqptools
Cortside.Bowdlerizer
serilog.bowdlerizer
Cortside.Common
Cortside.Health
Cortside.DomainEvent
Cortside.MockServer
Cortside.RestApiClient
Cortside.AspNetCore

Steps to update and validate
```powershell
..\scripts\update-librarybuild.ps1
..\scripts\update-scripts.ps1
.\update-nugetpackages.ps1
.\clean.ps1
dotnet build src
dotnet test src

./format.ps1
dotnet build src
dotnet test src
```

Create a new release
```powershell
./create-release.ps1
```
