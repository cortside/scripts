## another script that attempts to do the same thing, that i couldn't get to work with pathing
## https://github.com/galadril/Shouldly.FromFluentAssertions/blob/main/migrate_fluentassertions_shouldly.ps1

gci *.csproj -Recurse | %{ 
	if (select-string -inputobject $_ -Pattern "FluentAssertions") { 
		echo "remove FluentAssertions from $_.Fullname"; 
		dotnet remove $_.FullName package FluentAssertions
		dotnet add $_.FullName package Shouldly
	}
}

Get-ChildItem *.cs -Recurse -File | ForEach-Object {
    (Get-Content $_) -replace 'using FluentAssertions;', 'using Shouldly;' | Set-Content $_.FullName
}

Get-ChildItem *.cs -Recurse -File | ForEach-Object {
    (Get-Content $_) -replace '\.Should\(\)\.', '.Should' | Set-Content $_.FullName
}

Get-ChildItem *.cs -Recurse -File | ForEach-Object {
    (Get-Content $_) -replace '\.ShouldBeCloseTo\(', '.ShouldBe(' | Set-Content $_.FullName
}


$message = @"
Other things to watch out for that are type dependent and can't be just text replaced:
 * Guid.ShouldNotBeEmpty()  ==> ShouldNotBe(Guid.Empty);
"@

Write-Output $message
