.PHONY: create
.PHONY: delete

create:
	openstack stack create -t templates/kubernetes.yaml -e env.yaml kubernetes
	openstack stack output show --format json kubernetes private_key|jq '.[] | select(.Field == "output_value").Value'|xargs echo -e >private_key
	openstack stack output show --format json kubernetes ansible_private_key|jq '.[] | select(.Field == "output_value").Value'|xargs echo -e >ansible_private_key
	chmod 0400 private_key ansible_private_key

delete:
	openstack stack delete --yes kubernetes
	rm -f private_key ansible_private_key
