require 'spec_helper'

describe 'rbenv::plugin::rbenvvars', :type => :define do
  on_supported_os.each do |os, os_facts|
    let(:user)      { 'tester' }
    let(:title)     { user }
    let(:facts)     { os_facts }

    let(:pre_condition) do
      <<~PP
        rbenv::install { "#{user}":
          group => '',
          home  => '/project'
        }
      PP
    end

    context "on #{os}" do
      it {
        should contain_rbenv__plugin("rbenv::plugin::rbenvvars::#{user}").with(
          :plugin_name => 'rbenv-vars',
          :source      => 'https://github.com/rbenv/rbenv-vars.git',
          :user        => user
        )
      }
    end
  end
end
