# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

user1 = User.create! :email => 'john@gmail.com', :password => '123456', :password_confirmation => '123456'
user2 = User.create! :email => 'bob@gmail.com', :password => '123456', :password_confirmation => '123456'
post_code = ['E5 9BL', 'E10 5EZ', 'SW10 0TZ', 'SE5 8TR', 'SE14 5RT', 'SW7 2LT', 'SE15 5NJ', 'SE10 0NA', 'N7 0EG', 'NW1 0EH']

5.times do
  title = Faker::Food.dish
  title.gsub!(/[^[:ascii:]]/, "")
  category = Faker::Nation.language
  price = Faker::Number.number(digits: 2)
  cooking_time = (Faker::Number.number(digits: 2)).to_s + "min"
  description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  input_hash = {title: title, category: category, price: price, cooking_time: cooking_time, description: description}
  meal = Meal.new(input_hash)
  meal.user = user1

  photo = "https://source.unsplash.com/random/?dinner " + title
  file = URI.open(photo)
  meal.photo.attach(io: file, filename: 'test.jpeg', content_type: 'image/png')

  puts "Adding address...#{post_code[0]}"
  meal.address = post_code.slice!(0)
  meal.save
  sleep(2)
end

5.times do
  title = Faker::Food.dish
  title.gsub!(/[^[:ascii:]]/, "")
  category = Faker::Nation.language
  price = Faker::Number.number(digits: 2)
  cooking_time = (Faker::Number.number(digits: 2)).to_s + "min"
  description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  input_hash = {title: title, category: category, price: price, cooking_time: cooking_time, description: description}
  meal = Meal.new(input_hash)
  meal.user = user2

  photo = "https://source.unsplash.com/random/?dinner " + title
  file = URI.open(photo)
  meal.photo.attach(io: file, filename: 'test.jpeg', content_type: 'image/png')

  puts "Adding address...#{post_code[0]}"
  meal.address = post_code.slice!(0)
  
  meal.save
  sleep(2)
end





# file = URI.open(photo)
# meal = Meal.find(1)
# meal.photo.attach(io: file, filename: 'test.jpeg', content_type: 'image/png')
# meal.save

# file = URI.open(photo)
# meal = Meal.find(2)
# meal.photo.attach(io: file, filename: 'test.jpeg', content_type: 'image/png')
# meal.save
