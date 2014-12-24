require 'spec_helper'

describe service('unicorn') do
  it { should be_enabled }
  it { should be_running }
end
