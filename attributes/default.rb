#
# Cookbook Name:: crf-cups
# Recipe:: default
#
# Copyright (C) 2016 Crossroads Foundation Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['crf-cups']['certificate']['data_bag']      = nil
default['crf-cups']['certificate']['data_bag_type'] = 'unencrypted'
default['crf-cups']['certificate']['search_id']     = 'cups'
default['crf-cups']['certificate']['cert_file']     = "#{node['fqdn']}.pem"
default['crf-cups']['certificate']['key_file']      = "#{node['fqdn']}.key"
default['crf-cups']['certificate']['cert_path']     = '/etc/cups/ssl'
