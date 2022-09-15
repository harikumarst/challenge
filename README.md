# Description
This repo contains the example app from https://dotnet.microsoft.com/en-us/learn/aspnet/hello-world-tutorial/intro, as well as a simple Dockerfile and a Helm chart for it.

Your goal is to deploy the included application (under `app/`) to the EKS cluster you have created using the provided, rudimentary Dockerfile and Helm chart, in a namespace named as your firstname while also completing the following objectives.

<br>

## Objectives and status:

1. Enable HPA for the deployment and set the target utilization to 80% for CPU and 85% for memory. - Done
2. Set CPU request to 150m - Done
3. Make the application highly available - Done
4. Expose the application via a service to the cluster - Done
5. Expose the application to the internet. You may use the Route53 zone that has already been created in the provided AWS account, in region `eu-west-1` - Done
6. Make the application's index page show `Hello {GREET_VAR}` instead of "Hello world", where `GREET_VAR` is an environment variable. The variable should get its value from the `values.yaml` file - Done
7. Fix the provided Dockerfile, so it runs the application on startup - Done

<br>

## Notes:
1. Feel free to use any docker registry you want. - ECR is used as Docker Registry
2. Document your work, to help us understand your thoughts and implementation.


------------------------------------------------
CI/CD:

Azure DevOps is used for CI/CD implementation. Templates based approach has been adopted to avoid code duplication and maintain consistency in the pipelines creation. 
Variable groups are will created using Terraform and used in the pipelines as per the environment. 
Images will stored in the AWS ECR and then will be deployed to AWS EKS.
