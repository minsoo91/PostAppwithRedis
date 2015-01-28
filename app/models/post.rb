class Post < ActiveRecord::Base
	validates :title, :body, presence: true
	has_many(
		:comments,
		class_name: "Comment",
		foreign_key: :post_id,
		primary_key: :id
	)
end
