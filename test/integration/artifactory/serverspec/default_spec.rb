require 'serverspec'
require 'net/http'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe 'artifactory' do
  it 'should install artifactory' do
    expect(file('/opt/artifactory/bin/artifactoryctl')).to be_file
  end

  it 'should start the artifactory web service on port 8081' do
    expect(Net::HTTP.get('localhost:8081', '')).to include("artifactory")
  end
end

