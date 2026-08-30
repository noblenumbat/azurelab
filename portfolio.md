# Content
1. [Here is how I configured a Windows Server 2022 VM in Azure](#here-is-how-i-configured-a-windows-server-2022-vm-in-azure)
1. [Adding role Active Directory](#promoving-my-server-as-domain-controller)
1. [Promoving my server as Domain Controller](#promoving-my-server-as-domain-controller)
1. [Checking configurations after promotion AD DS](#checking-configurations-after-promotion-ad-ds)


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

# Resolviendo problemas de conexión RDP 

Luego de eliminar el recurso Bastion de Azure, intente conectarme de forma nativa por medio de una sesión de escritorio remoto pero la comunicación fallo.

![vm-48](/Images/Screenshot_50.png)
![vm-49](/Images/Screenshot_51.png)

Ahora no tenia manera de acceder a la VM ya que había eliminado el recurso Bastion, así que no tuve de otra que volver a implementar dicho recurso para acceder remotamente a la maquina virtual.

## Implementando nuevamente Bastion

![vm-50](/Images/Screenshot_53.png)
![vm-51](/Images/Screenshot_54.png)
![vm-52](/Images/Screenshot_55.png)
![vm-70](/Images/Screenshot_73.png)
![vm-71](/Images/Screenshot_74.png)
![vm-72](/Images/Screenshot_75.png)

Ya conectado valide que los servicios de Administración Remota y Escritorio Remoto estuvieran habilitados, y efectivamente si estaban habilitados.

![vm-53](/Images/Screenshot_56.png)


## Creando una regla de entrada para el puerto TCP 3389

con el objetivo de crear una regla de entrada en el Firewall de Windows Defender con el puerto TCP 3389 es permitir el acceso a la VM por escritorio remoto y sin necesidad de usar Bastion.

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

Me asegure de que el tipo de inicio del Servicio Remoto estuviera ejecutandose y en automatico. 

![vm-66](/Images/Screenshot_69.png)
![vm-67](/Images/Screenshot_70.png)
![vm-68](/Images/Screenshot_71.png)

También verifique la escucha del puerto 3389

![vm-69](/Images/Screenshot_72.png)
 
## Creando una regla de entrada en Azure para el puerto TCP 3389 

Adicionalmente no habia una regla creada para el puerto 3389 en Configuraciones de red de Azure. Asi que procedi a crear la regla de entrada para conectarme a través de mi dirección IP (esto restrige a además que cualquiera intente conectarse a mi VM una vez este iniciada).

![vm-54](/Images/Screenshot_57.png)
![vm-73](/Images/Screenshot_73.png)
![vm-74](/Images/Screenshot_74.png)
![vm-76](/Images/Screenshot_76.png)
![vm-75](/Images/Screenshot_75.png)