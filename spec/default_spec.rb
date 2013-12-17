# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'gitreceive::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs git' do
    expect(chef_run).to install_package('git')
  end

  it 'grabs and installs gitreceive' do
    expect(chef_run).to create_remote_file('/usr/bin/gitreceive')
  end

  # Can't test for this since it's created with gitreceive init
  #
  # it 'creates a user' do
  #   expect(chef_run).to create_user('git')
  # end

  it 'grabs and installs receiver' do
    expect(chef_run).to create_remote_file('/home/git/receiver')
  end

  it 'creates the /home/git/src/ directory' do
    expect(chef_run).to create_directory('/home/git/src')
  end

end
