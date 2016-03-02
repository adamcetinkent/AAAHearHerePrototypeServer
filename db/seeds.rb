# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adam = User.create!(first_name: 'Adam', last_name: 'Kent', email: 'adamcetinkent@gmail.com', img_url: "https://scontent-lhr3-1.xx.fbcdn.net/hprofile-xta1/v/t1.0-1/p160x160/12038429_10205197199602134_1491120215442642035_n.jpg?oh=0f2307755a06867056b57445f765663e&oe=576CC7EE", fb_user_id: "10205891943610300")
test1 = User.create!(first_name: 'Anastasia', last_name: 'Perkins', email: 'anastasia_mitdwtk_perkins@tfbnw.net', img_url: "https://scontent-lhr3-1.xx.fbcdn.net/hprofile-xpf1/v/t1.0-1/p160x160/11251170_10155765504180471_1624608072328279628_n.jpg?oh=e88bcfe3bcea42ddbe695efec126c0dc&oe=57655470", fb_user_id: "139926446395804")
test2 = User.create!(first_name: 'Donna', last_name: 'McDonaldman', email: 'donna_thgunov_mcdonaldman@tfbnw.net', img_url: "https://scontent-lhr3-1.xx.fbcdn.net/hprofile-xtf1/v/t1.0-1/p160x160/1506993_10153660840270246_132951243_n.jpg?oh=6a1e01ab9fe4a00744049635b1adaef2&oe=575B3561", fb_user_id: "144621749258860")

post1 = Post.create!(user_id: '1', track: '2Iccm3cKBQHWt5yk0yX9nh', lat:'51.5282212', lon: '-0.1281044', message: 'First post! omg!')
post2 = Post.create!(user_id: '2', track: '5UJ8StM1nvIJJRhK5gEAJc', lat:'51.5326212', lon: '-0.1272544', message: 'LOVE THIS TUNE!')
post3 = Post.create!(user_id: '3', track: '6u9RO91ANrFqD8dmUNiMoc', lat:'51.5296212', lon: '-0.1351044', message: 'My first kiss was to this song!')
post4 = Post.create!(user_id: '1', track: '3JbqwFY5q0ORO3siv5zL3A', lat:'51.5334212', lon: '-0.1278044', message: 'Send help!')
post5 = Post.create!(user_id: '2', track: '3kguMbJma0qhOLniGsFlKq', lat:'51.5302212', lon: '-0.1309544', message: 'First they came for the musicians...')
post6 = Post.create!(user_id: '3', track: '7B04VRtTs6ucHp8qJ6Nz8M', lat:'51.5311820', lon: '-0.1310650', message: 'Do you hear the phone when I call?')
#post6 = Post.create!(user_id: '3', track: '7B04VRtTs6ucHp8qJ6Nz8M', lat:'51.5311820', lon: '-0.1310650', message: 'Do you hear the phone when I call? Do you hear the thud when I fall? Do you hear the crack when I break?')
