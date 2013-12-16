require 'serverspec'

include ServerSpec::Helper::Exec
include ServerSpec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe 'artifactory' do
  it 'should install artifactory' do
    expect(file('opt/artifactory')).to be_file
  end
end
