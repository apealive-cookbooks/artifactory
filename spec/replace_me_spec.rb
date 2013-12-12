require_relative 'spec_helper'

describe 'Your awesome cookbook' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['awesome-attr'] = 'string'
    end.converge('awesome-cookbook')
  end

  it 'should be awesome'
end
