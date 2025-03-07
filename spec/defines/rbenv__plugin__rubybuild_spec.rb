require 'spec_helper'

describe 'rbenv::plugin::rubybuild', type: :define do
  let(:user)      { 'tester' }
  let(:title)     { user }

  let(:pre_condition) do
    <<~PP
      rbenv::install { "#{user}":
        group => '',
        home  => '/project'
      }
    PP
  end

  it {
    is_expected.to contain_rbenv__plugin("rbenv::plugin::rubybuild::#{user}").with(
      plugin_name: 'ruby-build',
      source: 'https://github.com/sstephenson/ruby-build.git',
      user: user,
    )
  }
end
