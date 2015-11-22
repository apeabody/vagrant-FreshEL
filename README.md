# vagrant-FreshEL

A Vagrant plugin to "Freshen" Enterprise Linux (RHEL/CentOS/similar) during provisioning.  This process includes installing `deltarpms`, a full `yum upgrade` and a reboot to active any new kernel.

## Requirements

- [Vagrant] (https://www.vagrantup.com) >= 1.7.4
- Either Cygwin or Linux build environment including ruby, rubygems, and rake.

## Installation & Configuration

1. Download source code:

  `git clone https://github.com/apeabody/vagrant-FreshEL.git`

2. Build gem from source:

  `rake build`

3. Install plugin:

  `vagrant plugin install ./pkg/vagrant-FreshEL-0.0.1.gem`

4. Enable FreshEl in your Vagrantfile (make sure it is running RHEL, CentOS, or similar distro!):

  `config.vm.provision :FreshEL`

## Known Issues

* Does not avoid non-compatible distributions and operating systems.
* Does not provide sufficent console feedback to user in case of errors.
