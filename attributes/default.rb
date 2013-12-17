# encoding: utf-8
#
# Cookbook Name:: gitreceive
# Attributes:: default
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

default['gitreceive']['url'] = 'https://raw.github.com/octohost/octohost/master/bin/gitreceive'
default['gitreceive']['path'] = '/usr/bin/gitreceive'

default['receiver']['url'] = 'https://raw.github.com/octohost/octohost/master/bin/receiver.sh'
default['receiver']['path'] = '/home/git/receiver'

default['authorization']['sudo']['include_sudoers_d'] = true
