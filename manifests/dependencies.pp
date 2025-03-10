class rbenv::dependencies {
  case $facts['os']['family'] {
    'archlinux'      : { require rbenv::dependencies::archlinux }
    'debian'         : { require rbenv::dependencies::ubuntu }
    'redhat', 'Linux'  : { require rbenv::dependencies::centos }
    'suse'           : { require rbenv::dependencies::suse }
    default        : { notice("Could not load dependencies for ${facts['os']['family']}") }
  }
}
