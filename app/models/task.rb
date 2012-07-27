class Task < ActiveRecord::Base
  attr_accessible :content, :state, :title

	validates :title, length: { maximum: 20 }
	validates :content, presence: true, length: { maximum: 200 }
end
