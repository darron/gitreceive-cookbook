# encoding: utf-8
#
# Cookbook Name:: gitreceive
# Recipe:: default
#
# Copyright (C) 2013, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['platform'] == 'ubuntu' && node['platform_version'].to_f <= 10.04
  package 'git-core'
else
  package 'git'
end

remote_file node['gitreceive']['path'] do
  source node['gitreceive']['url']
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

# rubocop:disable StringLiterals
bash 'initialize gitreceive' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    /usr/bin/gitreceive init
  EOH
  not_if { File.exists?('/home/git') }
end
# rubocop:enable StringLiterals

sudo 'git' do
  template  'git.erb' # local cookbook template
end

remote_file node['receiver']['path'] do
  source node['receiver']['url']
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

directory '/home/git/src' do
  owner 'git'
  group 'git'
  mode '0775'
  action :create
end
