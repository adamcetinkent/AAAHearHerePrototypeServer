# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adam1 = User.create!(first_name: 'Adam', 	last_name: 'Kent', 		email: 'adamcetinkent@gmail.com', 		fb_user_id: "10205891943610300",	auto_accept: '0')
test2 = User.create!(first_name: 'Anastasia', 	last_name: 'Perkins', 		email: 'anastasia_mitdwtk_perkins@tfbnw.net', 	fb_user_id: "139926446395804",		auto_accept: '0')
test3 = User.create!(first_name: 'Donna', 	last_name: 'McDonaldman', 	email: 'donna_thgunov_mcdonaldman@tfbnw.net', 	fb_user_id: "144621749258860",		auto_accept: '1')
test4 = User.create!(first_name: 'Mark', 	last_name: 'Coffeee', 		email: 'mark_zifuzym_cofee@tfbnw.net', 		fb_user_id: "151343778589171",		auto_accept: '0')
test5 = User.create!(first_name: 'James', 	last_name: 'East', 		email: 'james_pgwxujb_east@tfbnw.net', 		fb_user_id: "123611448031910",		auto_accept: '2')
test6 = User.create!(first_name: 'Martin',	last_name: 'Martinazziman',	email: 'mike_ipmbuot_martinazziman@tfbnw.net',	fb_user_id: "143713852683546",		auto_accept: '0')

friendship1_2 = Friendship.create!(user_id: '1', friend_user_id: '2')
friendship1_3 = Friendship.create!(user_id: '1', friend_user_id: '3')
friendship1_4 = Friendship.create!(user_id: '1', friend_user_id: '4')
friendship1_5 = Friendship.create!(user_id: '1', friend_user_id: '5')
friendship1_6 = Friendship.create!(user_id: '1', friend_user_id: '6')
friendship2_3 = Friendship.create!(user_id: '2', friend_user_id: '3')
friendship2_4 = Friendship.create!(user_id: '2', friend_user_id: '4')
friendship2_5 = Friendship.create!(user_id: '2', friend_user_id: '5')
friendship2_6 = Friendship.create!(user_id: '2', friend_user_id: '6')
friendship3_2 = Friendship.create!(user_id: '3', friend_user_id: '2')
friendship3_4 = Friendship.create!(user_id: '3', friend_user_id: '4')
friendship4_2 = Friendship.create!(user_id: '4', friend_user_id: '2')
friendship4_5 = Friendship.create!(user_id: '4', friend_user_id: '5')
friendship4_6 = Friendship.create!(user_id: '4', friend_user_id: '6')
friendship5_2 = Friendship.create!(user_id: '5', friend_user_id: '2')
friendship5_4 = Friendship.create!(user_id: '5', friend_user_id: '4')
friendship5_6 = Friendship.create!(user_id: '5', friend_user_id: '6')
friendship6_2 = Friendship.create!(user_id: '6', friend_user_id: '2')
friendship6_3 = Friendship.create!(user_id: '6', friend_user_id: '3')
friendship6_4 = Friendship.create!(user_id: '6', friend_user_id: '4')
friendship6_5 = Friendship.create!(user_id: '6', friend_user_id: '5')

post1 = Post.create!(user_id: '1', track: '2Iccm3cKBQHWt5yk0yX9nh', lat:'51.5282212', lon: '-0.1281044', message: 'First post! omg!', place_name: "Pret a Manger, King's Cross, London")
post2 = Post.create!(user_id: '2', track: '5UJ8StM1nvIJJRhK5gEAJc', lat:'51.5326212', lon: '-0.1272544', message: 'LOVE THIS TUNE!', place_name: "Starbucks, King's Cross")
post3 = Post.create!(user_id: '3', track: '6u9RO91ANrFqD8dmUNiMoc', lat:'51.5296212', lon: '-0.1351044', message: 'My first kiss was to this song!', place_name: 'Euston Station, London')
post4 = Post.create!(user_id: '4', track: '3JbqwFY5q0ORO3siv5zL3A', lat:'51.5334212', lon: '-0.1278044', message: 'Send help!', place_name: "Under a train!")
post5 = Post.create!(user_id: '5', track: '3kguMbJma0qhOLniGsFlKq', lat:'51.5302212', lon: '-0.1309544', message: 'First they came for the musicians...', place_name: 'Chalton Street, London')
post6 = Post.create!(user_id: '6', track: '7B04VRtTs6ucHp8qJ6Nz8M', lat:'51.5311820', lon: '-0.1310650', message: 'Do you hear the phone when I call?', place_name: "The Cock Tavern, Phoenix Road, London, United Kingdom")
#post6 = Post.create!(user_id: '3', track: '7B04VRtTs6ucHp8qJ6Nz8M', lat:'51.5311820', lon: '-0.1310650', message: 'Do you hear the phone when I call? Do you hear the thud when I fall? Do you hear the crack when I break?')

comment1 = Comment.create!(post_id: '1', user_id: '2', message: 'zomg first comment!')
comment2 = Comment.create!(post_id: '1', user_id: '3', message: 'roflmao first reply!')
comment3 = Comment.create!(post_id: '3', user_id: '1', message: 'I still remember it like it was yesterday...')

like1 = Like.create!(post_id: '1', user_id: '3')
like2 = Like.create!(post_id: '1', user_id: '2')
like3 = Like.create!(post_id: '2', user_id: '1')
like4 = Like.create!(post_id: '4', user_id: '1')
like5 = Like.create!(post_id: '4', user_id: '2')
like6 = Like.create!(post_id: '4', user_id: '3')

tag1 = Tag.create!(post_id: '3', user_id: '1')
tag2 = Tag.create!(post_id: '4', user_id: '5')

follow1 = Follow.create!(user_id: '1', followed_user_id: '2')
follow2 = Follow.create!(user_id: '3', followed_user_id: '1')
#follow2 = Follow.create!(user_id: '1', followed_user_id: '6')

follow_request1 = FollowRequest.create(user_id: '2', requested_user_id: '1')
follow_request2 = FollowRequest.create(user_id: '1', requested_user_id: '4')
follow_request3 = FollowRequest.create(user_id: '4', requested_user_id: '1')
follow_request4 = FollowRequest.create(user_id: '5', requested_user_id: '1')
follow_request5 = FollowRequest.create(user_id: '6', requested_user_id: '1')
