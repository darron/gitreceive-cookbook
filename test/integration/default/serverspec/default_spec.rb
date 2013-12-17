# encoding: utf-8
require 'spec_helper'

# Write integration tests with Serverspec - http://serverspec.org/
describe 'gitreceive::default' do
  describe user('git') do
    it { should exist }
  end

  describe user('git') do
    it { should have_home_directory '/home/git' }
  end
end
