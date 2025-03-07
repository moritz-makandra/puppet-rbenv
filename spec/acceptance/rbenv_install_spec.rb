require 'spec_helper_acceptance'

describe 'rbenv::install' do
  context 'with default parameters' do

    let(:user) { 'rbenv-user' }

    let(:pp) do
      <<-MANIFEST
        user { '#{user}':
          ensure => present,
        }
        file { '/home/#{user}':
          ensure => directory,
          owner  => 'rbenv-user',
        } rbenv::install { '#{user}':
          group => '#{user}',
          home  => '/home/#{user}',
        }
      MANIFEST
    end

    it 'applies with no changes on the second run' do
      idempotent_apply(pp)
    end

    describe file '/home/rbenv-user/.profile' do
      its(:content) { should contain 'source /home/rbenv-user/.rbenvrc' }
    end

    describe command "bash -c 'source /home/rbenv-user/.rbenvrc; rbenv --version'" do
      its(:stdout) { should contain 'rbenv' }
    end
  end
end
