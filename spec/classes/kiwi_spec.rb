require 'spec_helper'
# Rename this file to classname_spec.rb
# Check other boxen modules for examples
# or read http://rspec-puppet.com/tutorial/
describe 'kiwi' do
  it do
    should contain_repository('/tmp/kiwi').with({
        'source'   => 'allending/Kiwi',
        'provider' => 'git',
    })
  end

  it do
    should contain_exec("install").with({
        "command" => "/bin/bash install-templates.sh",
        "cwd" => "/tmp/kiwi/Xcode Templates"
    })
  end

  it do
    should contain_file("clean up").with({
        'path' => '/tmp/kiwi',
        'ensure' => "absent",
        'force' => 'true',
    })
  end
end
