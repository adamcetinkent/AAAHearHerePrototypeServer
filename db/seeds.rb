# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adam1   = User.create!(first_name: 'Adam',      last_name: 'Kent',          email: 'adamcetinkent@gmail.com',               fb_user_id: "10205891943610300",  auto_accept: '0', privacy: '1')
test2   = User.create!(first_name: 'Anastasia', last_name: 'Perkins',       email: 'anastasia_mitdwtk_perkins@tfbnw.net',   fb_user_id: "139926446395804",    auto_accept: '0', privacy: '1')
test3   = User.create!(first_name: 'Donna',     last_name: 'McDonaldman',   email: 'donna_thgunov_mcdonaldman@tfbnw.net',   fb_user_id: "144621749258860",    auto_accept: '1', privacy: '1')
test4   = User.create!(first_name: 'Mark',      last_name: 'Coffee',        email: 'mark_zifuzym_cofee@tfbnw.net',          fb_user_id: "151343778589171",    auto_accept: '0', privacy: '1')
test5   = User.create!(first_name: 'James',     last_name: 'East',          email: 'james_pgwxujb_east@tfbnw.net',          fb_user_id: "123611448031910",    auto_accept: '2', privacy: '0')
test6   = User.create!(first_name: 'Martin',    last_name: 'Martinazziman', email: 'mike_ipmbuot_martinazziman@tfbnw.net',  fb_user_id: "143713852683546",    auto_accept: '0', privacy: '1')
test7   = User.create!(first_name: 'Paul F.',   last_name: 'Tompkins',      email: 'paul_anroyol_tompkins@tfbnw.net',       fb_user_id: "111524165911594",    auto_accept: '2', privacy: '0')
test8   = User.create!(first_name: 'Scott',     last_name: 'Aukerman',      email: 'scott_asaqqkg_aukerman@tfbnw.net',      fb_user_id: "117728641956952",    auto_accept: '2', privacy: '0')
test9   = User.create!(first_name: 'Lauren',    last_name: 'Lapkus',        email: 'lauren_rxwvltj_lapkus@tfbnw.net',       fb_user_id: "119771251752135",    auto_accept: '2', privacy: '0')
test10  = User.create!(first_name: 'Jessica',   last_name: 'St. Clair',     email: 'jessica_wasxjez_clair@tfbnw.net',       fb_user_id: "123979194664092",    auto_accept: '2', privacy: '0')

friendship01_02 = Friendship.create!(user_id: '1',  friend_user_id: '2')
friendship01_03 = Friendship.create!(user_id: '1',  friend_user_id: '3')
friendship01_04 = Friendship.create!(user_id: '1',  friend_user_id: '4')
friendship01_05 = Friendship.create!(user_id: '1',  friend_user_id: '5')
friendship01_06 = Friendship.create!(user_id: '1',  friend_user_id: '6')
friendship02_03 = Friendship.create!(user_id: '2',  friend_user_id: '3')
friendship02_04 = Friendship.create!(user_id: '2',  friend_user_id: '4')
friendship02_05 = Friendship.create!(user_id: '2',  friend_user_id: '5')
friendship02_06 = Friendship.create!(user_id: '2',  friend_user_id: '6')
friendship03_02 = Friendship.create!(user_id: '3',  friend_user_id: '2')
friendship03_04 = Friendship.create!(user_id: '3',  friend_user_id: '4')
friendship04_02 = Friendship.create!(user_id: '4',  friend_user_id: '2')
friendship04_05 = Friendship.create!(user_id: '4',  friend_user_id: '5')
friendship04_06 = Friendship.create!(user_id: '4',  friend_user_id: '6')
friendship05_02 = Friendship.create!(user_id: '5',  friend_user_id: '2')
friendship05_04 = Friendship.create!(user_id: '5',  friend_user_id: '4')
friendship05_06 = Friendship.create!(user_id: '5',  friend_user_id: '6')
friendship06_02 = Friendship.create!(user_id: '6',  friend_user_id: '2')
friendship06_03 = Friendship.create!(user_id: '6',  friend_user_id: '3')
friendship06_04 = Friendship.create!(user_id: '6',  friend_user_id: '4')
friendship06_05 = Friendship.create!(user_id: '6',  friend_user_id: '5')
friendship07_08 = Friendship.create!(user_id: '7',  friend_user_id: '8')
friendship07_09 = Friendship.create!(user_id: '7',  friend_user_id: '9')
friendship07_10 = Friendship.create!(user_id: '7',  friend_user_id: '10')
friendship08_07 = Friendship.create!(user_id: '8',  friend_user_id: '7')
friendship08_09 = Friendship.create!(user_id: '8',  friend_user_id: '9')
friendship08_10 = Friendship.create!(user_id: '8',  friend_user_id: '10')
friendship09_07 = Friendship.create!(user_id: '9',  friend_user_id: '7')
friendship09_08 = Friendship.create!(user_id: '9',  friend_user_id: '8')
friendship09_10 = Friendship.create!(user_id: '9',  friend_user_id: '10')
friendship10_07 = Friendship.create!(user_id: '10', friend_user_id: '7')
friendship10_08 = Friendship.create!(user_id: '10', friend_user_id: '8')
friendship10_09 = Friendship.create!(user_id: '10', friend_user_id: '9')

