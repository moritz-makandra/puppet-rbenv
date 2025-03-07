# frozen_string_literal: true

require 'spec_helper'

describe 'rbenv::dependencies' do
  on_supported_os.each do |os, os_facts|
    let(:facts) { os_facts }
    let(:hiera_config) { 'hiera.yaml' }

    context "on #{os}" do
      it { should compile }
      it { should contain_package('git') }
      it { should contain_package('curl') }
    end
  end
end
