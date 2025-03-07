require 'spec_helper'

describe 'rbenv::definition', type: :define do
  let(:user)         { 'tester' }
  let(:ruby_version) { '1.9.3-p125' }
  let(:title)        { "rbenv::definition::#{user}::#{ruby_version}" }
  let(:dot_rbenv)    { "/home/#{user}/.rbenv" }
  let(:target_path)  { "#{dot_rbenv}/plugins/ruby-build/share/ruby-build/#{ruby_version}" }
  let(:params)       { { user: user, ruby: ruby_version, source: definition } }

  let(:pre_condition)  do
    <<~PP
      rbenv::install { "#{user}":
        group => '',
        home  => '/project'
      }
      rbenv::plugin {"ruby-build":
        user   => '#{user}',
        source => 'git://gist.com/ree',
      }
    PP
  end

  context 'puppet' do
    let(:definition) { 'puppet:///custom-definition' }

    it 'copies the file to the right path' do
      is_expected.to contain_file("rbenv::definition-file #{user} #{ruby_version}").with(
        path: target_path,
        source: definition,
      )
    end
  end

  context 'http' do
    let(:definition) { 'http://gist.com/ree' }

    it 'downloads file to the right path' do
      is_expected.to contain_exec("rbenv::definition-file #{user} #{ruby_version}").with(
        command: "wget #{definition} -O #{target_path}",
        creates: target_path,
      )
    end
  end

  context 'https' do
    let(:definition) { 'https://gist.com/ree' }

    it 'downloads file to the right path' do
      is_expected.to contain_exec("rbenv::definition-file #{user} #{ruby_version}").with(
        command: "wget #{definition} -O #{target_path}",
        creates: target_path,
      )
    end
  end
end
