# docker-opennebula

Instalación de un servidor Docker en OpenNebula con Terraform y Ansible.

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

- [How to alias docker-compose to docker compose?](https://stackoverflow.com/questions/72099653/how-to-alias-docker-compose-to-docker-compose)
