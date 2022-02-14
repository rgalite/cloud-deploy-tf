# Introduction

This repository includes tf files to set-up a CI/CD pipeline for GCP.

# Installation

- Copy the `backend.tf.example` file to `backend.tf`.

```
cp backend.tf.example backend.tf
```

And replace the `UPDATE_ME` placeholders with your values.

- Copy the `terraform.tfvars.example` file to `terraform.tfvars`.

```
cp terraform.tfvars.example terraform.tfvars
```

And replace the `<UPDATE_ME>` placeholders with your values.

- Run terraform to create the project and override the organization policies first.

```
terraform plan -target module.project -out project.planfile
terraform apply -auto-approve project.planfile
```

- Finally, run terraform again to create the rest of the resources.

```
terraform plan -out clouddeploy.planfile
terraform apply -auto-approve clouddeploy.planfile
```
