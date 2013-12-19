require_relative 'spec_helper'

describe 'artifactory' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
    end.converge("#{described_cookbook}")
  end

  before do
    stub_command("update-alternatives --display java | grep '/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java - priority 1100'").and_return(true)
  end

  it 'should update the /etc/security/limits.conf' do
    expect(chef_run).to render_file('/etc/security/limits.conf')
  end
  
  it 'should include the apt recipe' do
    expect(chef_run).to include_recipe 'apt'
  end

  it 'should include the java recipe' do
    expect(chef_run).to include_recipe 'java'
  end

  it 'should install the unzip package' do
    expect(chef_run).to install_package('unzip')
  end

  it 'should install the java7 package' do
    expect(chef_run).to install_package('openjdk-7-jre-headless')
    expect(chef_run).to install_package('openjdk-7-jdk')
  end

end
