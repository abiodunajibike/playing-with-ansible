## Actions
1. Install virtualbox:
   - vagrant box add ubuntu/trusty64
   - vagrant init ubuntu/trusty64
2. Update Vagrantfile with the following customizations:
   - memory and cpu allocations
   - provisioner, say ansible and specify playbook name
3. Create playbook file
4. Create inventory file
5. Ping the target machine with ansible
   - ansible all -m ping
   - ansible all -a "/bin/echo hello"
6. Install apache2
7. Use template mode to parameterize index file with variables and copy to target machine
:q
:Q
