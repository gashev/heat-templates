Deploying Kubernetes with Heat
==============================

## Requirements

OpenStack Mitaka version.

Guest image - use [script][../image] to build CentOS 7 image. Script use [diskimage-builder][https://docs.openstack.org/developer/diskimage-builder/].

## Creating the stack

1. Update [env.yaml][env.yaml] environment file:

    ```yaml
    parameters:
      network_id: e6db9b9e-4782-44dc-8d99-6bdb9744793d
      image_id: 7960b274-ee05-4a43-a37b-31363346c681
      flavor: m1.medium
      key_name: openstack
      count: 3
    ```

2. Exec make. Make archive ansible folder; create new stack with name kubernetes; create private_key - private key file for access to instances.
You can ssh into instances as the `cloud` user:

    ```bash
    $ ssh cloud@192.168.0.30 -i private_key
    ```

## Delete stack and cleanup

For delete and cleanup procedure exec

    ```bash
    $ make delete
    ```

Stack will deleted and temporary files will removed.
