# Cookbook Name:: wlp
# Attributes:: default
#
# (C) Copyright IBM Corporation 2013.
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

#<> User name under which the server is installed and runs.
default[:wlp][:user] = "wlp"

#<> Group name under which the server is installed and runs.
default[:wlp][:group] = "wlp-admin"

#<
# Use the `java` cookbook to install Java. If Java is installed using a different method  
# set it to `false`. The Java executables must be available on the __PATH__. 
#>
default[:wlp][:install_java] = true

#<> Base installation directory.
default[:wlp][:base_dir] = "/opt/was/liberty"

#<> Set user configuration directory (wlp.user.dir). Set to 'nil' to use default location.
default[:wlp][:user_dir] = nil

#<> Installation method. Set it to 'archive' or 'zip'.
default[:wlp][:install_method] = 'archive'

#<
# Base URL location for downloading the runtime, extended, and extras Liberty profile archives. 
# Must be set when `node[:wlp][:install_method]` is set to `archive`. 
#>
default[:wlp][:archive][:base_url] = "http://10.88.36.218:8088"

#<> URL location of the runtime archive.
default[:wlp][:archive][:runtime][:url] = "#{node[:wlp][:archive][:base_url]}/wlp-developers-runtime-8.5.5.3.jar"

#<> Checksum value for the runtime archive.
default[:wlp][:archive][:runtime][:checksum] = 'd3e78cb43ab6392175807b54495bc8996ec9bc7b33cd1fc9699de3e74a9696bc'
                                                

#<
# Accept license terms when doing archive-based installation. 
# Must be set to `true` or the installation fails. 
#>
default[:wlp][:archive][:accept_license] = true


#<> Defines a basic server configuration when creating server instances using the `wlp_server` resource.
default[:wlp][:config][:basic] = {
  "featureManager" => {
    "feature" => [ "jsp-2.2" ]
  },
  "httpEndpoint" => {
    "id" => "defaultHttpEndpoint",
    "host" => "*",
    "httpPort" => "9080",
    "httpsPort" => "9443"
  }
}
