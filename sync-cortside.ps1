#####
## Sync cortside repos by mirroring github repo and pushing to backup remote in bitbucket
#####

function Get-TimeStamp {
    $timestamp = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
	echo $timestamp
}

$repos = @( 
	@{ origin="https://github.com/cortside/cortside.identityserver4"; name="cortside.identityserver4"; backup="https://corteb@bitbucket.org/enerbank/cortside.identityserver4.git" },
	@{ origin="https://github.com/cortside/cortside.identityserver4.accesstokenvalidation"; name="cortside.identityserver4.accesstokenvalidation"; backup="https://corteb@bitbucket.org/enerbank/cortside.identityserver4.accesstokenvalidation.git" },
	@{ origin="https://github.com/cortside/amqptools.git"; name="amqptools"; backup="https://corteb@bitbucket.org/enerbank/cortside.amqptools.git" },
	@{ origin="https://github.com/cortside/coeus.git"; name="coeus"; backup="https://corteb@bitbucket.org/enerbank/cortside.coeus.git" },
	@{ origin="https://github.com/cortside/cortside.aspnetcore.git"; name="cortside.aspnetcore"; backup="https://corteb@bitbucket.org/enerbank/cortside.aspnetcore.git" },
	@{ origin="https://github.com/cortside/cortside.bowdlerizer.git"; name="cortside.bowdlerizer"; backup="https://corteb@bitbucket.org/enerbank/cortside.bowdlerizer.git" },
	@{ origin="https://github.com/cortside/cortside.common.git"; name="cortside.common"; backup="https://corteb@bitbucket.org/enerbank/cortside.common.git" },
	@{ origin="https://github.com/cortside/cortside.domainevent.git"; name="cortside.domainevent"; backup="https://corteb@bitbucket.org/enerbank/cortside.domainevent.git" },
	@{ origin="https://github.com/cortside/cortside.health.git"; name="cortside.health"; backup="https://corteb@bitbucket.org/enerbank/cortside.health.git" },
	@{ origin="https://github.com/cortside/cortside.healthmonitor.git"; name="cortside.healthmonitor"; backup="https://corteb@bitbucket.org/enerbank/cortside.healthmonitor.git" },
	@{ origin="https://github.com/cortside/cortside.mockserver.git"; name="cortside.mockserver"; backup="https://corteb@bitbucket.org/enerbank/cortside.mockserver.git" },
	@{ origin="https://github.com/cortside/cortside.restapiclient.git"; name="cortside.restapiclient"; backup="https://corteb@bitbucket.org/enerbank/cortside.restapiclient.git" },
	@{ origin="https://github.com/cortside/cortside.sqlreportapi.git"; name="cortside.sqlreportapi"; backup="https://corteb@bitbucket.org/enerbank/cortside.sqlreportapi.git" },
	@{ origin="https://github.com/cortside/cortside.templates.git"; name="cortside.templates"; backup="https://corteb@bitbucket.org/enerbank/cortside.templates.git" },
	@{ origin="https://github.com/cortside/guidelines.git"; name="guidelines"; backup="https://corteb@bitbucket.org/enerbank/cortside.guidelines.git" },
	@{ origin="https://github.com/cortside/serilog.bowdlerizer.git"; name="serilog.bowdlerizer"; backup="https://corteb@bitbucket.org/enerbank/serilog.bowdlerizer.git" }
)

Get-TimeStamp

foreach ($repo in $repos) {
	Write-Host "repo: $($repo.Name) - from $($repo.origin) to $($repo.backup)"	
	if (!(Test-Path cortside)) { mkdir cortside }
	cd cortside
	if (!(Test-Path $repo.name)) { 
		git clone --mirror $repo.origin $repo.name
		cd $repo.name
		git remote add --mirror=fetch backup $repo.backup
		cd ..
	}
	cd ..
}	

## -----------------------------------------

$dirs = @()
$dirs += dir cortside | ?{$_.PSISContainer}

$root = "$($PSScriptRoot)\"
$dirs | ForEach-Object { $path = $_.FullName.replace($root, ""); echo $path }
echo "------------------"
echo ""
echo "=================="

foreach ($dir in $dirs) {
	# write directly to host so that progress when stdout is captured can be monitored
	Write-Host "---------------------"
	Write-Host "repo: $($dir.Name)"
	Write-Host "---------------------"	

	$path = $dir.FullName.replace($root, "")
	echo $path
	echo "=================="
	Get-TimeStamp
	cd $path

	git fetch origin
	git push backup --all
	
	echo "------------------"
	echo ""
	echo "=================="
	cd ../..
}

Get-TimeStamp
