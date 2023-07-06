### State and Remote State
Terraform is a declarative of approach. Declarative means whatever we write(declare) you can get it, provided you should follow the syntax.

Whenever terraform created infra, it creates a file called ``terraform.tfstate```. It needs someway to track what it created

.tf files = whatever we want = required infra = desired infra
terraform.tfstate files = created infra = current state of infra

required infra = current infra
desired infra = actual infra

keeping terraform.tfstate file in local is not recommended, if we lose the file then terraform cann't understand what happened earlier. It will try to recrete again.