# Contenido

## PARTE I: Lab corriendo en Azure
1. [Así configuré una máquina virtual con Windows Server 2022 en Azure](#así-configuré-una-máquina-virtual-con-windows-server-2022-en-azure)
2. [Agregar el rol de Active Directory](#agregar-el-rol-de-active-directory)
3. [Promover mi servidor como controlador de dominio](#promover-mi-servidor-como-controlador-de-dominio)
4. [Comprobación de las configuraciones después de la promoción a AD DS](#comprobación-de-las-configuraciones-después-de-la-promoción-a-ad-ds)
5. [Solución de problemas de conexión RDP](#solución-de-problemas-de-conexión-rdp)
6. [Crear y eliminar usuarios en Active Directory](#crear-y-eliminar-usuarios-en-active-directory)
7. [Solucionando el inicio de sesión remoto con una de las cuentas creadas](#solucionando-el-inicio-de-sesión-remoto-con-una-de-las-cuentas-creadas)
8. [Configurando la política de seguridad para intentos fallidos con contraseñas no válidas](#configurando-la-política-de-seguridad-para-intentos-fallidos-con-contraseñas-no-válidas)
## PARTE II: Abandonando Azure por costos de suscripción
9. [Implementación de un tunel con tailscale](#implementación-de-un-tunel-con-tailscale) 

---

# Así configuré una máquina virtual con Windows Server 2022 en Azure

1. Creé un recurso.

   ![create+resource](/Images/Screenshot_1.png)

   ![create+resource](/Images/Screenshot_2.png)

2. Este es el resumen de la configuración de mi máquina virtual. Finalmente, la creé.

   ![vm-1](/Images/Screenshot_3.png)

   ![vm-2](/Images/Screenshot_4.png)

   ![vm-3](/Images/Screenshot_4.png)

   ![vm-4](/Images/Screenshot_5.png)

   ![vm-5](/Images/Screenshot_6.png)

   ![vm-6](/Images/Screenshot_7.png)

3. Comienza la implementación.

   ![vm-7](/Images/Screenshot_8.png)

   ![vm-8](/Images/Screenshot_9.png)

4. Ahora tengo mi máquina virtual y estas son sus propiedades.

   ![vm-10](/Images/Screenshot_10.png)

5. Implemento Bastion.

   ![vm-11](/Images/Screenshot_10.png)

6. Compruebo la dirección IP y tiene una dirección dinámica. Voy a convertirla en una IP privada estática para mi controlador de dominio.

   ![vm-12](/Images/Screenshot_11.png)

   ![vm-13](/Images/Screenshot_12.png)

   ![vm-14](/Images/Screenshot_13.png)

7. Voy a conectarme a mi máquina virtual mediante Bastion.

   ![vm-15](/Images/Screenshot_14.png)

   ![vm-16](/Images/Screenshot_15.png)

# Agregar el rol de Active Directory

![vm-17](/Images/Screenshot_16.png)

![vm-18](/Images/Screenshot_17.png)

![vm-19](/Images/Screenshot_18.png)

![vm-20](/Images/Screenshot_19.png)

![vm-21](/Images/Screenshot_20.png)

![vm-22](/Images/Screenshot_21.png)

![vm-23](/Images/Screenshot_22.png)

![vm-24](/Images/Screenshot_23.png)

![vm-25](/Images/Screenshot_24.png)

![vm-26](/Images/Screenshot_25.png)

# Promover mi servidor como controlador de dominio

![vm-28](/Images/Screenshot_27.png)

![vm-27](/Images/Screenshot_26.png)

![vm-29](/Images/Screenshot_28.png)

![vm-30](/Images/Screenshot_29.png)

![vm-31](/Images/Screenshot_30.png)

![vm-32](/Images/Screenshot_31.png)

![vm-33](/Images/Screenshot_32.png)

![vm-34](/Images/Screenshot_33.png)

![vm-35](/Images/Screenshot_34.png)

![vm-36](/Images/Screenshot_35.png)

![vm-37](/Images/Screenshot_36.png)

![vm-39](/Images/Screenshot_38.png)

![vm-38](/Images/Screenshot_37.png)

# Comprobación de las configuraciones después de la promoción a AD DS

## Comprobación de los servicios

![vm-40](/Images/Screenshot_39.png)

![vm-41](/Images/Screenshot_40.png)

![vm-42](/Images/Screenshot_41.png)

![vm-43](/Images/Screenshot_42.png)

## Comprobación del Visor de eventos

![vm-44](/Images/Screenshot_43.png)

## Comprobación de los sitios de Active Directory

![vm-45](/Images/Screenshot_44.png)

## Comprobación de DNS

![vm-46](/Images/Screenshot_45.png)

![vm-47](/Images/Screenshot_46.png)

# Solución de problemas de conexión RDP

Después de eliminar el recurso Azure Bastion para evitar generar más costos, me di cuenta de que había perdido la conexión con mi máquina virtual. Intenté conectarme utilizando el método nativo mediante Escritorio remoto, pero la conexión falló.

![vm-48](/Images/Screenshot_50.png)

![vm-49](/Images/Screenshot_51.png)

Ahora no puedo acceder a la máquina virtual porque eliminé temporalmente el recurso Azure Bastion, así que debo implementar nuevamente este recurso para acceder a la máquina de forma remota.

## Implementar Bastion temporalmente

![vm-50](/Images/Screenshot_53.png)

![vm-51](/Images/Screenshot_54.png)

![vm-52](/Images/Screenshot_55.png)

Una vez conectado, comprobé los servicios de Escritorio remoto en la configuración de administración y, efectivamente, estaban habilitados.

![vm-53](/Images/Screenshot_56.png)

## Crear una regla de entrada para el puerto TCP 3389 en la máquina virtual

El objetivo es crear una regla de entrada en el Firewall de Windows Defender utilizando el puerto TCP 3389 para permitir el acceso a la máquina virtual mediante Escritorio remoto.

![vm-56](/Images/Screenshot_59.png)

![vm-57](/Images/Screenshot_60.png)

![vm-58](/Images/Screenshot_61.png)

![vm-59](/Images/Screenshot_62.png)

![vm-60](/Images/Screenshot_63.png)

![vm-61](/Images/Screenshot_64.png)

![vm-62](/Images/Screenshot_65.png)

![vm-63](/Images/Screenshot_66.png)

![vm-64](/Images/Screenshot_67.png)

![vm-65](/Images/Screenshot_68.png)

Me aseguré de que los servicios de Escritorio remoto estuvieran ejecutándose y configurados para iniciarse automáticamente.

![vm-66](/Images/Screenshot_69.png)

![vm-67](/Images/Screenshot_70.png)

![vm-68](/Images/Screenshot_71.png)

También comprobé que el puerto TCP 3389 estuviera escuchando.

![vm-69](/Images/Screenshot_72.png)

## Crear una regla de seguridad de entrada en Azure para el puerto TCP 3389

Había un problema adicional: no existía ninguna regla de seguridad de entrada para el puerto TCP 3389 en la configuración de red de Azure. Entonces, creé una regla de entrada para permitir conexiones únicamente desde mi dirección IP. Esto restringe que cualquier otra persona pueda intentar conectarse a mi máquina virtual una vez que esta se encuentre iniciada.

![vm-73](/Images/Screenshot_73.png)

![vm-71](/Images/Screenshot_74.png)

![vm-72](/Images/Screenshot_75.png)

![vm-76](/Images/Screenshot_76.png)

## Eliminar Bastion y probar la conexión de Escritorio remoto

![vm-88](/Images/Screenshot_88.png)

![vm-89](/Images/Screenshot_89.png)

![vm-90](/Images/Screenshot_90.png)

![vm-91](/Images/Screenshot_91.png)

## Crear y eliminar usuarios en Active Directory

Los usuarios pueden definirse como objetos dentro de un controlador de dominio y pueden crearse utilizando `Active Directory Users and Computers` o `Active Directory Administrative Center`.

### Crear un usuario utilizando Active Directory Users and Computers

![vm-98](/Images/Screenshot_98.png)

![vm-99](/Images/Screenshot_99.png)

![vm-100](/Images/Screenshot_100.png)

![vm-101](/Images/Screenshot_101.png)

![vm-102](/Images/Screenshot_102.png)

![vm-103](/Images/Screenshot_103.png)

![vm-104](/Images/Screenshot_104.png)

### Crear un usuario utilizando Active Directory Administrative Center

![vm-105](/Images/Screenshot_105.png)

![vm-106](/Images/Screenshot_106.png)

![vm-107](/Images/Screenshot_107.png)

![vm-108](/Images/Screenshot_108.png)

![vm-109](/Images/Screenshot_109.png)

![vm-110](/Images/Screenshot_110.png)

![vm-111](/Images/Screenshot_111.png)

### Crear varios usuarios de Active Directory de una sola vez utilizando PowerShell

Esto es muy útil cuando se desea crear usuarios de forma masiva para ahorrar tiempo. Todo lo que hay que hacer es crear un archivo `.csv` con los campos de atributos de los usuarios y sus respectivos valores.

Por otro lado, se utiliza un script que se ejecuta desde PowerShell.

¿Cómo funciona?

Colocamos ambos archivos en la misma carpeta.

1. Abrimos PowerShell y ejecutamos el script:

   `.\CreateUserAD.ps1`

   ![vm-114](/Images/Screenshot_114.png)

2. El script llama al archivo `csv` que contiene los datos de los usuarios que se van a crear. Esta es la salida que confirma la creación de los objetos (los usuarios).

   ![vm-115](/Images/Screenshot_115.png)

3. Visualización de los usuarios desde Active Directory Administrative Center.

   ![vm-116](/Images/Screenshot_116.png)

   ![vm-117](/Images/Screenshot_117.png)

## ARCHIVOS

**Script:** En mi laboratorio, el script que llama al archivo `csv` se llama `CreateUserAD.ps1`.

Descripción de los campos utilizados en el script para crear usuarios:

- `userPrincipalName` es el nombre de inicio de sesión del usuario en el dominio. Ejemplo: `jperez@empresa.com`.

- `sAMAccountName` es el nombre de inicio de sesión tradicional del usuario en Active Directory. Ejemplo: `jperez`.

- `Name` es el nombre del objeto de usuario en Active Directory. Se utiliza para identificar al usuario y distinguirlo de otros usuarios del directorio. Ejemplo: `Juan Pérez`.

- `GivenName` es el nombre de pila de la persona. Ejemplo: `Juan`.

- `SurName` es el apellido de la persona. Ejemplo: `Pérez`.

- `Title` es el cargo, puesto o función que desempeña una persona dentro de la organización. Ejemplo: `Analista de Sistemas`.

- `Department` es el departamento o división de la empresa al que pertenece el usuario. Ejemplo: `Tecnología`.

- `Company` es el nombre de la empresa u organización a la que pertenece el usuario. Ejemplo: `Tar-get`.

- `EmailAdress` es la dirección de correo electrónico asociada al usuario. Ejemplo: `juan.perez@empresa.com`.

> [!NOTE]
>
> Aunque pueden tener el mismo valor, no necesariamente tienen que ser iguales.
>
> Diferencia con `userPrincipalName`:
>
> `EmailAddress` → dirección de correo electrónico del usuario. `juan.perez@empresa.com`
>
> `userPrincipalName` → identificador que utiliza el usuario para iniciar sesión en el dominio. `jperez@empresa.com`

- `Description` es un campo de texto libre para agregar información adicional o una descripción sobre el usuario. Ejemplo: `Usuario del área de soporte técnico`.

- `Country` es el país donde se encuentra la persona, oficina o entidad a la que pertenece el usuario. Ejemplo: `Colombia`.

## Contenido del script de PowerShell para crear usuarios

![vm-112](/Images/Screenshot_112.png)

**Archivo CSV:** tiene por nombre `ListUsersAD.csv`.

**Vista del archivo CSV**

Al final de cada línea hay 14 caracteres `;`, y los delimitadores de cada campo son `,`.

![vm-113](/Images/Screenshot_113.png) 

## Solucionando inicio remoto de sesión con una de las cuentas creadas

    `romeo@jcastillo.com `
    
Resulta el primer error al tratar de iniciar sesión remotamente.

![vm-118](/Images/Screenshot_118.png) 


- Debo añadir al usuario al grupo de Usuarios de Escritorio Remoto.

![vm-119](/Images/Screenshot_119.png) 
![vm-120](/Images/Screenshot_120.png) 

- Intentar nuevamente el inicio de sesión.

![vm-121](/Images/Screenshot_121.png)

- Sigue apareciendo el mismo error: esto pasa por que el equipo al que intento conectarme es un controlador de dominio.

![vm-122](/Images/Screenshot_122.png)

- Para resolver esto debo añadir al usuario al grupo de administradores de dominio.

![vm-123](/Images/Screenshot_123.png)
![vm-124](/Images/Screenshot_124.png)

- Intentamos nuevamente.

![vm-125](/Images/Screenshot_125.png)

- Listo.

![vm-126](/Images/Screenshot_126.png)


## Configurando política de seguridad para intentos fallidos por claves NO válidas

1. Ingreso al administrador de directivas de grupo.

    ![vm-127](/Images/Screenshot_127.png)

1. Me dirijo a Group Policy Management.

1. Despliego el bosque y edito las politicas por defecto del dominio.

    ![vm-128](/Images/Screenshot_128.png)

1. Depliego la ruta: `Computer Configuration->Policies->Windows Settings->Security Settings->Account Lockout Policy`
    
    ![vm-129](/Images/Screenshot_129.png)

1. Entrar a las propiedades de la política Account lockout threshold.
1. Defino la cantidad de intentos fallidos.

    ![vm-130](/Images/Screenshot_130.png)

1. Opcionalmente podemos configurar estas opciones.

    ![vm-131](/Images/Screenshot_131.png)

1. Nos quedaria así.

    ![vm-132](/Images/Screenshot_132.png)

### Probando si funciona el bloqueo

![vm-133](/Images/Screenshot_133.png)

### Desbloqueado a este usuario

![vm-134](/Images/Screenshot_134.png)
![vm-135](/Images/Screenshot_135.png)

# Implementación de un tunel con tailscale

Decidi abandonar mi VM en Azure, por costos de suscripción 🥲, y en su lugar instale mi propia maquina conectada a internet con tailscale, la cual es accesible remotamente a través de una VPN con tailscale que me permite acceder de forma desantendida con una ip pública, todo free.

Solo hice un cambio en el nombre del dominio de `jcastillo.com` a `jcastillo.local` solo por convención, de resto todo sigue igual.

![vm-136](/Images/Screenshot_136.png)

![vm-137](/Images/Screenshot_137.png)

![vm-138](/Images/Screenshot_138.png)

### Identificar desde que equipo se esta bloqueando la cuenta ID 4740 

1. Ingresar al `Visor de eventos` desde el servidor de controlador de dominio.
2. Desplegar: `Registros de Windows->Seguridad`
   ![vm-139](/Images/Screenshot_139.png)

3. `Filtrar registro actual`
4. Incluir el ID `4740`
   ![vm-140](/Images/Screenshot_140.png)

5. Vemos el que el equipo autor de la llamada que ocasiona el bloque es: `Thalia`.
   ![vm-141](/Images/Screenshot_141.png)
   ![vm-142](/Images/Screenshot_142.png)

### Restablecer contraseñas de cuentas de usuario

Desde el Centro de Administración de Active Directory, ingresar a Users, escribir el dominio y el nombre de usuaro `dominio\nombreUsuario`, escribir y confirmar la nueva contraseña y además, por seguridad activar la opción para que el usuario cambie la contraseña en el próximo inicio de sesión.

![vm-143](/Images/Screenshot_143.png)

Listo!

![vm-144](/Images/Screenshot_144.png)







