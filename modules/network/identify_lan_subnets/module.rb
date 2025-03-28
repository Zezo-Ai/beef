#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
##
# Ported to BeEF from: http://browserhacker.com/code/Ch10/index.html
##

class Identify_lan_subnets < BeEF::Core::Command
  def self.options
    [
      { 'name' => 'timeout', 'ui_label' => 'Timeout for each request (ms)', 'value' => '500' }
    ]
  end

  def post_execute
    content = {}
    content['host'] = @datastore['host'] unless @datastore['host'].nil?
    content['hosts'] = @datastore['hosts'] unless @datastore['hosts'].nil?
    content['fail'] = 'No active hosts have been discovered.' if content.empty?
    save content
  end
end
