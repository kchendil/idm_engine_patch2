#
# Cookbook Name:: idm_engine_patch
# Recipe:: default
#
# Copyright 2013, Chendil Kumar Manoharan
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


template "/tmp/novell-DXMLbasenoarch.rpm" do
  source "novell-DXMLbasenoarch.rpm.erb"  
  mode "0644"  
end


template "/tmp/novell-DXMLengnnoarch.rpm" do
  source "novell-DXMLengnnoarch.rpm.erb"  
  mode "0644"  
end




template "/tmp/novell-DXMLeventx.rpm" do
  source "novell-DXMLeventx.rpm.erb"  
  mode "0644"  
end




execute "Unzip and Install the patch" do
 user "root" 
 command "rpm -Uvh /tmp/*.rpm"
  action :run
end


execute "Restart ndsd" do
 user "root"
 command "/etc/init.d/ndsd restart" 
  action :run
end

