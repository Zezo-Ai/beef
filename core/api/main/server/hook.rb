#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
module BeEF
  module API
    module Server
      module Hook
        # @note Defined API Paths
        API_PATHS = {
          'pre_hook_send' => :pre_hook_send
        }.freeze

        # Fires just before the hook is sent to the hooked browser
        # @param [Class] handler the associated handler Class
        def pre_hook_send(handler); end
      end
    end
  end
end
