.PHONY: create
.PHONY: delete

create:
	openstack stack create -t kubernetes.yaml -e env.yaml kubernetes
	openstack stack output show --format value kubernetes --all|jq '.output_value'|xargs echo -e >private_key
	chmod 0400 private_key

delete:
	openstack stack delete --yes kubernetes
	rm -f private_key
