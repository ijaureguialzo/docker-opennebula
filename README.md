# docker-opennebula

Instalación de un servidor Docker en OpenNebula con Terraform y Ansible.

## Prerrequisitos

1. Instalar Docker Desktop para [Windows y macOS](https://www.docker.com/products/docker-desktop/)
   o [Linux](https://docs.docker.com/desktop/linux/install/).

2. En Windows, instalar [Scoop](https://scoop.sh) usando PowerShell:

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
   Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
   ```

   Y después instalar los comandos necesarios:

   ```powershell
   scoop install make
   ```

## Puesta en marcha

1. Crear el fichero `.env` a partir de `env-example` y configurar las variables.
2. Crear el fichero `terraform/variables.tf` a partir de `terraform/variables.tf.example` y configurar las variables.
3. Construir el contenedor donde se ejecuta Terraform.

    ```shell
    make build
    ```
4. Inicializar Terraform.

    ```shell
    make init
    ```

5. Desplegar la máquina virtual en OpenNebula.

    ```shell
    make apply
    ```

6. Conectarse a la máquina virtual.

    ```shell
    make ssh
    ```

## Portainer

Si se activa la opción en el fichero `variables.tf`, se instalará [Portainer](https://www.portainer.io) en la máquina
para gestionar los contenedores Docker y quedará accesible a través de la URL `https://direccion_ip_mv:9443`.

## Referencias

- [Install Docker Engine on Debian](https://docs.docker.com/engine/install/debian/)
- [Ansible facts](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_vars_facts.html)
- [Install Portainer CE with Docker on Linux](https://docs.portainer.io/v/2.20/start/install-ce/server/docker/linux)
- [Hello Terraform Data; Goodbye Null Resource](https://devdosvid.blog/2023/04/16/hello-terraform-data-goodbye-null-resource/)
