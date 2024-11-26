$user = 'admin'
$pass = 'admin'

$pair = "$($user):$($pass)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $encodedCreds"

$Headers = @{
    Authorization = $basicAuthValue
}

write-output (gc welcome.txt)
start-sleep 2
write-output (gc welcome.txt | measure -word)
start-sleep 2
write-output (netstat -ano)
start-sleep 2
write-output (iwr http://127.0.0.1:1225)
start-sleep 2
write-output (iwr http://127.0.0.1:1225 -Headers $Headers)
start-sleep 2
#(iwr http://127.0.0.1:1225 -Headers $Headers).links.href | %{(iwr $_)} | %{if(($_.content | measure -word ).words -eq 138){$_.content}}
#start-sleep 1
#(iwr http://127.0.0.1:1225/token_overview.csv -Headers $Headers).content
#start-sleep 1
#$sha = ((iwr http://127.0.0.1:1225/token_overview.csv -Headers $Headers).content.split("`n") | ?{$_ -notlike "#*" -and $_ -notlike "*REDACTED*" -and $_ -notlike "file_MD5hash*"}).split(",")[1]
#start-sleep 1
#iwr -Headers $Headers http://127.0.0.1:1225/tokens/$sha
#start-sleep 1
