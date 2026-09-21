Import-Csv .\ListUsersAD.csv | foreach-object { 

New-ADUser ` 
            -SamAccountName $_.SamAccountName `
            -UserPrincipalName $_.userPrincipalName ` 
            -Name $_.name `
            -DisplayName $_.name ` 
            -GivenName $_.GivenName ` 
            -Surname $_.SurName `
            -Title $_.Title `
            -Company $_.Company ` 
            -Department $_.Department ` 
            -EmailAddress $_.EmailAddress ` 
            -Description $_.Description `
            -Country $_.Country `
            -Path "OU=Usuarios,OU=Contoso,DC=Contoso,DC=local" ` # especifica la ruta de la unidad organizativa donde se creará el usuario
            -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -force) ` # contraseña por defecto
            -Enabled $True ` # habilita la cuenta del usuario
            -PasswordNeverExpires $False ` # la contraseña no expira
            -ChangePasswordAtLogon $True ` # el usuario debe cambiar la contraseña al iniciar sesión
            -PassThru ` # devuelve el objeto del usuario creado
            -ErrorAction Stop # devuelve mensajes de error si no se puede crear el usuario
}