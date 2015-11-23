begin
  require 'vagrant'
rescue LoadError
  raise "The Vagrant FreshEL plugin must be run within Vagrant"
end

# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.7.4"
  raise "The Vagrant Reload plugin has only be tested with Vagrant 1.7.4"
end

require "vagrant-FreshEL/version"

module VagrantPlugins
  module FreshEL

    class Plugin < Vagrant.plugin("2")
      name "FreshEL"
      description <<-DESC
      "Freshen" Enterprise Linux (RHEL/CentOS/similar) during provisioning.
      DESC

      provisioner "FreshEL" do
        class FreshELProvisioner < Vagrant.plugin("2", :provisioner)

          def initialize(machine, config)
            super
          end

          def configure(root_config)
          end

          def provision
            options = {}
            options[:provision_ignore_sentinel] = false
            @machine.env.ui.warn("Installing deltarpm and yum-utils")
            @machine.communicate.sudo("yum install -y deltarpm yum-utils", nil)
            @machine.env.ui.warn("Running yum upgrade")
            @machine.communicate.sudo("yum upgrade -y", nil)
            @machine.env.ui.warn("Cleanup old Kernels and Kernel-Devel")
            @machine.communitcate.sudo("package-cleanup --oldkernels --count=2")
            @machine.action(:reload, options)
            begin
              sleep 10
            end until @machine.communicate.ready?
          end

          def cleanup
          end

        end
        FreshELProvisioner

      end
    end
  end
end
