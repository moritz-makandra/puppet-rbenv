define rbenv::plugin::rbenvvars (
  $user   = $title,
  $source = 'https://github.com/rbenv/rbenv-vars.git',
  $group  = $user,
  $home   = '',
  $root   = '',
  $ensure  = present,
  $version = 'master'
) {
  rbenv::plugin { "rbenv::plugin::rbenvvars::${user}":
    ensure      => $ensure,
    user        => $user,
    source      => $source,
    plugin_name => 'rbenv-vars',
    group       => $group,
    home        => $home,
    root        => $root,
    version     => $version,
  }
}
