class Comment < ActiveRecord::Base
	validates :body, presence: true
	belongs_to(
		:post,
		class_name: "Post",
		foreign_key: :post_id,
		primary_key: :id
	)
end
