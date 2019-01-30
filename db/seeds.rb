require 'faker'

puts `clear`
puts "Suppression de la base de données en cours..."
User.destroy_all
Category.destroy_all
Article.destroy_all
Comment.destroy_all
Like.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'categories'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'articles'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'comments'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'likes'")

puts `clear`
puts "Ecriture de la base de données..."
sleep(2)
10.times do |index|
	user = User.create!(first_name: Faker::DragonBall.character, last_name: Faker::LeagueOfLegends.rank, email: Faker::Internet.email)
	puts "User : #{user.first_name} | #{user.last_name} | #{user.email}"
end

5.times do |cat|
	category = Category.create!(name: Faker::Dessert.variety)
	puts "Category : #{category.name}"
end

30.times do |art|
	article = Article.create!(user_id: rand(1..10), category_id: rand(1..5), title: Faker::Food.dish, content: Faker::Lovecraft.paragraph)
	puts "Article : #{article.title} | #{article.content}"
end

40.times do |com|
	comment = Comment.create!(user_id: rand(1..10), article_id: rand(1..30), content: Faker::ChuckNorris.fact)
	puts "Comment : #{comment.content}"
end

50.times do |lik|
	like = Like.create!(user_id: rand(1..10), article_id: rand(1..30))
	puts "Like : User id #{like.user_id} | Article id #{like.article_id}"
end
