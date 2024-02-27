ARG TERRAFORM_VERSION

FROM hashicorp/terraform:${TERRAFORM_VERSION}

# Instalar los paquetes necesarios
RUN apk add ansible openssh jq

# Copiar los scripts al contenedor
COPY --chmod=0755 *.sh /usr/bin/

# Definir el directorio actual
WORKDIR /root

# Mostrar el usuario y el host en el prompt
ENV PS1='\u@\h:\w\$\040'

# Eliminar la llamada a Terraform de la imagen original
ENTRYPOINT []
