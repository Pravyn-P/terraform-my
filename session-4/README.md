### Outputs

We are creating infra, we want to see what are the outputs we can get through infra.
Syntax is
```
output "name-you-prefer" {
    value = "name_of_required_output"
}
```
### Data Sources
Data source is usefull to get the information from cloud or any other external provider. This information will be used as inputs for your infrastructure.
Syntax is
```
data "aws_data_source_name" "preffered-name" {

}
```

### Functions
Fuctions are nothing but a unit of work, you can use functions repeatedly wherever you want.