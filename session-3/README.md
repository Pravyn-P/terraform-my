### State and Remote State
Terraform is a declarative of approach. Declarative means whatever we write(declare) you can get it, provided you should follow the syntax.

Whenever terraform created infra, it creates a file called ``terraform.tfstate```. It needs someway to track what it created

.tf files = whatever we want = required infra = desired infra
terraform.tfstate files = created infra = current state of infra

required infra = current infra
desired infra = actual infra

keeping terraform.tfstate file in local is not recommended, if we lose the file then terraform won't understand what happened earlier. It will try to recrete again. Means duplicate resources are generated.

In case of version control, keeping the state file in github also causes problem while infra is creating through CICD.

It is best practice to keep the tf state file in remote location like S3 for better collaboration among team members.

variables.tf is to declare variables. You can also provide default values from here, but it is not recommended.

terraform.tfvars to provide default values to variables. It also overrides the default values mentioned in variables.tf file.