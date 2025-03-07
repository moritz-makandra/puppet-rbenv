# frozen_string_literal: true

require 'spec_helper'

describe 'rbenv::rubygems' do
  let(:title) { 'namevar' }
  let(:user) { 'rubygems-user'}
  let(:version){ '1.2.3' }
  let(:ruby_version) { '1.9.3-p125' }

  let(:params) do
    {
      version: version,
      user: user,
      home: "/home/#{user}",
      ruby: ruby_version,
    }
  end

  let(:pre_condition) do
    <<~PP
      rbenv::install { "#{user}":
        group => '',
        home  => '/project'
      }

      rbenv::compile { "#{ruby_version}":
        user  => '#{user}',
        group => '',
        home  => '/project'
      }
    PP
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it 'updates gems' do
        should contain_exec("update_rubygems_#{user}_#{version}").with(
          user: user,
          command: "/home/#{user}/.rbenv/shims/gem update --system #{version}",
          unless: "/home/#{user}/.rbenv/shims/gem -v | /bin/grep #{version}",
        )
      end
    end
  end
end