post01 = Post.create!(user_id: '1',   track: '2Iccm3cKBQHWt5yk0yX9nh', lat:'51.5282212',  lon: '-0.1281044', 
                      message: 'First post! omg!', 
                      place_name: "Pret a Manger, King's Cross, London")
post02 = Post.create!(user_id: '2',   track: '5UJ8StM1nvIJJRhK5gEAJc', lat:'51.5326212',  lon: '-0.1272544', 
                      message: 'LOVE THIS TUNE!', 
                      place_name: "Starbucks, King's Cross")
post03 = Post.create!(user_id: '3',   track: '6u9RO91ANrFqD8dmUNiMoc', lat:'51.5296212',  lon: '-0.1351044', 
                      message: 'My first kiss was to this song! {tag_01}', 
                      place_name: 'Euston Station, London')
post04 = Post.create!(user_id: '4',   track: '3JbqwFY5q0ORO3siv5zL3A', lat:'51.5334212',  lon: '-0.1278044', 
                      message: '{tag_01} Send help!', 
                      place_name: "Under a train!")
post05 = Post.create!(user_id: '5',   track: '3kguMbJma0qhOLniGsFlKq', lat:'51.5302212',  lon: '-0.1309544', 
                      message: 'First they came for the musicians...', 
                      place_name: 'Chalton Street, London')
post06 = Post.create!(user_id: '6',   track: '7B04VRtTs6ucHp8qJ6Nz8M', lat:'51.5311820',  lon: '-0.1310650', 
                      message: 'Do you hear the phone when I call?', 
                      place_name: "The Cock Tavern, Phoenix Road, London, United Kingdom")
post07 = Post.create!(user_id: '7',   track: '1jUPOeAOtsjjV1jUWc2H1g', lat:'34.09800110', lon: '-118.327731', 
                      message: 'The only good songs are hymns!', 
                      place_name: "The ArcLight, Hollywood")
post08 = Post.create!(user_id: '8',   track: '4DbUk1qwcz9KKcUY4t8f8u', lat:'34.0980050',  lon: '-118.333672', 
                      message: 'That\'s a good song!', 
                      place_name: "Earwolf Studios")
post09 = Post.create!(user_id: '9',   track: '6ofOBTBzzjjvOOm3iMmLiE', lat:'90.0',        lon: '0.0', 
                      message: 'Ho HO!', 
                      place_name: "The North Pole")
post10 = Post.create!(user_id: '10',  track: '1ZtzjvhIcLoogzOpt4rKoa', lat:'33.98793000', lon: '-118.421295', 
                      message: 'WOMP UP THE JAMZ!', 
                      place_name: "Marina del Rey High School")

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

follow01_02 = Follow.create!(user_id: '1',  followed_user_id: '2')
follow03_01 = Follow.create!(user_id: '3',  followed_user_id: '1')
follow07_08 = Follow.create!(user_id: '7',  followed_user_id: '8')
follow09_08 = Follow.create!(user_id: '9',  followed_user_id: '8')
follow10_08 = Follow.create!(user_id: '10', followed_user_id: '8')
follow08_07 = Follow.create!(user_id: '8',  followed_user_id: '7')
follow04_07 = Follow.create!(user_id: '4',  followed_user_id: '7')
follow04_08 = Follow.create!(user_id: '4',  followed_user_id: '8')
follow04_09 = Follow.create!(user_id: '4',  followed_user_id: '9')
follow04_10 = Follow.create!(user_id: '4',  followed_user_id: '10')

#follow2 = Follow.create!(user_id: '1', followed_user_id: '6')

follow_request1 = FollowRequest.create(user_id: '2', requested_user_id: '1')
follow_request2 = FollowRequest.create(user_id: '1', requested_user_id: '4')
follow_request3 = FollowRequest.create(user_id: '4', requested_user_id: '1')
follow_request4 = FollowRequest.create(user_id: '5', requested_user_id: '1')
follow_request5 = FollowRequest.create(user_id: '6', requested_user_id: '1')
