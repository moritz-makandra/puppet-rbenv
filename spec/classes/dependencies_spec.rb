# frozen_string_literal: true

require 'spec_helper'

describe 'rbenv::dependencies' do
  on_supported_os.each do |os, os_facts|
    let(:facts) { os_facts }

    context "on #{os}" do
      it { should compile }

      %w[
        autoconf
        bison
        build-essential
        curl
        git
        libc6-dev
        libffi-dev
        libssl-dev
        libxml2-dev
        libxslt1-dev
        libyaml-dev
        openssl
        zlib1g
        zlib1g-dev
      ].
        each do |package|
        it { should contain_package(package) }
      end
    end
  end
end
