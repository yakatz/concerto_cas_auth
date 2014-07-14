module ConcertoCasAuth

  require 'omniauth'
  require 'omniauth-cas'

  class Engine < ::Rails::Engine
    isolate_namespace ConcertoCasAuth
    engine_name 'concerto_cas_auth'

    middleware.use OmniAuth::Builder do
      # Change this for genertic use later
      #  using RPI CAS server for testing
      provider :cas, :url => "https://cas-auth.rpi.edu/cas"
    end

    # Define plugin information for the Concerto application to read.
    # Do not modify @plugin_info outside of this static configuration block.
    def plugin_info(plugin_info_class)
      @plugin_info ||= plugin_info_class.new do
        # Add configuration options here as needed.
        add_route("concerto_cas_auth", ConcertoCasAuth::Engine)
      end 
    end 
  end
end
