module ConcertoCasAuth

  require 'omniauth'
  require 'omniauth-cas'

  class Engine < ::Rails::Engine
    isolate_namespace ConcertoCasAuth
    engine_name 'concerto_cas_auth'

    # Define plugin information for the Concerto application to read.
    # Do not modify @plugin_info outside of this static configuration block.
    def plugin_info(plugin_info_class)
      @plugin_info ||= plugin_info_class.new do
        # Add configuration options here as needed.
        add_config("url", "",
                   :value_type => "string",
                   :description => "CAS URL for login / logout requests")

        add_route("concerto_cas_auth", ConcertoCasAuth::Engine)

        add_view_hook "ApplicationController", :signin_hook, :partial => "concerto_cas_auth/omniauth_cas/signin"

      end 
    end 

    middleware.use OmniAuth::Builder do
      provider :cas, :url => "https://cas-auth.rpi.edu/cas"
    end

  end
end
