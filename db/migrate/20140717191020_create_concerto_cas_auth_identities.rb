class CreateConcertoCasAuthIdentities < ActiveRecord::Migration
  def change
    create_table :concerto_cas_auth_identities do |t|
      t.integer :user_id
      t.string :uid
      
      t.timestamps
    end
  end
end
