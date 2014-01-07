require 'spec_helper'

describe service("artifactory") do
  it { should be_running }
end

describe port(8081) do
  it { should be_listening }
end

