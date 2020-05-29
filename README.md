# Infraestrutura Network Information Service NIS

Como instalar o NIS Master usando o ansible 2.9 no CentOS 8

O NIS é um sistema muito antigo, mas ainda usado por grandes empresas. 

Muitas empresa não precisam usar o serviço de diretório pesado como os da Microsft ou até mesmo os alguns de código aberto, o NIS ainda é leve e útil.  

| Servidores Previstos   | Arquivos Ansible       | Programas Previstos    | Crontab dos Mapas      | 
| :--                    | :--                    | :--                    | :--:                   |
|  NIS Master            | master_nis.yml         | add_new_user.sh        | 15 minutos             |
|  NIS Slave             | slave_nis.yml          | add_netgroup_user.sh   |                        |
|  NFS Home              | nfs_nis.yml            | add_netgroup_host.sh   |                        |
|                        |                        | update_nis_maps.sh     |                        |


## Nossos arquivos até o momento:

- [x] **master_nis.yml**	:+1: *Provisiona o Servidor NIS Master* 

- [x] **add_new_user.sh**	:+1: *Pode ser usado por por analistas de nível 2 para adicionar novos usuários.*

- [ ] ~~slave_nis.yml~~ :construction: *Em construção....

- [ ] ~~nfs_nis.yml~~ :construction: *Em construção....

- [ ] ~~add_netgroup_user.sh~~ :construction: *Em construção....

- [ ] ~~add_netgroup_host.sh~~ :construction: *Em construção....

- [ ] ~~update_nis_maps.sh~~ :construction: *Em construção....

*Conheçar mais sobre: https://treinalinux.com* 
