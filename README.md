
This project uses Hashicorp Packer to automate the (silent) installation of Fedora Server iso and customizes the image using scripts and Ansible. The image is built in an automated fashion and all changes are tracked by source control. Infrastructure-as-code at its best!

## Prerequisites

### Install Virutal Box

This project builds Oracle VirtualBox images and it needs to be installed. [See their installation instructions](https://www.virtualbox.org/wiki/Downloads).

### Install packer

The makefiles assume `packer.io` is on the path, and the name is slightly different vs the [packer installation instructions](https://www.packer.io/intro/getting-started/install.html#precompiled-binaries) since Fedora has a `packer` binary ([cracklib-dicts](https://github.com/cracklib/cracklib), required by anaconda-core).

### Download Fedora Server

Download [Fedora-Server-dvd-x86_64-28-1.1.iso](https://download.fedoraproject.org/pub/fedora/linux/releases/28/Server/x86_64/iso/Fedora-Server-dvd-x86_64-28-1.1.iso) and move it to `/opt/fedora-images/Fedora-Server-dvd-x86_64-28-1.1.iso`.

Alternatively, update the packer [fedora-server-base/buildnode.json](fedora-server-base/buildnode.json) and update to your preferred location. Obvious note: using a different version of Fedora Server may not work without additional changes to the scripts.


## Building the customized images

Execute `make` to start the build process, which will use `packer.io` and VirtualBox to create OVA images.

Three OVA images are created:

- fedora-server-base: Baseline for all server images. Kickstart is used to silently install the ISO and creates a base user. Suggestion: don't add much customization here since the iso installation is very slow to test, and instead use the generated OVA to make further changes.
- fedora-desktop-base: Baseline for all desktop images by installing `@workstation-product-environment`.
- fedora-desktop-customized: Customized desktop image with Slack, Visual Studio Code, Chrome, Firefox.

### Is there a way to test the ansible scripts before using packer?

Yes! It is important to have a quick patch and debug cycle to keep yourself sane, and this is the trick.

Import the OVA that the ansible script is modifying, then I edit the VM settings to use a bridged network adapter, then start the VM. Here's a command to execute a playbook against a specific IP:

`ansible-playbook -i 10.22.0.17, -e "ansible_user=builduser ansible_ssh_pass=thepasswordgoeshere" playbook.yml`
