# coding: utf-8
require File.expand_path('../lib/vagrant-FreshEL/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "vagrant-FreshEL"
  spec.version       = VagrantPlugins::FreshEL::VERSION
  spec.date          = '2015-11-21'
  spec.authors       = ["Andrew Peabody"]
  spec.email         = ["apeabody@gmail.com"]
  spec.description   = %q{A vagrant plugin which updates RHEL/CentOS/similar distros and reboots the box ONLY on firstboot}
  spec.summary       = %q{Update RHEL/CentOS/similar distros and then reboots on firstboot.}
  spec.homepage      = "http://github.com/apeabody/vagrant-RHEL-update"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
