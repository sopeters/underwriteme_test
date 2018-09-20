VERSION = 0.3
DOCKER_IMAGE = speters/underwriteme_test
ECR_REPO = 676197543816.dkr.ecr.ap-southeast-2.amazonaws.com/underwriteme_test

dockerBuild:
	docker build --no-cache -t $(DOCKER_IMAGE):$(VERSION) .
	docker tag $(DOCKER_IMAGE):$(VERSION) $(DOCKER_IMAGE):latest
	docker tag $(DOCKER_IMAGE):$(VERSION) $(ECR_REPO):latest
	docker tag $(DOCKER_IMAGE):$(VERSION) $(ECR_REPO):$(VERSION)

dockerPush: ecrLogin
	docker push $(ECR_REPO):$(VERSION)
	docker push $(ECR_REPO):latest

ecrLogin:
	$(shell aws ecr get-login --no-include-email --region ap-southeast-2)

deploy: dockerPush
	docker-compose run ecsdeploy -c UnderwriteMeServiceCluster -n UnderwriteMeService -i $(ECR_REPO):$(VERSION) -r ap-southeast-2
