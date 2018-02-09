#!/bin/bash

virtualenv .
source bin/activate

git clone https://git.openstack.org/openstack/diskimage-builder.git
git clone https://git.openstack.org/openstack/heat-agents.git
git clone https://git.openstack.org/openstack/tripleo-image-elements.git

pip install pep8 pytz
pip install diskimage-builder

export ELEMENTS_PATH="elements:tripleo-image-elements/elements:heat-agents/:diskimage-builder/diskimage_builder/elements"
disk-image-create \
    vm \
    centos7 \
    selinux-permissive \
    epel-install \
    os-collect-config \
    os-refresh-config \
    os-apply-config \
    dib-run-parts \
    heat-config \
    heat-config-script \
    -o centos7-software-config.qcow2

deactivate
