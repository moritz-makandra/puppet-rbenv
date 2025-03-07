require 'spec_helper'

describe 'rbenv::gem', type: :define do
  # User must be unique to this spec so that our fixture doesn't break other specs.
  # User and version must match what's in the Exec[rbenv::compile...]
  # in spec/fixtures/manifests/site.pp so that the 'is this ruby installed' test
  # in rbenvgem.pp will pass.
  let(:user)           { 'gem_tester' }
  let(:ruby_version)   { '1.9.3-p125' }
  let(:title)          { 'somegem' }
  let(:gem_name)       { params[:gem] || title }
  let(:rbenv)          { "/home/#{user}/.rbenv/versions/#{ruby_version}" }
  let(:_ensure)        { params[:ensure] || 'present' }
  let(:source)         { params[:source] || '' }
  let(:default_params) { { user: user, ruby: ruby_version } }
  let(:params)         { default_params.merge(@params) }

  before(:each) do
    @params = {}
  end

  describe 'when the ruby version has not been installed' do
    let(:ruby_version) { '0.0.0' }

    it 'fails' do
      expect {
        is_expected.to contain_class('foo')
      }.to raise_error(Puppet::Error, %r{Rbenv-Ruby #{ruby_version} for user #{user} not found in catalog})
    end
  end

  shared_examples 'rbenvgem' do
    it {
      is_expected.to contain_rbenvgem("#{user}/#{ruby_version}/#{gem_name}/#{_ensure}").with(
        'ensure' => _ensure,
        'user' => params[:user],
        'gemname' => gem_name,
        'ruby' => params[:ruby],
        'rbenv' => rbenv,
        'source' => source,
      )
    }
  end

  it_behaves_like 'rbenvgem'

  describe 'when there is a source param' do
    before(:each) do
      params[:source] = 'foo'
    end
    it_behaves_like 'rbenvgem'
  end

  describe 'when there is an ensure param' do
    before(:each) do
      params[:ensure] = 'absent'
    end
    it_behaves_like 'rbenvgem'
  end

  describe 'when there is a gem param' do
    before(:each) do
      params[:gem] = 'some-other-gem'
    end
    it_behaves_like 'rbenvgem'
  end

  describe 'when there is a home param' do
    before(:each) do
      params[:home] = '/usr/local/foo'
    end
    let(:rbenv) { "#{params[:home]}/.rbenv/versions/#{ruby_version}" }

    it_behaves_like 'rbenvgem'
  end

  describe 'when there is a root param' do
    let(:rbenv) { "#{params[:root]}/versions/#{ruby_version}" }

    before(:each) do
      params[:root] = '/usr/local/bar/.rbenv'
    end
    it_behaves_like 'rbenvgem'

    describe 'when there is both a home and a root param the root takes precedence' do
      before(:each) do
        params[:home] = '/usr/local/foo'
      end
      it_behaves_like 'rbenvgem'
    end
  end
end
