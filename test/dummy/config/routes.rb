Rails.application.routes.draw do

  mount ConcertoCasAuth::Engine => "/concerto_cas_auth"
end
