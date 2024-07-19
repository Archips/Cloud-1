
# Cloud-1

## Prerequisites

- Get access to your chosen instance provider (Scaleway in this case)
- Add your ssh publickey in the scaleway console
- Complete the .env file (following the .env.example)
- Complete the .tfvars (following the tfvars.example)
- Install [devbox](https://www.jetify.com/devbox/docs/installing_devbox/)

## Steps

- `git clone https://github.com/Archips/Cloud-1.git && cd Cloud-1`
- `cp <path_to_.env_file> ansible/roles/copy-files/tasks/files`
- `cp <path_to_scaleway.auto.tfvars_file> terraform`
- `devbox shell`
- `cd terraform && terraform init`
- `terraform plan`
- `terraform apply`
- paste instance's ip in ansible/hosts
- `cd ../ansible`
- `ansible-playbook -i hosts install.yaml`

## Troubleshooting

- If you get this error **`could not initialize the preferred locale: unsupported locale setting`** using ansible, this command may resolve the issue:
	- `locale -a && export LC_ALL=C.UTF-8`

## Resources

- [deploying Ubuntu 20.04 LTS](https://www.scaleway.com/en/docs/tutorials/deploy-ubuntu-20-04-instance-scaleway-elements/)
- [scaleway | terraform](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs#environment-variables)
- [Manage docker-compose with ansible](https://xavier-pestel.medium.com/how-to-manage-docker-compose-with-ansible-c08933ba88a8)

## Authors

[Alice Vedrenne](https://github.com/aliceKatkout)  
[Amber Van Bree](https://github.com/Ambervanbree)  
[Archibald Thirion](https://github.com/Archips)  
[Mia Combeau](https://github.com/mcombeau)
