# Changelog

## [Unreleased](https://github.com/alup/puppet-rbenv/tree/HEAD)

[Full Changelog](https://github.com/alup/puppet-rbenv/compare/v1.2.0...HEAD)

**Closed issues:**

- Plugin Repo onlyif test is broken [\#112](https://github.com/alup/puppet-rbenv/issues/112)
- rbenv plugins always cause puppet changes [\#109](https://github.com/alup/puppet-rbenv/issues/109)
- Global ruby version not set correctly after sourcing .rbenvrc [\#104](https://github.com/alup/puppet-rbenv/issues/104)
- Tag released version [\#103](https://github.com/alup/puppet-rbenv/issues/103)
- Periodically update ruby-build when new rubies are released [\#88](https://github.com/alup/puppet-rbenv/issues/88)
- LICENSE? [\#84](https://github.com/alup/puppet-rbenv/issues/84)
- Rbenv::Compile and Rbenv::Gem run every time [\#80](https://github.com/alup/puppet-rbenv/issues/80)
- Vagrant Provisioning Problems [\#69](https://github.com/alup/puppet-rbenv/issues/69)
- Patch for ruby 1.9.3-p392 [\#67](https://github.com/alup/puppet-rbenv/issues/67)
- Make it possible to pass --keep [\#64](https://github.com/alup/puppet-rbenv/issues/64)
- ruby-build not available in Ubuntu 12.04 [\#62](https://github.com/alup/puppet-rbenv/issues/62)
- Bundler doesn't get installed automatically. [\#60](https://github.com/alup/puppet-rbenv/issues/60)
- rbenv::gem not installing the requested gem [\#59](https://github.com/alup/puppet-rbenv/issues/59)
- Puppet Forge version is incorrect [\#56](https://github.com/alup/puppet-rbenv/issues/56)

**Merged pull requests:**

- Update plugins only if there is a newer version [\#108](https://github.com/alup/puppet-rbenv/pull/108) ([rudolfs](https://github.com/rudolfs))
- Add libffi package, needed by Ruby 2.2 [\#107](https://github.com/alup/puppet-rbenv/pull/107) ([francocatena](https://github.com/francocatena))
- replace su with Puppet::Util::Execution.execute [\#106](https://github.com/alup/puppet-rbenv/pull/106) ([igalic](https://github.com/igalic))
- removed trailing space [\#96](https://github.com/alup/puppet-rbenv/pull/96) ([pmenglund](https://github.com/pmenglund))
- Add dependency packages for Archlinux [\#92](https://github.com/alup/puppet-rbenv/pull/92) ([francocatena](https://github.com/francocatena))
- Fix line ending issues with templates. [\#82](https://github.com/alup/puppet-rbenv/pull/82) ([TrevorS](https://github.com/TrevorS))
- Style fixes [\#81](https://github.com/alup/puppet-rbenv/pull/81) ([nferch](https://github.com/nferch))
- Add a source parameter to rbenv::gem [\#78](https://github.com/alup/puppet-rbenv/pull/78) ([lglenn](https://github.com/lglenn))
- Add /bin to Exec paths [\#77](https://github.com/alup/puppet-rbenv/pull/77) ([lglenn](https://github.com/lglenn))
- Add logoutput =\> 'on\_failure' to exec calls in compile stage. [\#75](https://github.com/alup/puppet-rbenv/pull/75) ([intjonathan](https://github.com/intjonathan))
- rbenv::install doesn't work behind firewall [\#74](https://github.com/alup/puppet-rbenv/pull/74) ([ghost](https://github.com/ghost))
- Add an Exec for updating rbenv plugins [\#73](https://github.com/alup/puppet-rbenv/pull/73) ([ktham](https://github.com/ktham))
- Handle old Lenny distribution [\#71](https://github.com/alup/puppet-rbenv/pull/71) ([rds13](https://github.com/rds13))
- Add Linux to the osfamily dependencies, for the Amazon Linux AMI. [\#68](https://github.com/alup/puppet-rbenv/pull/68) ([geekle](https://github.com/geekle))
- Specify bundler version [\#66](https://github.com/alup/puppet-rbenv/pull/66) ([lmars](https://github.com/lmars))
- Support --keep in ruby-build. Fixes \#64 [\#65](https://github.com/alup/puppet-rbenv/pull/65) ([p0deje](https://github.com/p0deje))

## [v1.2.0](https://github.com/alup/puppet-rbenv/tree/v1.2.0) (2013-02-17)

[Full Changelog](https://github.com/alup/puppet-rbenv/compare/v0.2.0...v1.2.0)

**Implemented enhancements:**

- User group. [\#7](https://github.com/alup/puppet-rbenv/issues/7)
- Multiple installations [\#4](https://github.com/alup/puppet-rbenv/issues/4)
- Shared installation [\#3](https://github.com/alup/puppet-rbenv/issues/3)

**Closed issues:**

- failed installing bundler [\#53](https://github.com/alup/puppet-rbenv/issues/53)
- puppet master breaks [\#50](https://github.com/alup/puppet-rbenv/issues/50)
- Create $rbenv\_root/cache if tarball caching gets merged in [\#47](https://github.com/alup/puppet-rbenv/issues/47)
- Missing dependency when compiling with global =\> true [\#43](https://github.com/alup/puppet-rbenv/issues/43)
- Invalid parameter ruby at manifests/gem.pp [\#41](https://github.com/alup/puppet-rbenv/issues/41)
- Puppet::Parser::AST::Resource failed with error ArgumentError: Invalid resource type rbenvgem [\#35](https://github.com/alup/puppet-rbenv/issues/35)
- Build is failing when using provider require statement [\#27](https://github.com/alup/puppet-rbenv/issues/27)
- Update Puppet Forge [\#26](https://github.com/alup/puppet-rbenv/issues/26)
- How are we supposed to pass default=\>true to rbenv::compile? [\#20](https://github.com/alup/puppet-rbenv/issues/20)
- Rbenv::Gem for bundler is ran before ruby is compiled [\#19](https://github.com/alup/puppet-rbenv/issues/19)
- Git clone appears to fail [\#14](https://github.com/alup/puppet-rbenv/issues/14)
- "Cannot reassign variable home\_dir" [\#13](https://github.com/alup/puppet-rbenv/issues/13)
-  "rehash-rbenv $user" is always executed [\#12](https://github.com/alup/puppet-rbenv/issues/12)
- Environment variable PATH not preserved [\#11](https://github.com/alup/puppet-rbenv/issues/11)

**Merged pull requests:**

- Pass in env vars for compilation as array [\#58](https://github.com/alup/puppet-rbenv/pull/58) ([fgrehm](https://github.com/fgrehm))
- Pass --disable-install-doc configure option by default, allow others [\#57](https://github.com/alup/puppet-rbenv/pull/57) ([intjonathan](https://github.com/intjonathan))
- Set ruby as global after compiling ruby [\#54](https://github.com/alup/puppet-rbenv/pull/54) ([fgrehm](https://github.com/fgrehm))
- Rbenv cache dir owner [\#51](https://github.com/alup/puppet-rbenv/pull/51) ([rds13](https://github.com/rds13))
- Creates cache folder for rbenv installations [\#49](https://github.com/alup/puppet-rbenv/pull/49) ([fgrehm](https://github.com/fgrehm))
- Update readme references to latest ruby release [\#48](https://github.com/alup/puppet-rbenv/pull/48) ([fgrehm](https://github.com/fgrehm))
- Add missing comma to rbenv-install example [\#45](https://github.com/alup/puppet-rbenv/pull/45) ([fgrehm](https://github.com/fgrehm))
- Fixes bundler gem install in environments with no pre-existing ruby interpreter [\#34](https://github.com/alup/puppet-rbenv/pull/34) ([th3hunt](https://github.com/th3hunt))
- Two fixes to help when installing to non-standard paths [\#33](https://github.com/alup/puppet-rbenv/pull/33) ([jasongill](https://github.com/jasongill))
- Update readme examples with a 1.9.3 patchlevel that exists :\) [\#32](https://github.com/alup/puppet-rbenv/pull/32) ([fgrehm](https://github.com/fgrehm))
- Add ensure parameter to rbenvgem title in gem resource [\#30](https://github.com/alup/puppet-rbenv/pull/30) ([intjonathan](https://github.com/intjonathan))
- Fix module autoloading \(\#27\) [\#29](https://github.com/alup/puppet-rbenv/pull/29) ([vjt](https://github.com/vjt))
- Plugins support [\#25](https://github.com/alup/puppet-rbenv/pull/25) ([fgrehm](https://github.com/fgrehm))
- Support for custom build definition [\#24](https://github.com/alup/puppet-rbenv/pull/24) ([fgrehm](https://github.com/fgrehm))
- Fix lint checks [\#23](https://github.com/alup/puppet-rbenv/pull/23) ([fgrehm](https://github.com/fgrehm))
- Fix random interpolation issues [\#22](https://github.com/alup/puppet-rbenv/pull/22) ([fgrehm](https://github.com/fgrehm))
- Require rbenvgem provider with full path from rbenvgem type [\#21](https://github.com/alup/puppet-rbenv/pull/21) ([fgrehm](https://github.com/fgrehm))
- fix test suite [\#18](https://github.com/alup/puppet-rbenv/pull/18) ([mislav](https://github.com/mislav))
- fix git clone of ruby-build [\#17](https://github.com/alup/puppet-rbenv/pull/17) ([mislav](https://github.com/mislav))
- fix home directory default for rbenv::compile [\#16](https://github.com/alup/puppet-rbenv/pull/16) ([mislav](https://github.com/mislav))
- Fixed git clone going wrong in install [\#15](https://github.com/alup/puppet-rbenv/pull/15) ([chiel](https://github.com/chiel))
- Add Option to set home directory and to set the group [\#9](https://github.com/alup/puppet-rbenv/pull/9) ([LStuker](https://github.com/LStuker))
- Fix typo in README [\#6](https://github.com/alup/puppet-rbenv/pull/6) ([emyl](https://github.com/emyl))

## [v0.2.0](https://github.com/alup/puppet-rbenv/tree/v0.2.0) (2012-05-28)

[Full Changelog](https://github.com/alup/puppet-rbenv/compare/v0.1.0...v0.2.0)

**Closed issues:**

- Add basic tests [\#2](https://github.com/alup/puppet-rbenv/issues/2)

**Merged pull requests:**

- CentOS compatibility and allow installs for multiple users [\#5](https://github.com/alup/puppet-rbenv/pull/5) ([benders](https://github.com/benders))

## [v0.1.0](https://github.com/alup/puppet-rbenv/tree/v0.1.0) (2012-04-07)

[Full Changelog](https://github.com/alup/puppet-rbenv/compare/f3a36e786a980af99ce7920d180bf8b4944ef822...v0.1.0)

**Closed issues:**

- Convert this to a module [\#1](https://github.com/alup/puppet-rbenv/issues/1)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
