require 'spec_helper'

describe 'rbenv::plugin::rubybuild', :type => :define do
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
        should contain_rbenv__plugin("rbenv::plugin::rubybuild::#{user}").with(
          :plugin_name => 'ruby-build',
          :source      => 'https://github.com/rbenv/ruby-build.git',
          :user        => user
        )
      }
    end
  end
end
