require 'spec_helper'

describe 'rbenv::dependencies' do
  on_supported_os.each do |os, os_facts|

    let(:facts){ os_facts }
    let(:hiera_config){ 'hiera.yaml'}

    context "on #{os}" do

      it { is_expected.to compile }

      [
        'autoconf',
        'automake',
        'binutils',
        'bison',
        'build-essential',
        'curl',
        'git',
        'libc6-dev',
        'libffi-dev',
        'libreadline-dev',
        'libreadline8',
        'libssl-dev',
        'libxml2-dev',
        'libxslt1-dev',
        'libyaml-dev',
        'make',
        'openssl',
        'zlib1g',
        'zlib1g-dev',
      ]
      .each do |package|
        it { is_expected.to contain_package(package) }
      end

      describe 'readline is installed in the correct version' do
        case os_facts[:os]['distro']['codename']
        when 'noble'
          it { is_expected.to contain_package('libreadline8t64') }
          it { is_expected.to contain_package('libreadline-dev') }
        end
      end
    end
  end
end
