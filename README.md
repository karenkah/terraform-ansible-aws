# terraform-ansible-aws
 Provisiona EC2, VPC, SECURITY_GROUP na AWS com Terraform. Instala pacotes e copia arquivos em linux/windows com Ansible.

 
## Terraform: Provider AWS 
* EC2 - Ubuntu host
* EC2 - Ubuntu/Ansible controlador
* EC2 - Windows Server host
* VPC - provisiona vpc/subnet e associa instâncias 
* SECURITY GROUP - associado nas instâncias Ubuntu
* SECURITY GROUP - associado na instância Windows

## Ansible:
### No Windows host:
* Instala chocolatey
* Instala nginx via chocolatey
* Instala 7-zip via win_get_url/win_package
* Copia arquivo local via win_copy
#### Obs: É preciso rodar o script ConfigureRemotingForAnsible.ps1 no powershell
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file
```

### No Ubuntu host:
* Instala nginx via apt 
* Copia arquivo local via copy
