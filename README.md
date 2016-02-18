## crf-cups Cookbook

A wrapper to the [cups](https://github.com/biola/chef-cups) cookbook.  This adds support for retriving certificates from a chef vault, adding user authentication and the [foomatic PPDs](http://www.linuxfoundation.org/collaborate/workgroups/openprinting/database/foomatic).

## Supported Platforms

Currently only supports RHEL/CentOS platforms.

## Attributes

| Key | Type | Description | Default |
| --- | ---- | ----------- | ------- |
| `['crf-cups']['certificate']['data_bag']` | `bool` | The name of the data bag/vault that contains the certificates. | `nil` |
| `['crf-cups']['certificate']['data_bag_type']` | `string` | The type of data bag used (highly recomment using `chef-vault`). | `unencrypted` |
| `['crf-cups']['certificate']['search_id']` | `string` | The id of the certificate within the data bag. | `cups` |
| `'crf-cups']['certificate']['cert_file']` | `string` | The name of the certificate file. *Note:* cups doesn't directly support intermediate certificates.  If an intermediate certificate is provided within the databag it will be appended to the certificate file. | `#{node['fqdn']}.pem` |
| `['crf-cups']['certificate']['key_file']` | `string` | The name of the key file. | `#{node['fqdn']}.key` |
| `['crf-cups']['certificate']['cert_path']` | `string` | The full path the certificate directory for cups. | `/etc/cups/ssl` |

## Usage

### crf-cups::default

Before adding the recipe to the run list a data bag must be created to contain the certificate as per the [certificate cookbook](https://supermarket.chef.io/cookbooks/certificate).  It is highly recommended that a `chef-vault` is used.  Then include `crf-cups` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[crf-cups::default]"
  ]
}
```

## License and Authors

Author:: Crossroads Foundation Ltd (<itdept@crossroads.org.hk>)

Copyright (C) 2016 Crossroads Foundation Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
