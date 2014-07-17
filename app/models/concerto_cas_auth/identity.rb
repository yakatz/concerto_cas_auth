module ConcertoCasAuth
  class Identity < ActiveRecord::Base
    
    belongs_to :user

  end
end
