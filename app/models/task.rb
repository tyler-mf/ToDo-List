class Task < ActiveRecord::Base
  attr_accessible :content, :state, :title

	belongs_to :user

	validates :title, length: { maximum: 20 }
	validates :content, presence: true, length: { maximum: 200 }
	validates :user_id, presence: true
end
