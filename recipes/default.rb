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

include_recipe 'cups::default'

# Install the Foomatic PPDs.
package 'foomatic-db' do
  action :upgrade
end

package 'foomatic-db-ppds' do
  action :upgrade
end

# Remove the default self signed certificates.
file '/etc/cups/ssl/server.key' do
  action :delete
  not_if { ::File.symlink?('/etc/cups/ssl/server.key') }
end

file '/etc/cups/ssl/server.crt' do
  action :delete
  not_if { ::File.symlink?('/etc/cups/ssl/server.crt') }
end

# Create the certificates.
certificate_manage 'cups' do
  data_bag      node['crf-cups']['certificate']['data_bag']
  data_bag_type node['crf-cups']['certificate']['data_bag_type']
  search_id     node['crf-cups']['certificate']['search_id']
  cert_file     node['crf-cups']['certificate']['cert_file']
  key_file      node['crf-cups']['certificate']['key_file']
  cert_path     node['crf-cups']['certificate']['cert_path']
  nginx_cert    true
  owner         'root'
  group         'lp'
end

# Create the symbolic links for the certificate and keys.
link '/etc/cups/ssl/server.key' do
  to "#{node['crf-cups']['certificate']['cert_path']}/private/#{node['crf-cups']['certificate']['key_file']}"
end

link '/etc/cups/ssl/server.crt' do
  to "#{node['crf-cups']['certificate']['cert_path']}/certs/#{node['crf-cups']['certificate']['cert_file']}"
end

# Open the firewall port(s).
firewall_rule 'cups-tcp' do
  protocol :tcp
  port     node['cups']['ports'] 
end

firewall_rule 'cups-udp' do
  protocol :udp
  port     node['cups']['ports']
end
