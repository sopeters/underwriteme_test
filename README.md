# underwriteme_test

Pre-Requisites:

* AWS Account (environment variables for AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_DEFAULT_REGION) or ~/.aws
* Setup of Fargate Cluster (for simplicity) - see cfn template and execute via AWS Console to setup basics
* awscli tool
* ECR Repository URL for Docker images (needed in Makefile)

Installation:
* Adjust Makefile ECR URL
* Setup initial ECS/Fargate Cluster (using AWS Console or aws cli)

run "make" to build Docker Image
run "make dockerPush" to push into ECR
run "make deploy" to cutover to new version

Next steps / enhancements:
* Make Blue / Green deployments using https://github.com/silinternational/ecs-deploy
