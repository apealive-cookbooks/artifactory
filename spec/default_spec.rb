require_relative 'spec_helper'

describe 'artifactory' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
    end.converge('described_cookbook')
  end

  it 'should include the apt cookbook' do
    expect(chef_run).to include_recipe 'apt'
  end
end
