FactoryGirl.define do 
	factory :comment do |f|
		f.body { Faker::Lorem.sentence }
		f.post_id { Faker::Number.digit }
	end	
end