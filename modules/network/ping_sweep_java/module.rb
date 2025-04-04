#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
#
# Ping Sweep Module - jgaliana
# Discover active hosts in the internal network of the hooked browser.
# It works calling a Java method from JavaScript and do not require user interaction.

class Ping_sweep_java < BeEF::Core::Command
  def pre_send
    BeEF::Core::NetworkStack::Handlers::AssetHandler.instance.bind('/modules/network/ping_sweep_java/pingSweep.class', '/pingSweep', 'class')
  end

  def self.options
    [
      { 'name' => 'ipRange', 'ui_label' => 'Scan IP range (C class or IP)', 'value' => '192.168.0.1-192.168.0.254' },
      { 'name' => 'timeout', 'ui_label' => 'Timeout (ms)', 'value' => '2000' }
    ]
  end

  def post_execute
    content = {}
    content['ps'] = @datastore['ps'] unless @datastore['ps'].nil?
    content['fail'] = 'No active hosts have been discovered.' if content.empty?
    BeEF::Core::NetworkStack::Handlers::AssetHandler.instance.unbind('/pingSweep.class')
    save content
  end
end
