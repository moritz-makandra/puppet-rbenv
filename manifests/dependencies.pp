# install build dependencies
# @param packages
#  a list of packages to install
class rbenv::dependencies (
  Array $packages,
) {
  if $facts['os']['family'] == 'RedHat' {
    # this is required for installing libyaml-devel
    exec { '/usr/bin/dnf config-manager --set-enabled crb':
      unless => '/usr/bin/dnf repolist enabled | grep -q crb',
    }
  }
  stdlib::ensure_packages($packages)
}
