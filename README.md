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
4. Crear la clave privada SSH para Ansible e inicializar Terraform.

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

## Referencias

- [Install Docker Engine on Debian](https://docs.docker.com/engine/install/debian/)
- [Ansible facts](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_vars_facts.html)
