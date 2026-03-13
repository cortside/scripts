#Copy-Item ..\coeus\shoppingcart-api\.gitignore .
Copy-Item ..\coeus\shoppingcart-api\.gitattributes .

# This will force git to recheck and "reapply" gitattributes changes.
git rm --cached -r .
git add -A

Copy-Item ..\coeus\shoppingcart-api\build.ps1 .
Copy-Item ..\coeus\shoppingcart-api\clean.ps1 .
Copy-Item ..\coeus\shoppingcart-api\create-release.ps1 .
Copy-Item ..\coeus\shoppingcart-api\format.ps1 .
Copy-Item ..\coeus\shoppingcart-api\generate-changelog.ps1 .
Copy-Item ..\coeus\shoppingcart-api\update-nugetpackages.ps1 .
Copy-Item ..\coeus\shoppingcart-api\src\.editorconfig .\src\.editorconfig
Copy-Item ..\coeus\shoppingcart-api\repository.psm1 .
Copy-Item ..\coeus\shoppingcart-api\coverage.ps1 .

Copy-Item ..\coeus\shoppingcart-api\src\.editorconfig .\src\.editorconfig
Copy-Item ..\coeus\shoppingcart-api\src\coverlet.runsettings.xml .\src\coverlet.runsettings.xml
