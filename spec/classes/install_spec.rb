require 'spec_helper'

describe 'openswan', :type => :class do
  ['Debian', 'Ubuntu', 'Redhat', 'Centos', 'Fedora'].each do |operatingsystem|
    let(:facts) do
      {
        :operatingsystem => operatingsystem
      }
    end
    context 'default' do 
      let(:params) do 
        {:ensure => 'present'}
      end
      it { is_expected.to contain_package('openswan').with_ensure('present') }
    end
    context 'purge_openswan' do
      let(:params) do
        {:ensure => 'absent'}
      end
      it { is_expected.to contain_package('openswan').with_ensure('absent') }
    end
  end
end
