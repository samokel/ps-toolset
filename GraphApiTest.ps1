$certId = "b2d6e8ae-44e8-4ef2-a5d7-4793b6292eed"
$tenantId = "7c2cecbb-4b12-4725-936b-ece52d4302a3"
$clientId = "d897e32e-db83-434d-ad82-70529cccc035"
$certThumbprint = "C5248311549A3D7B277C35B3AC3226869E13D4FA"
$clientCert = Get-ChildItem Cert:\CurrentUser\My\C5248311549A3D7B277C35B3AC3226869E13D4FA

Connect-MgGraph -ClientID $clientId -TenantId $tenantId -CertificateThumbprint $certThumbprint

Disconnect-MgGraph

Get-MgContext

Import-Module Microsoft.Graph.Users

Get-MgUser -Filter "DisplayName eq 'Amanda Morgan'"

(Get-MgUser -Filter "DisplayName eq 'Amanda Morgan'").LastPasswordChangeDateTime

$accessToken = Get-MsalToken -ClientId $clientId -TenantId $tenantId -ClientCertificate $clientCert | Select-Object -Property AccessToken

$accessToken.AccessToken | Get-JWTDetails