class Authentication < ActiveRecord::Base
  attr_accessible :name, :provider, :token, :uid, :user_id
	belongs_to :user
end
