Import-Csv -Path ".\ListUsersAD.csv" -Delimiter "," | ForEach-Object {

    $params = @{
        SamAccountName        = $_.SamAccountName
        UserPrincipalName     = $_.userPrincipalName
        Name                  = $_.Name
        DisplayName           = $_.Name
        GivenName             = $_.GivenName
        Surname               = $_.Surname
        Title                 = $_.Title
        Company               = $_.Company
        Department            = $_.Department
        EmailAddress          = $_.EmailAddress
        Description           = $_.Description
        Country               = $_.Country
        Path                  = "CN=Users,DC=jcastillo,DC=com"
        AccountPassword       = (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)
        Enabled               = $true
        PasswordNeverExpires  = $false
        ChangePasswordAtLogon = $true
        PassThru              = $true
        ErrorAction           = "Stop"
    }

    New-ADUser @params
}