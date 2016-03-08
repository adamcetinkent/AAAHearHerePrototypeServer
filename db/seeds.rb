# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adam = User.create!(first_name: 'Adam', last_name: 'Kent', email: 'adamcetinkent@gmail.com', fb_user_id: "10205891943610300")
test1 = User.create!(first_name: 'Anastasia', last_name: 'Perkins', email: 'anastasia_mitdwtk_perkins@tfbnw.net', fb_user_id: "139926446395804")
test2 = User.create!(first_name: 'Donna', last_name: 'McDonaldman', email: 'donna_thgunov_mcdonaldman@tfbnw.net', fb_user_id: "144621749258860")

post1 = Post.create!(user_id: '1', track: '2Iccm3cKBQHWt5yk0yX9nh', lat:'51.5282212', lon: '-0.1281044', message: 'First post! omg!', place_name: "Pret a Manger, King's Cross, London")
post2 = Post.create!(user_id: '2', track: '5UJ8StM1nvIJJRhK5gEAJc', lat:'51.5326212', lon: '-0.1272544', message: 'LOVE THIS TUNE!', place_name: "Starbucks, King's Cross")
post3 = Post.create!(user_id: '3', track: '6u9RO91ANrFqD8dmUNiMoc', lat:'51.5296212', lon: '-0.1351044', message: 'My first kiss was to this song!', place_name: 'Euston Station, London')
post4 = Post.create!(user_id: '1', track: '3JbqwFY5q0ORO3siv5zL3A', lat:'51.5334212', lon: '-0.1278044', message: 'Send help!', place_name: "Under a train!")
post5 = Post.create!(user_id: '2', track: '3kguMbJma0qhOLniGsFlKq', lat:'51.5302212', lon: '-0.1309544', message: 'First they came for the musicians...', place_name: 'Chalton Street, London')
post6 = Post.create!(user_id: '3', track: '7B04VRtTs6ucHp8qJ6Nz8M', lat:'51.5311820', lon: '-0.1310650', message: 'Do you hear the phone when I call?', place_name: "The Cock Tavern, Phoenix Road, London, United Kingdom")
#post6 = Post.create!(user_id: '3', track: '7B04VRtTs6ucHp8qJ6Nz8M', lat:'51.5311820', lon: '-0.1310650', message: 'Do you hear the phone when I call? Do you hear the thud when I fall? Do you hear the crack when I break?')

comment1 = Comment.create!(post_id: '1', user_id: '2', message: 'zomg first comment!')
comment2 = Comment.create!(post_id: '1', user_id: '3', message: 'roflmao first reply!')
comment3 = Comment.create!(post_id: '3', user_id: '1', message: 'I still remember it like it was yesterday...')

like1 = Like.create(post_id: '1', user_id: '3')
like2 = Like.create(post_id: '1', user_id: '2')
like3 = Like.create(post_id: '2', user_id: '1')
like4 = Like.create(post_id: '4', user_id: '1')
like5 = Like.create(post_id: '4', user_id: '2')
like6 = Like.create(post_id: '4', user_id: '3')
