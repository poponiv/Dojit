class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user

	default_scope { order('created_at DESC')}
	
	validates :body, length: { minimum: 5 }, presence: true
	validates :user_id, presence: true
end
