#!/bin/sh

echo "SCENARIO 1: create VPC"
ansible-playbook test.yml -e "ecs_name=ansible-test02 localaction=create waitfor=true" || exit 1
echo "SCENARIO 2: show VPC"
ansible-playbook test.yml -e "vpc_name=ansible-vpc02 localaction=show" || exit 1
echo "SCENARIO 2: show router VPC"
ansible-playbook test.yml -e "vpc_name=ansible-vpc02 localaction=router" || exit 1
echo "SCENARIO 3: list VPC"
ansible-playbook test.yml -e "localaction=list" || exit 1
echo "SCENARIO 4: delete VPC"
ansible-playbook test.yml -e "vpc_name=ansible-vpc02 localaction=delete" || exit 1
echo "SCENARIO 5: create VPC with SNAT"
ansible-playbook test.yml -e "ecs_name=ansible-test02 enable_snat=true localaction=create waitfor=true" || exit 1
echo "SCENARIO 6: delete VPC"
ansible-playbook test.yml -e "vpc_name=ansible-vpc02 localaction=delete" || exit 1
