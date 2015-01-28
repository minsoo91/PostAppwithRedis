FactoryGirl.define do
	factory :post do |f|
		f.title { Faker::Lorem.word }
		f.body { Faker::Lorem.sentence }
	end

	factory :invalid_post, parent: :post do |f|
		f.title nil
	end
end