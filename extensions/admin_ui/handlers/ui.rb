#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
#
# Generic Http Handler that extensions can use to register http
# controllers into the framework.
#
module BeEF
  module Extension
    module AdminUI
      module Handlers
        class UI
          #
          # Constructor
          #
          def initialize(klass)
            @klass = BeEF::Extension::AdminUI::Controllers.const_get(klass.to_s.capitalize)
          end

          def call(env)
            @request = Rack::Request.new(env)
            @response = Rack::Response.new(env)

            controller = @klass.new
            controller.run(@request, @response)

            @response = Rack::Response.new(
              body = [controller.body],
              status = controller.status,
              header = controller.headers
            )
          end

          @request
          @response
        end
      end
    end
  end
end
