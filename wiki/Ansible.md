# Ansible

## Facts

Ansible facts are pieces of information about the remote systems that Ansible gathers when it connects to them. These facts are collected by the `setup` module and include details about the system's hardware, network configuration, operating system, and more. These facts can be used in playbooks to make decisions based on the state of the remote systems.

### Key Points:
1. **Gathering Facts**: By default, Ansible gathers facts at the beginning of a playbook run. This can be controlled using the `gather_facts` directive.
2. **Accessing Facts**: Facts are stored as variables and can be accessed using the `ansible_facts` dictionary or directly by their names.
3. **Common Facts**: Examples include `ansible_hostname`, `ansible_os_family`, `ansible_ip_addresses`, etc.
4. **Custom Facts**: You can also create custom facts by placing scripts in the `/etc/ansible/facts.d` directory on the remote systems.