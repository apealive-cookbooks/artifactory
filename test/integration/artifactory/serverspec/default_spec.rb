require 'serverspec'
require 'io/console'
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
    cmd = IO.popen("netstat -nlp")
    res = cmd.readlines
    cmd.close
    expect(res.any? {|str| str.include? "8081" }).to be_true
  end
end

