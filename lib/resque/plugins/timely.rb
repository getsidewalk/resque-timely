require 'timeout'

module Resque
  module Plugins
    module Timely

      def self.included base
        base.extend ClassMethods
      end
      
      module ClassMethods
        def around_perform_with_timeout *args
          if respond_to? :timely_timeout
            ::Timeout.timeout(timely_timeout){ yield }
          else
            yield
          end
        end
      end

    end
  end
end