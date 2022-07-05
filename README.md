# terraform-ansible-aws
 Provisiona EC2, VPC, SECURITY_GROUP na AWS com Terraform. Instala pacotes e copia arquivos em linux/windows com Ansible.

 ### Requisitos para projeto:
 * Criar/ter conta na AWS
 * Instalar e configurar AWS_CLI
 * Instalar Terraform
 

# Terraform: Provider AWS 
* EC2 - Ubuntu host
* EC2 - Ubuntu/Ansible controlador
* EC2 - Windows Server host
* VPC - provisiona vpc/subnet e associa instâncias 
* SECURITY GROUP - associado nas instâncias Ubuntu
* SECURITY GROUP - associado na instância Windows

# Ansible:
## No Windows host:
* Instala chocolatey
* Instala nginx via chocolatey
* Instala 7-zip via win_get_url/win_package
* Copia arquivo local via win_copy

#### Obs: É necessário rodar o script Install-WMF3Hotfix.ps1 no powershell para corrigir bug de memória WinRM. [(Documentação Ansible)](https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#winrm-setup)
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Install-WMF3Hotfix.ps1"
$file = "$env:temp\Install-WMF3Hotfix.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose
```

## No Ubuntu host:
* Instala nginx via apt 
* Inicia nginx (handler)
* Copia arquivo local via copy
