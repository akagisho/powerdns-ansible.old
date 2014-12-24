require 'spec_helper'

describe package('pdns-server') do
  it { should be_installed }
end

describe service('pdns') do
  it { should be_enabled }
  it { should be_running }
end

describe port(53) do
  it { should be_listening }
end
