#!/usr/bin/env bash
set -euo pipefail

pwsh -File ../scripts/update-librarybuild.ps1
pwsh -File ../scripts/update-scripts.ps1
pwsh -File ./update-nugetpackages.ps1
pwsh -File ./clean.ps1
dotnet build src
dotnet test src

pwsh -File ./format.ps1
dotnet build src
dotnet test src
