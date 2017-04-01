.PHONY: create
.PHONY: delete

create:
	openstack stack create -t kubernetes.yaml -e env.yaml kubernetes

delete:
	openstack stack delete --yes kubernetes
