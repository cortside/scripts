gci *.csproj -Recurse | %{ 
	if (select-string -inputobject $_ -Pattern "FluentAssertions") { 
		echo "remove AsyncAnalyzers from $_.Fullname"; 
		dotnet remove $_.FullName package AsyncAnalyzers 
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
