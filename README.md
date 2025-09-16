# 🚀 Despliegue de VM en Azure con Terraform

Este proyecto despliega una máquina virtual Linux en **Azure** usando **Terraform**.  
Incluye red virtual, subred, IP pública, grupo de seguridad y la VM lista para conectarse vía SSH.

---

## 📋 Requisitos previos

1. **Instalar Terraform**  
   [Guía oficial](https://developer.hashicorp.com/terraform/downloads)

2. **Instalar Azure CLI**  
   [Guía oficial](https://learn.microsoft.com/es-es/cli/azure/install-azure-cli)

3. **Iniciar sesión en Azure**  

```bash
   az login
```

## ⚙️ Despliegue de la infraestructura

Clonar este repositorio o copiar los archivos main.tf, variables.tf y outputs.tf.

Inicializar Terraform:

```bash
terraform init
```

Verificar el plan de ejecución:

```bash
terraform plan
```

Aplicar los cambios:

```bash
terraform apply -auto-approve
```

Al terminar, obtendrás la IP pública de la VM:

```bash
terraform output public_ip
```

🔐 Credenciales de acceso

En el archivo main.tf definiste un usuario y contraseña, por ejemplo:

admin_username = "azureuser"
admin_password = "TuPassword123!"


⚠️ IMPORTANTE: Cambia la contraseña por una segura antes de desplegar en un entorno real.

🖥️ Conectarse a la VM

Desde tu terminal, conéctate por SSH:
```bash
ssh azureuser@<PUBLIC_IP>
```

Sustituye <PUBLIC_IP> por el valor obtenido con terraform output public_ip.

Si quieres ejecutar un comando remoto sin entrar en sesión interactiva, por ejemplo listar archivos:

```bash
ssh azureuser@<PUBLIC_IP> "ls -la"
```

Para verificar el sistema operativo:

```bash
ssh azureuser@<PUBLIC_IP> "uname -a"
```

🧹 Destruir la infraestructura

Cuando ya no necesites la VM:

```bash
terraform destroy -auto-approve
```
## Prueba de Conexión exitosa a VM
![alt text](image.png)