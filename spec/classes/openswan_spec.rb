require 'spec_helper'

describe 'openswan', :type => :class  do
  ['Debian', 'Ubuntu', 'Redhat', 'Centos', 'Fedora'].each do |operatingsystem|
    context "#{operatingsystem}" do
      let :facts do
        {
          :operatingsystem  => operatingsystem
        }
      end

      context 'with ensure => present' do 
        let :params do 
          {:ensure => 'present' }  
        end
        it { is_expected.to contain_class('openswan::params') }
        it { is_expected.to contain_class('openswan') }
        it { is_expected.to contain_class('openswan::install') }
        it { is_expected.to contain_class('openswan::config') }
        it { is_expected.to contain_class('openswan::service') }
      end
      context 'with ensure => absent' do
        let :params do
          {:ensure => 'absent' }
        end
        it { is_expected.to contain_class('openswan::params') }
        it { is_expected.to contain_class('openswan') }
        it { is_expected.to contain_class('openswan::install') }
        it { is_expected.to_not contain_class('openswan::config') }
        it { is_expected.to_not contain_class('openswan::service') }
      end
      context 'with ensure => foo' do
        let :params do
          {:ensure => 'foo' }
        end
        it 'is_expected.to fail' do
          expect { subject }.to raise_error(/foo is not a valid value for ensure attribute/)
        end
      end
    end
  end
  context 'on non supported operating systems' do
    let :facts do
      {:operatingsystem  => 'foo'}
    end
  
    it 'is_expected.to fail' do
      expect { subject }.to raise_error(/"openswan" provides no config for "foo"/)
    end
  end
end
