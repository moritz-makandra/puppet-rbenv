define rbenv::plugin::rubybuild (
  $user   = $title,
  $source = 'https://github.com/rbenv/ruby-build.git',
  $group  = $user,
  $home   = '',
  $root   = '',
  $ensure  = present,
  $version = 'master'
) {
  rbenv::plugin { "rbenv::plugin::rubybuild::${user}":
    ensure      => $ensure,
    user        => $user,
    source      => $source,
    plugin_name => 'ruby-build',
    group       => $group,
    home        => $home,
    root        => $root,
    version     => $version,
  }
}
