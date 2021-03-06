# -*- mode: ruby; coding: utf-8; -*-

require 'spec_helper'

describe port(8080) do
  it { should be_listening }
end

describe command('/usr/bin/curl -s -i http://localhost:8080/seyren/') do
  it {
    should return_exit_status 0
  }
  its(:stdout) {
    should match /HTTP\/1\.1 200/
  }
end

describe file('/opt/seyren/mongo-import-data.json') do
  it { should be_file }
end
