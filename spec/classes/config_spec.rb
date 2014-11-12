require 'spec_helper'

describe 'openswan', :type => :class do
  ['Debian', 'Ubuntu', 'Redhat', 'Centos', 'Fedora'].each do |operatingsystem|
    let :facts do
      {
        :operatingsystem => operatingsystem 
      }
    end      
    context 'connections_dir = secrets_dir' do
      let(:params) do
        {
        :ensure             => 'present',
        :ipsec_conf         => '/etc/ipsec.conf',
        :connections_dir    => '/etc/ipsec.d/connection',
        :ipsec_secrets_conf => '/etc/ipsec.secrets',
        :secrets_dir        => '/etc/ipsec.d/connection',
        }
      end
      it do
        is_expected.to contain_file('/etc/ipsec.conf').with({
          'ensure'  => 'file',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644',
        })
        is_expected.to contain_file('/etc/ipsec.d/connection').with({
          'ensure'  => 'directory',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0744',
        })
        is_expected.to contain_file('/etc/ipsec.secrets').with({
          'ensure'  => 'file',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0600',
        })
      end
    end
    context 'connections_dir != secrets_dir' do
      let(:params) do
        {
        :ensure             => 'present',
        :ipsec_conf         => '/etc/ipsec.conf',
        :connections_dir    => '/etc/ipsec.d/connection',
        :ipsec_secrets_conf => '/etc/ipsec.secrets',
        :secrets_dir        => '/etc/ipsec.d/secrets',
        }
      end
      it do
        is_expected.to contain_file('/etc/ipsec.conf').with({
          'ensure'  => 'file',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644',
        })
        is_expected.to contain_file('/etc/ipsec.d/connection').with({
          'ensure'  => 'directory',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0744',
        })
        is_expected.to contain_file('/etc/ipsec.secrets').with({
          'ensure'  => 'file',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0600',
        })
        is_expected.to contain_file('/etc/ipsec.d/secrets').with({
          'ensure'  => 'directory',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0744',
        })
      end
    end
  end
end
