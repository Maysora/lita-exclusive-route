module Lita
  module Extensions
    class ExclusiveRoute
      def self.call(payload)
        route = payload[:route]
        message = payload[:message]

        routes = message.instance_variable_get('@routes') || []
        if route.extensions[:exclusive] && !routes.empty?
          false
        else
          routes << route
          message.instance_variable_set('@routes', routes)
          true
        end
      end
    end

    Lita.register_hook(:validate_route, ExclusiveRoute)
  end
end
