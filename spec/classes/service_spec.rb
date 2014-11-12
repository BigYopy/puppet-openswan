require 'spec_helper'

describe 'openswan', :type => :class do 
  ['Debian', 'Ubuntu', 'Redhat', 'Centos', 'Fedora'].each do |operatingsystem|  
    context "#{operatingsystem}" do  
      let :facts do
        {
          :operatingsystem => operatingsystem
        }
      end
      it do
        is_expected.to contain_service('ipsec').with({
         :ensure     => 'running',
         :enable     => true,
         :hasstatus  => true,
         :hasrestart => true,
        })
      end
    end
  end
end
