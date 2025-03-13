require 'spec_helper'

describe 'rbenv::plugin', :type => :define do
  on_supported_os.each do |os, os_facts|
    let(:user)        { 'tester' }
    let(:plugin_name) { 'rbenv-vars' }
    let(:dot_rbenv)   { "/home/#{user}/.rbenv" }
    let(:source)      { 'https://github.com/rbenv/plugin' }
    let(:title)       { "rbenv::plugin::#{user}::#{plugin_name}" }
    let(:params)      { {:user => user, :plugin_name => plugin_name, :source => source} }
    let(:facts)       { os_facts }

    let(:target_path) { "#{dot_rbenv}/plugins/#{plugin_name}" }

    let(:pre_condition) {
      <<~PP
        rbenv::install { "#{user}":
          group => '',
        }
      PP
    }

    context "on #{os}" do
      it 'clones the plugin repo' do
      should contain_vcsrepo(target_path).with(
          # require: /rbenv::install #{user}/,
          require: /File.*rbenv::plugins #{user}/,
          user: user,
          revision: 'master'
        )
      end
      context 'with source != git' do
        let(:source) { 'something != git' }

        it 'fails informing that it is not supported yet' do
          expect {
            should contain_exec("rbenv::plugin::checkout #{user} #{plugin_name}")
          }.to raise_error(Puppet::Error, /Only git plugins are supported/)
        end
      end
    end
  end
end
