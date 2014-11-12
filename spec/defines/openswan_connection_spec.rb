require 'spec_helper'

describe 'openswan::connection', :type => :define do
  ['Debian', 'Ubuntu', 'Redhat', 'Centos', 'Fedora'].each do |operatingsystem|
    let(:title) { 'vpn_end_to_end' }
    let(:facts) do {
      :operatingsystem => operatingsystem }
    end
    let(:precondition) {'class { "openswan": }'}
    context 'create connetcion' do
      let(:params) {{ :ensure => 'present' }}
      it do
        is_expected.to contain_file('/etc/ipsec.d/connection/vpn_end_to_end.conf').with({
          'ensure' => 'present',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
        is_expected.to contain_file('/etc/ipsec.d/connection/vpn_end_to_end.secrets').with({
          'ensure' => 'present',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0600',
        })
      end
    end
    context 'remove connetcion' do
      let(:params) {{ :ensure => 'absent' }}
      it do
        is_expected.to contain_file('/etc/ipsec.d/connection/vpn_end_to_end.conf').with({
          'ensure' => 'absent',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        })
        is_expected.to contain_file('/etc/ipsec.d/connection/vpn_end_to_end.secrets').with({
          'ensure' => 'absent',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0600',
        })
      end
    end
    context 'remove connetcion' do
      let(:params) {{ :ensure => 'foo' }}
      it 'is_expected.to fail' do
          expect { subject }.to raise_error(/foo is not a valid value for ensure attribute/)
      end
    end
  end
end

