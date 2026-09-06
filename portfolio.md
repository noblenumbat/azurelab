# Content
1. [Here is how I configured a Windows Server 2022 VM in Azure](#here-is-how-i-configured-a-windows-server-2022-vm-in-azure)
1. [Adding role Active Directory](#promoving-my-server-as-domain-controller)
1. [Promoving my server as Domain Controller](#promoving-my-server-as-domain-controller)
1. [Checking configurations after promotion AD DS](#checking-configurations-after-promotion-ad-ds)
1. [Troubleshooting RDP Connection Issues](#troubleshooting-rdp-connection-issues)
1. [Crear y eliminar usuarios en Active Directory](#crear-y-eliminar-usuarios-en-active-directory)

---

# Here is how I configured a Windows Server 2022 VM in Azure

1. I created a resource
    ![create+resource](/Images/Screenshot_1.png)

    ![create+resource](/Images/Screenshot_2.png)

1. This the resume of configuration of mine VM. And finally, I created it.

    ![vm-1](/Images/Screenshot_3.png)
    ![vm-2](/Images/Screenshot_4.png)
    ![vm-3](/Images/Screenshot_4.png)
    ![vm-4](/Images/Screenshot_5.png)
    ![vm-5](/Images/Screenshot_6.png)
    ![vm-6](/Images/Screenshot_7.png)

1. Implementation begins
    ![vm-7](/Images/Screenshot_8.png)
    ![vm-8](/Images/Screenshot_9.png) 

1. Now I have my VM and these are Its properties
    ![vm-10](/Images/Screenshot_10.png) 

1. I deploy Bastion
    ![vm-11](/Images/Screenshot_10.png) 

1. I check the ip address and it has a dynamic address, I going to turn to static private ip for my domain controller.
    ![vm-12](/Images/Screenshot_11.png) 
    ![vm-13](/Images/Screenshot_12.png) 
    ![vm-14](/Images/Screenshot_13.png) 

1. I'm going to connect to my VM throug bastion.
    ![vm-15](/Images/Screenshot_14.png) 
    ![vm-16](/Images/Screenshot_15.png) 

# Adding role Active Directory
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

# Promoving my server as Domain Controller
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

# Checking configurations after promotion AD DS

## Checking services  
![vm-40](/Images/Screenshot_39.png) 
![vm-41](/Images/Screenshot_40.png) 
![vm-42](/Images/Screenshot_41.png) 
![vm-43](/Images/Screenshot_42.png) 

## Checking viewer events 
![vm-44](/Images/Screenshot_43.png) 

## Checking sites Active Directory 
![vm-45](/Images/Screenshot_44.png) 

## Checking DNS
![vm-46](/Images/Screenshot_45.png)
![vm-47](/Images/Screenshot_46.png)   

# Troubleshooting RDP Connection Issues 

After deleting the Azure Bastion resource to avoid generating more costs, I realized that I had lose the connection to my virtual machine, I tried to connect using the native way throught Remote Desk, but it failed.

![vm-48](/Images/Screenshot_50.png)
![vm-49](/Images/Screenshot_51.png)

Now I can't access the VM because I deleted the Azure Bastion resource temporarily, so I must deploy that resource again to access the machine remotely.

## Deploy Bastion temporarily

![vm-50](/Images/Screenshot_53.png)
![vm-51](/Images/Screenshot_54.png)
![vm-52](/Images/Screenshot_55.png)

Once I was connected, I checked the Remote Desktop services in the Administration settings, and they were effectively enabled.

![vm-53](/Images/Screenshot_56.png)

## Creating an inbound rule for TCP port 3389 on the virtual machine

The goal is to create an inbound rule in Windows Defender Firewall using TCP port 3389 to allow the access to the VM through Remote Desktop. 

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

I made sure that the Remote Desktop Services were running and set to automatic.

![vm-66](/Images/Screenshot_69.png)
![vm-67](/Images/Screenshot_70.png)
![vm-68](/Images/Screenshot_71.png)

Also, I checked that TCP port 3389 was listening. 

![vm-69](/Images/Screenshot_72.png)
 
## Creating an inbound security rule in Azure for TCP port 3389

One more thing: there was no inbound security rule for TCP port 3389 in Azure's network configuration. Then, I created an inbound rule to allow connections only from my IP address. This restricts anyone else from trying to connect to my VM once it is started.

![vm-73](/Images/Screenshot_73.png)
![vm-71](/Images/Screenshot_74.png)
![vm-72](/Images/Screenshot_75.png)
![vm-76](/Images/Screenshot_76.png)

## Deleting Bastion and testing the Remote Desktop connection

![vm-88](/Images/Screenshot_88.png)
![vm-89](/Images/Screenshot_89.png)
![vm-90](/Images/Screenshot_90.png)
![vm-91](/Images/Screenshot_91.png)

## Crear y eliminar usuarios en Active Directory

Los usuarios se pueden definir como objetos del controlador de dominio y pueden ser creados desde `Usuarios y Equipos de Active Directory` o desde el `Centro de Administración de Active Directory`.

### Creando usuarios desde: Usuarios y equipos de Active Directory

![vm-98](/Images/Screenshot_98.png)
![vm-99](/Images/Screenshot_99.png)
![vm-100](/Images/Screenshot_100.png)
![vm-101](/Images/Screenshot_101.png)
![vm-102](/Images/Screenshot_102.png)
![vm-103](/Images/Screenshot_103.png)
![vm-104](/Images/Screenshot_104.png)

### Creando usuarios desde: Centro de Administración de Active Directory

![vm-105](/Images/Screenshot_105.png)
![vm-106](/Images/Screenshot_106.png)
![vm-107](/Images/Screenshot_107.png)
![vm-108](/Images/Screenshot_108.png)
![vm-109](/Images/Screenshot_109.png)
![vm-110](/Images/Screenshot_110.png)
![vm-111](/Images/Screenshot_111.png)

### Crear miles de usuarios de Active Directory con PowerShell

Es muy útil cuando queremos automatizar la creación masiva de usuarios para ahorrar tiempo, solo es necesario editar un archivo delimitado por comas `.csv` con los campos de los atributos de usuario y un Script de PowerShell.

> [!Note]
>
> Desmenuzar el archivo de prueba proporcionado en el curso
> para construir mi propio script y archivo csv para crear usuarios de un solo golpe.
> Tener en cuenta este comando `Get-ADDomain` para halar los datos claves del controlador de dominio.