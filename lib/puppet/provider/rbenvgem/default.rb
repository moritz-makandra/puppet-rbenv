Puppet::Type.type(:rbenvgem).provide :default do
  desc 'Maintains gems inside an RBenv setup'

  def install
    args = if version[0].to_i == 1
             ['install', '--no-rdoc', '--no-ri']
           else
             ['install', '--no-document']
           end
    args << "-v#{resource[:ensure]}" unless resource[:ensure].is_a?(Symbol)
    args << ['--source', "'#{resource[:source]}'"] if resource[:source] != ''
    args << gem_name
    output = gem(*args)
    raise "Could not install: #{output.chomp}" if output.include?('ERROR')
  end

  def uninstall
    gem 'uninstall', '-aIx', gem_name
  end

  def latest
    @latest ||= list(:remote)
  end

  def current
    list
  end

  def version
    gem '-v'
  end

  private

  def gem_name
    resource[:gemname]
  end

  def gem(*args)
    require 'etc'
    user = resource[:user]
    home = Etc.getpwnam(user)[:dir]

    exe  = "#{resource[:rbenv]}/bin/gem"

    Puppet::Util::Execution.execute([exe, *args].join(' '),
                                    uid: user,
                                    failonfail: true,
                                    custom_environment: {
                                      'HOME'          => home,
                                      'RBENV_VERSION' => resource[:ruby],
                                    })
  end

  def list(where = :local)
    args = ['list', where == :remote ? '--remote' : '--local', "#{gem_name}$"]

    gem(*args).lines.map do |line|
      line =~ %r{^(?:\S+)\s+\((.+)\)}

      return nil unless Regexp.last_match(1)

      # Fetch the version number
      ver = Regexp.last_match(1).split(%r{,\s*})
      ver.empty? ? nil : ver
    end.first
  end
end
