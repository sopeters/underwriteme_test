# underwriteme_test

Pre-Requisites:

* AWS Account (environment variables for AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_DEFAULT_REGION) or ~/.aws
* Setup of Fargate Cluster (for simplicity) - see cfn template and execute via AWS Console to setup basics
* awscli tool
* ECR Repository URL for Docker images (needed in Makefile)

Installation:
* Setup initial ECR Repo & adjust Makefile ECR URL

* run "make" to build Docker Image
* run "make dockerPush" to upload initial image into ECR

* Setup initial ECS/Fargate Cluster (using AWS Console or aws cli)
  - StackName: UnderwriteMe
  - ServiceName: UnderwriteMeService
  - Reference ECR Repo
  - Select 2 different Subnets and VPC

  -> Note Output URL (ELB URL) for access later

Updating the image:
* Update Version number in Makefile
* run "make" to build
* run "make deploy" to upload and cutover to new version

Next steps / enhancements:
* Make Blue / Green deployments 
