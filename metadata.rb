name             'crf-cups'
maintainer       'Crossroads Foundation Ltd'
maintainer_email 'itdept@crossroads.org.hk'
license          'Apache 2.0'
description      'Installs/Configures crf-cups'
long_description 'Installs/Configures crf-cups'
version          '0.1.0'

depends 'cups'
depends 'certificate'

%w(ubuntu debian redhat centos amazon scientific smartos).each do |os|
  supports os
end
