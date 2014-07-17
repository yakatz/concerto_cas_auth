ConcertoCasAuth::Engine.routes.draw do

    get "/auth/:provider/callback", :to => "omniauth_callback#cas_auth"

end
