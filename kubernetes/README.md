Deploying Kubernetes with Heat and Ansible
==========================================

## Requirements

OpenStack Mitaka version.

Guest image - use [script](../image) to build CentOS 7 image. Script use [diskimage-builder](https://docs.openstack.org/developer/diskimage-builder/).

## Creating the stack

1. Update [env.yaml](env.yaml) environment file:

```yaml
parameters:
  network_id: e6db9b9e-4782-44dc-8d99-6bdb9744793d
  image_id: 7960b274-ee05-4a43-a37b-31363346c681
  flavor: m1.medium
  key_name: openstack
  count: 3
```

2. Exec make. Make create new stack with name kubernetes; create private_key - private key file for access to instances, ansible_private_key - private key file for ssh access from master to nodes. Heat create one master and nodes, upload ansible playbooks to the master instance in `/opt/ansible` directory and exec `ansible-playbook` for kubernetes installation.

You can ssh into instances as the `cloud` user:

```
$ ssh cloud@192.168.0.30 -i private_key
```


## Delete stack and cleanup

For delete and cleanup procedure exec:

```
$ make delete
```

Cleanup will remove stack kubernetes and will remove temporary files.
