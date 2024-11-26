$user = 'admin'
$pass = 'admin'

$pair = "$($user):$($pass)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $encodedCreds"

$Headers = @{
    Authorization = $basicAuthValue
}

(iwr http://127.0.0.1:1225 -Headers $Headers).links.href | %{(iwr $_)} | %{if(($_.content | measure -word ).words -eq 138){$_.content}}
(iwr http://127.0.0.1:1225/token_overview.csv -Headers $Headers).content
