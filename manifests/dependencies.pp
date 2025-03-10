# install build dependencies
# @param packages
#  a list of packages to install
class rbenv::dependencies (
  Array $packages,
) {
  stdlib::ensure_packages($packages)
}
