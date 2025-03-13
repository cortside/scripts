#cp ..\coeus\shoppingcart-api\.gitignore
cp ..\coeus\shoppingcart-api\.gitattributes

# This will force git to recheck and "reapply" gitattributes changes.
git rm --cached -r .
git add -A

cp ..\coeus\shoppingcart-api\build.ps1
cp ..\coeus\shoppingcart-api\clean.ps1
cp ..\coeus\shoppingcart-api\create-release.ps1
cp ..\coeus\shoppingcart-api\format.ps1
cp ..\coeus\shoppingcart-api\generate-changelog.ps1
cp ..\coeus\shoppingcart-api\update-nugetpackages.ps1
cp ..\coeus\shoppingcart-api\src\.editorconfig .\src\.editorconfig
cp ..\coeus\shoppingcart-api\Repository.psm1
cp ..\coeus\shoppingcart-api\coverage.ps1

cp ..\coeus\shoppingcart-api\src\.editorconfig .\src\.editorconfig
cp ..\coeus\shoppingcart-api\src\coverlet.runsettings.xml .\src\coverlet.runsettings.xml
