terraform {
 backend "s3" {
   bucket         = "plt.candidate.hari-terraform-state"
   key            = "state/app/mywebapp/terraform.tfstate"
   region         = "eu-west-1"
   encrypt        = true
   kms_key_id     = "alias/terraform-state-bucket-key"
   dynamodb_table = "terraform-state"
 }
}

variable "project_id" {
  description = "Azure DevOps Project Id"
  type        = string
}


resource "azuredevops_variable_group" "mywebapp_build" {
  project_id   = var.project_id
  name         = "mywebappBuildVariables"
  description  = "Prod variable groups"
  allow_access = true

  variable {
    name  = "awsEKSRegion"
    value = "eu-west-1"
  }

  variable {
    name  = "awsECRAccountId"
    value = "550515022371"
  }

  variable {
    name  = "awsECRRegion"
    value = "eu-west-1"
  }

  variable {
    name  = "awsRegion"
    value = "eu-west-1"
  }

  variable {
    name  = "awsECRAccountId"
    value = "eu-west-1"
  }

  variable {
    name  = "helmChartVersion"
    value = "1.0.0"
  }
}

resource "azuredevops_variable_group" "mywebapp_deploy_prod" {
  project_id   = var.project_id
  name         = "mywebappDeployVariables (Prod)"
  description  = "Prod variable groups"
  allow_access = true

  variable {
    name  = "awsEKSRegion"
    value = "eu-west-1"
  }

  variable {
    name  = "awsECRAccountId"
    value = "550515022371"
  }

  variable {
    name  = "awsECRRegion"
    value = "eu-west-1"
  }

  variable {
    name  = "awsRegion"
    value = "eu-west-1"
  }

  variable {
    name  = "K8sNamespace"
    value = "hari"
  }

  variable {
    name  = "awsEKSClusterName"
    value = "platform-eks-prod-eu-west-1"
  }

  variable {
    name  = "awsECRAccountId"
    value = "eu-west-1"
  }

  variable {
    name  = "helmChartVersion"
    value = "1.0.0"
  }
}


resource "azuredevops_variable_group" "mywebapp_aws" {
  project_id   = var.project_id
  name         = "mywebappAWSCredentials"
  description  = "Prod variable groups"
  allow_access = true

  variable {
    name  = "AWS_ACCESS_KEY_ID"
    value = ""
  }

  variable {
    name  = "AWS_SECRET_ACCESS_KEY"
    value = ""
  }

  variable {
    name  = "AWS_DEFAULT_REGION"
    value = "eu-west-1"
  }
}
