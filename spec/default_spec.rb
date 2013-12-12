require_relative 'spec_helper'

describe 'artifactory' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
    end.converge("#{described_cookbook}")
  end

  it 'should include the apt recipe' do
    expect(chef_run).to include_recipe 'apt'
  end

  it 'should include the java recipe' do
    expect(chef_run).to include_recipe 'java'
  end

  it 'should include the runit recipe' do
    expect(chef_run).to include_recipe 'runit'
  end

  it 'should install the unzip package' do
    expect(chef_run).to install_package('unzip')
  end

  it 'should install the java7 package' do
    expect(chef_run).to install_package('openjdk-7-jre')
    expect(chef_run).to install_package('openjdk-7-jdk')
  end

  # it 'should install artifactory into /opt/artifactory' do
  #   expect(chef_run).to 
  # end
end
