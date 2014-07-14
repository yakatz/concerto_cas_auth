ConcertoCasAuth::Engine.routes.draw do

    get "/auth/:provider/callback", :to => "omniauth_callback_controller#cas_auth"

end
