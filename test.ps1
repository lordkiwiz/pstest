$user = 'admin'
$pass = 'admin'

$pair = "$($user):$($pass)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $encodedCreds"

$Headers = @{
    Authorization = $basicAuthValue
}

gc welcome.txt
gc welcome.txt | measure -word
netstat -ano
iwr http://127.0.0.1:1225 -headers $headers
