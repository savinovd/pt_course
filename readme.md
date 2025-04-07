# HW4 - OSINT Tool Installation and Configuration

This project contains Ansible playbooks for automating the installation and configuration of the following tools: Amass, theHarvester, Subfinder, and GitDorker on both local macOS and remote Ubuntu EC2 instances.
NOTE: It can no work in your local env.

## Installation

### Prerequisites

To work with this project, you need:

1. **Ansible**:
   - Make sure Ansible is installed on your computer. If it's not installed, you can install it using the following command:
     - **Linux/MacOS**:
       ```bash
       brew install ansible
       ```
2. **Python**:
   - Ensure that Python 3 is installed. You can check the version using:
     ```bash
     python3 --version
     ```

### Running the Playbook

To run the Ansible playbook and install the tools, execute the following command in the hw4 dir:

```bash
ansible-playbook -i inventory.yml playbook.yml
```

OR

```bash
./run.sh ec2
```

This will automatically install and configure the following tools:

1. **Amass**:
   - Installed via `snap` on Ubuntu EC2 instances or via `homebrew` on macOS.
   - Insatallation will be skipped if amass is already present.
   
2. **theHarvester**:
   - Installed using Python's `pip` package manager.

3. **Subfinder**:
   - Installed via Go language using the Go installer.

4. **Shodan-cli**:
   - Installed using Python's `pip` package manager.

5. **GitDorker**:
   - Installed by cloning the repository and installing required Python dependencies.

### Configuration

1. **inventory.yml**:
   - This file contains the host configuration. It supports both local macOS and remote EC2 Ubuntu instances. Edit the file to specify your host information.
   - Creds(ip, username, path to ssh_key) have to be specified in `/host_vars/`.

2. **playbook.yml**:
   - The main playbook that automates the installation and configuration of the tools on the specified hosts.

3. **roles directory**:
   - Each tool (Amass, theHarvester, Subfinder, GitDorker, Shodan-cli) has its own Ansible role defined in the `roles` directory. Each role installs and configures the tool according to its requirements.


## Troubleshooting

- Ensure all dependencies (like Python 3, Ansible) are installed properly.
- If running the playbook on a remote EC2 instance, make sure the instance has the necessary security group configurations (SSH access).
- Ensure all creds are set.