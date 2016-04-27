# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

adam1   = User.create!(first_name: 'Adam',      last_name: 'Kent',          email: 'adamcetinkent@gmail.com',
                       bio: "Adam is the creator of Hear! Here! and is unsure about who exactly is ever going to read this except for him.",
                       url: "",
                       fb_user_id: "10205891943610300",  auto_accept: '0', profile_privacy: '1', search_privacy: '1',
                       auth_token: "token1")
test2   = User.create!(first_name: 'Anastasia', last_name: 'Perkins',       email: 'anastasia_mitdwtk_perkins@tfbnw.net',
                       bio: "Totally a real person. Always doing things and being real.",
                       url: "",
                       fb_user_id: "139926446395804",    auto_accept: '0', profile_privacy: '2', search_privacy: '0')
test3   = User.create!(first_name: 'Donna',     last_name: 'McDonaldman',   email: 'donna_thgunov_mcdonaldman@tfbnw.net',
                       bio: "The Big Mac",
                       url: "",
                       fb_user_id: "144621749258860",    auto_accept: '1', profile_privacy: '1', search_privacy: '0')
test4   = User.create!(first_name: 'Mark',      last_name: 'Coffee',        email: 'mark_zifuzym_cofee@tfbnw.net',
                       bio: "A lover, not a fighter!",
                       url: "",
                       fb_user_id: "151343778589171",    auto_accept: '0', profile_privacy: '2', search_privacy: '1')
test5   = User.create!(first_name: 'James',     last_name: 'East',          email: 'james_pgwxujb_east@tfbnw.net',
                       bio: "Music is life. Life is music.",
                       url: "",
                       fb_user_id: "123611448031910",    auto_accept: '2', profile_privacy: '0', search_privacy: '0')
test6   = User.create!(first_name: 'Martin',    last_name: 'Martinazziman', email: 'mike_ipmbuot_martinazziman@tfbnw.net',
                       bio: "Single by choice.",
                       url: "",
                       fb_user_id: "143713852683546",    auto_accept: '0', profile_privacy: '2', search_privacy: '2')
test7   = User.create!(first_name: 'Paul F.',   last_name: 'Tompkins',      email: 'paul_anroyol_tompkins@tfbnw.net',
                       bio: "I host \"No, YOU Shut Up!\" Click the link to watch full episodes online!",
                       url: "bit.ly/NYSU4",
                       fb_user_id: "111524165911594",    auto_accept: '2', profile_privacy: '0', search_privacy: '0')
test8   = User.create!(first_name: 'Scott',     last_name: 'Aukerman',      email: 'scott_asaqqkg_aukerman@tfbnw.net',
                       bio: "Scott Aukerman™",
                       url: "",
                       fb_user_id: "117728641956952",    auto_accept: '2', profile_privacy: '0', search_privacy: '0')
test9   = User.create!(first_name: 'Lauren',    last_name: 'Lapkus',        email: 'lauren_rxwvltj_lapkus@tfbnw.net',
                       bio: "does drugs for breakfast",
                       url: "splitsider.com/2016/02/scott-aukerman-announces-a-comedy-bang-bang-tour-with-lauren-lapkus-paul-f-tompkins-and-neil-campbell/",
                       fb_user_id: "119771251752135",    auto_accept: '2', profile_privacy: '0', search_privacy: '0')
test10  = User.create!(first_name: 'Jessica',   last_name: 'St. Clair',     email: 'jessica_wasxjez_clair@tfbnw.net',
                       bio: "Playing House season 2 with @lennonparham coming August 4th, 10pm on USA!",
                       url: "usanet.tv/PlayingHouseWatch",
                       fb_user_id: "123979194664092",    auto_accept: '2', profile_privacy: '0', search_privacy: '0')
test11  = User.create!(first_name: 'Sharon',   last_name: 'Moidusky',     email: 'sharon_gtvrwpt_moidusky@tfbnw.net',
                       bio: "",
                       url: "",
                       fb_user_id: "107498486315778",    auto_accept: '2', profile_privacy: '2', search_privacy: '0')
test12  = User.create!(first_name: 'Shirley',   last_name: 'McDonaldstein',     email: 'shirley_krqhhha_mcdonaldstein@tfbnw.net',
                       bio: "",
                       url: "",
                       fb_user_id: "116360505427341",    auto_accept: '2', profile_privacy: '0', search_privacy: '0')
test13  = User.create!(first_name: 'Babara',   last_name: 'Moidustein',     email: 'barbara_wrgtztr_moidustein@tfbnw.net',
                       bio: "",
                       url: "",
                       fb_user_id: "128800334181497",    auto_accept: '2', profile_privacy: '2', search_privacy: '0')
test14  = User.create!(first_name: 'Jennifer',   last_name: 'Bharambesen',     email: 'jennifer_qhdmsxo_bharambesen@tfbnw.net',
                       bio: "",
                       url: "",
                       fb_user_id: "157460517979376",    auto_accept: '2', profile_privacy: '2', search_privacy: '0')
test15  = User.create!(first_name: 'Richard',   last_name: 'Baoberg',     email: 'richard_qqxvqgt_baoberg@tfbnw.net',
                       bio: "",
                       url: "",
                       fb_user_id: "100011743320352",    auto_accept: '2', profile_privacy: '1', search_privacy: '1')
test16  = User.create!(first_name: 'Patricia',   last_name: 'Bowersbery',     email: 'patricia_cqojxue_bowersberg@tfbnw.net',
                       bio: "",
                       url: "",
                       fb_user_id: "100011710352050",    auto_accept: '2', profile_privacy: '2', search_privacy: '1')
test17  = User.create!(first_name: 'Donna',   last_name: 'Greeneberg',     email: 'donna_wovggon_greeneberg@tfbnw.net',
                       bio: "",
                       url: "",
                       fb_user_id: "100011624077643",    auto_accept: '2', profile_privacy: '0', search_privacy: '0')
test18  = User.create!(first_name: 'Dave',   last_name: 'Rosenthalescu',     email: 'dave_qscbgvp_rosenthalescu@tfbnw.net',
                       bio: "",
                       url: "",
                       fb_user_id: "100011399189719",    auto_accept: '2', profile_privacy: '2', search_privacy: '2')

post01 = Post.create!(user_id: '1',   track: '2Iccm3cKBQHWt5yk0yX9nh', lat:'51.5282212',  lon: '-0.1281044',
                      message: 'First post! omg!',
                      place_name: "Pret a Manger, King's Cross, London",
                      privacy: '0',
                      created_at: '2016-01-30 08:03:50.50')
post02 = Post.create!(user_id: '2',   track: '5UJ8StM1nvIJJRhK5gEAJc', lat:'51.5326212',  lon: '-0.1272544',
                      message: 'LOVE THIS TUNE!',
                      place_name: "Starbucks, King's Cross",
                      privacy: '1',
                      created_at: '2016-01-31 01:59:31.31')
post03 = Post.create!(user_id: '3',   track: '6u9RO91ANrFqD8dmUNiMoc', lat:'51.5296212',  lon: '-0.1351044',
                      message: 'My first kiss was to this song! {tag_1}',
                      place_name: 'Euston Station, London',
                      privacy: '2',
                      created_at: '2016-02-01 00:41:46.46')
post04 = Post.create!(user_id: '4',   track: '3JbqwFY5q0ORO3siv5zL3A', lat:'51.5334212',  lon: '-0.1278044',
                      message: '{tag_7} Send help!',
                      place_name: "Under a train!",
                      privacy: '3',
                      created_at: '2016-02-01 08:12:29.29')
post05 = Post.create!(user_id: '5',   track: '3kguMbJma0qhOLniGsFlKq', lat:'51.5302212',  lon: '-0.1309544',
                      message: 'First they came for the musicians...',
                      place_name: 'Chalton Street, London',
                      privacy: '0',
                      created_at: '2016-02-01 12:57:36.36')
post06 = Post.create!(user_id: '6',   track: '7B04VRtTs6ucHp8qJ6Nz8M', lat:'51.5311820',  lon: '-0.1310650',
                      message: 'Do you hear the phone when I call?',
                      place_name: "The Cock Tavern, Phoenix Road, London, United Kingdom",
                      privacy: '1',
                      created_at: '2016-02-02 01:16:19.19')
post07 = Post.create!(user_id: '7',   track: '1jUPOeAOtsjjV1jUWc2H1g', lat:'34.09800110', lon: '-118.327731',
                      message: 'The only good songs are hymns!',
                      place_name: "The ArcLight, Hollywood",
                      privacy: '2',
                      created_at: '2016-02-03 08:35:05.05')
post08 = Post.create!(user_id: '8',   track: '4DbUk1qwcz9KKcUY4t8f8u', lat:'34.0980050',  lon: '-118.333672',
                      message: 'That\'s a good song!',
                      place_name: "Earwolf Studios",
                      privacy: '3',
                      created_at: '2016-02-03 07:17:46.46')
post09 = Post.create!(user_id: '9',   track: '6ofOBTBzzjjvOOm3iMmLiE', lat:'90.0',        lon: '0.0',
                      message: 'Ho HO!',
                      place_name: "The North Pole",
                      privacy: '0',
                      created_at: '2016-02-03 20:44:10.10')
post10 = Post.create!(user_id: '10',  track: '1ZtzjvhIcLoogzOpt4rKoa', lat:'33.98793000', lon: '-118.421295',
                      message: 'WOMP UP THE JAMZ!',
                      place_name: "Marina del Rey High School",
                      privacy: '1',
                      created_at: '2016-02-04 12:27:22.22')
post11 = Post.create!(user_id: '11',  track: '14WWzenpaEgQZlqPq2nk4v', lat:'51.523368', lon: '-0.144278',
                      message: 'The question of responsibility is constantly substituted by accusation and guilt.',
                      place_name: "Great Portland Street Station",
                      privacy: '2',
                      created_at: '2016-02-04 22:59:31.31')
post12 = Post.create!(user_id: '12',  track: '2vDT1uU6hZgdp3PbWGr0Xy', lat:'51.530176', lon: '-0.120847',
                      message: 'Intention to stop and exit the fight should become a constant reminding factor that needs to be investigated.',
                      place_name: "Scala, King's Cross",
                      privacy: '3',
                      created_at: '2016-02-05 07:19:12.12')
post13 = Post.create!(user_id: '13',  track: '7vfWgVGiLgnGbInU5lvSQg', lat:'51.519336', lon: '-0.125997',
                      message: 'Seeing your own mechanism starts to transform it.',
                      place_name: "The British Museum",
                      privacy: '0',
                      created_at: '2016-02-05 07:37:55.55')
post14 = Post.create!(user_id: '14',  track: '0IKK48xF4eEdfofyaeKWWO', lat:'51.509187', lon: '-0.160586',
                      message: 'You do what you want, but you are not aware of who is it in you that wants it.',
                      place_name: "Hyde Park",
                      privacy: '1',
                      created_at: '2016-02-06 03:01:26.26')
post15 = Post.create!(user_id: '15',  track: '0SJPThTy7ynySPF4euczx7', lat:'51.508813', lon: '-0.127027',
                      message: 'Everything that you start to see - starts to transform.',
                      place_name: "Trafalgar Square, London",
                      privacy: '2',
                      created_at: '2016-02-06 11:49:55.55')
post16 = Post.create!(user_id: '16',  track: '3hB5DgAiMAQ4DzYbsMq1IT', lat:'51.507638', lon: '-0.096557',
                      message: 'Unless an intention is spoken aloud it is not fixed in consciousness.',
                      place_name: "Shakespeare's Globe",
                      privacy: '3',
                      created_at: '2016-02-06 22:53:46.46')
post17 = Post.create!(user_id: '17',  track: '3CRDbSIZ4r5MsZ0YwxuEkn', lat:'51.525050', lon: '-0.087459',
                      message: 'What you see in me is in you. You cannot see something in someone, unless it is present in you. You can only see in another human being what is in you.',
                      place_name: "Silicon Roundabout, Old Street",
                      privacy: '0',
                      created_at: '2016-02-07 07:53:46.46')
post18 = Post.create!(user_id: '18',  track: '40YcuQysJ0KlGQTeGUosTC', lat:'51.507264', lon: '-0.075356',
                      message: 'Guilt is energy which allows you to undesrtand the truth of another human being (the truth of your subconscious side).',
                      place_name: "Tower Bridge, London",
                      privacy: '1',
                      created_at: '2016-02-08 02:06:43.43')
post19 = Post.create!(user_id: '10',  track: '1brwdYwjltrJo7WHpIvbYt', lat:'51.513247', lon: '-0.132005',
                      message: 'The more frequently and the more clearly you will discuss your personality as a sideways observer, the faster your changes will occur.',
                      place_name: "Dean St, Soho, UK",
                      privacy: '2',
                      created_at: '2016-02-08 21:08:38.38')
post20 = Post.create!(user_id: '10',  track: '6OZh916QF8XNunWaP97WEZ', lat:'51.500906', lon: '-0.142991',
                      message: 'No awareness of the received experience means that the experience continues.',
                      place_name: "Buckingham Palace, London",
                      privacy: '3',
                      created_at: '2016-02-09 16:36:29.29')
post21 = Post.create!(user_id: '5',  track: '69bp2EbF7Q2rqc5N3ylezZ', lat:'51.492731', lon: '-0.157668',
                      message: 'If one wants to get someone upset, one would find someone who wants to get upset.',
                      place_name: "Sloane Square",
                      privacy: '0',
                      created_at: '2016-02-10 07:52:19.19')
post22 = Post.create!(user_id: '4',  track: '0L7loeTIg6akW84aEQZpCT', lat:'51.518268', lon: '-0.174834',
                      message: 'If you oppress with awareness, you don\'t understand what awareness is.',
                      place_name: "Paddington Basin, London",
                      privacy: '1',
                      created_at: '2016-02-11 04:32:10.10')
post23 = Post.create!(user_id: '8',  track: '27SdWb2rFzO6GWiYDBTD9j', lat:'51.498716', lon: '-0.174920',
                      message: 'Morals are the main reason for accusation and guilt.',
                      place_name: "Science Museum, London",
                      privacy: '2',
                      created_at: '2016-02-11 23:00:58.58')
post24 = Post.create!(user_id: '6',  track: '3vv9phIu6Y1vX3jcqaGz5Z', lat:'51.476963', lon: '0.001290',
                      message: 'If someone screams at you externalls, it is your own internal part screaming.',
                      place_name: "Royal Observatory Greenwich",
                      privacy: '3',
                      created_at: '2016-02-12 09:53:17.17')
post25 = Post.create!(user_id: '10',  track: '6T506SFlFUVVNvnmCiVZR0', lat:'51.513781', lon: '-0.099647',
                      message: 'A request for forgiveness confirms guilt.',
                      place_name: "St. Paul's Cathedral, London",
                      privacy: '0',
                      created_at: '2016-02-12 12:02:53.53')
post26 = Post.create!(user_id: '14',  track: '3jomjC6H7YQBRr2CHPtc4y', lat:'51.512285', lon: '-0.123336',
                      message: 'Your notions of good and evil are relative.',
                      place_name: "Covent Garden",
                      privacy: '1',
                      created_at: '2016-02-13 11:05:17.17')
post27 = Post.create!(user_id: '6',  track: '0r4SsYcwvd8URat6AS2m6f', lat:'51.503097', lon: '-0.118186',
                      message: 'The only sin is not to be aware.',
                      place_name: "London Eye",
                      privacy: '2',
                      created_at: '2016-02-14 03:41:46.46')
post28 = Post.create!(user_id: '6',  track: '2Aa1wE8ofs2tu59TOQrZKW', lat:'51.498555', lon: '-0.127713',
                      message: 'The major fear of the EGO is to see that it does not exist.',
                      place_name: "Westminster Abbey, London",
                      privacy: '3',
                      created_at: '2016-02-14 16:14:53.53')
post29 = Post.create!(user_id: '14',  track: '1i1fxkWeaMmKEB4T7zqbzK', lat:'51.494548', lon: '-0.144708',
                      message: 'Harmony is in a balance of two sides of duality',
                      place_name: "Victoria Station, London",
                      privacy: '0',
                      created_at: '2016-02-15 11:09:36.36')
post30 = Post.create!(user_id: '1',  track: '1WP1r7fuvRqZRnUaTi2I1Q', lat:'51.519363', lon: '-0.147712',
                      message: "A lie is when someone says something that you do not consider to be the truth.",
                      place_name: "Harley St, London",
                      privacy: '1',
                      created_at: '2016-02-15 19:45:07.07')
post31 = Post.create!(user_id: '13',  track: '3CJvmtWw2bJsudbAC5uCQk', lat:'51.508252', lon: '-0.148827',
                      message: "To fight fear is to enforce it.",
                      place_name: "29 Hill St",
                      privacy: '2',
                      created_at: '2016-02-16 14:54:14.14')
post32 = Post.create!(user_id: '3',  track: '3pzjHKrQSvXGHQ98dx18HI', lat:'51.498368', lon: '-0.140287',
                      message: "To desire something stronger one needs to enforce what one desires in oneself.",
                      place_name: "Experience Invest, London, UK",
                      privacy: '3',
                      created_at: '2016-02-16 22:45:07.07')
post33 = Post.create!(user_id: '12',  track: '2I5Z2JIIQX9d5XCOLDk8wx', lat:'51.504381', lon: '-0.016819',
                      message: "Our process is to exit out of all the condintioning created in and by the mind.",
                      place_name: "Canary Whary, London",
                      privacy: '0',
                      created_at: '2016-02-17 20:57:07.07')
post34 = Post.create!(user_id: '9',  track: '53Y0kdCa1CZ9gRqEuknfwy', lat:'51.479566', lon: '-0.062172',
                      message: "Fear is a hidden desire.",
                      place_name: "Commercial Way, London",
                      privacy: '1',
                      created_at: '2016-02-18 01:33:36.36')
post35 = Post.create!(user_id: '13',  track: '7gBj0VgcuAgkXkiRRYvSmK', lat:'51.481900', lon: '-0.155252',
                      message: "Loss of fear is loss of life.",
                      place_name: "Battersea Park, UK",
                      privacy: '2',
                      created_at: '2016-02-18 02:42:43.43')
post36 = Post.create!(user_id: '15',  track: '2Fn3coxd0xAZ09JtrgcgHa', lat:'51.498781', lon: '-0.177367',
                      message: "Fear is fuel human's ego works on.",
                      place_name: "Ayrton Rd, London",
                      privacy: '3',
                      created_at: '2016-02-18 12:07:12.12')
post37 = Post.create!(user_id: '7',  track: '3RiPr603aXAoi4GHyXx0uy', lat:'51.531281', lon: '-0.177367',
                      message: "Fear grows through self-pity and accusation of others.",
                      place_name: "Abbey Road Studios",
                      privacy: '0',
                      created_at: '2016-02-19 00:59:02.02')
post38 = Post.create!(user_id: '1',  track: '5tf1VVWniHgryyumXyJM7w', lat:'51.538975', lon: '-0.141509',
                      message: "See that what you are afraid of, you already have.",
                      place_name: "Greenland Rd, Camden",
                      privacy: '1',
                      created_at: '2016-02-19 15:25:55.55')
post39 = Post.create!(user_id: '8',  track: '37R0bQOQj5a7DOqh1TGzvB', lat:'51.535556', lon: '-0.103277',
                      message: "Choice exists only when you see two opposite sides in yourself.",
                      place_name: "Chipotle, Angel",
                      privacy: '2',
                      created_at: '2016-02-20 06:25:55.55')
post40 = Post.create!(user_id: '2',  track: '0NmeI6UpRE27dxxgosD5n9', lat:'51.533846', lon: '-0.072417',
                      message: "Not a single question is left without an answer - do you see that?",
                      place_name: "Fellows Court Community Centre",
                      privacy: '3',
                      created_at: '2016-02-20 23:49:55.55')
post41 = Post.create!(user_id: '7',  track: '0WEVf4RhIrcr3S3ULBrt0T', lat:'51.526462', lon: '-0.101278',
                      message: "Holistic seeing is action",
                      place_name: "Harold Laski House, London",
                      privacy: '0',
                      created_at: '2016-02-21 09:23:02.02')
post42 = Post.create!(user_id: '6',  track: '7xT0GApaXGNVMUdRx2taZv', lat:'51.505236', lon: '-0.124392',
                      message: "The accuser considers himself to be right, otherwise he is not going to accuse.",
                      place_name: "Royal Horseguards Hotel, London",
                      privacy: '1',
                      created_at: '2016-02-21 20:19:41.41')
post43 = Post.create!(user_id: '3',  track: '04Hd3SxnL6b41B4ClPtmtq', lat:'51.507180', lon: '-0.095781',
                      message: "You cannot change what you do not see.",
                      place_name: "133 Park St, London, UK",
                      privacy: '2',
                      created_at: '2016-02-22 11:08:10.10')
post44 = Post.create!(user_id: '9',  track: '69uxyAqqPIsUyTO8txoP2M', lat:'51.495126', lon: '-0.108400',
                      message: "Pity and Guilt transfer into Oppression, while Oppression transfers into Pity and Guilt.",
                      place_name: "Imperial War Museum",
                      privacy: '3',
                      created_at: '2016-02-22 13:37:55.55')
post45 = Post.create!(user_id: '8',  track: '68fXn0TVggt7Gr0sPbBuI5', lat:'51.507414', lon: '-0.058424',
                      message: "There is only one constant in life: change.",
                      place_name: "21 Wapping Ln, UK",
                      privacy: '0',
                      created_at: '2016-02-23 10:49:26.26')
post46 = Post.create!(user_id: '4',  track: '1UfBAJfmofTffrae5ls6DA', lat:'51.511093', lon: '-0.088387',
                      message: "There can be no winners in your fight with yourself.",
                      place_name: "100 Cannon St",
                      privacy: '1',
                      created_at: '2016-02-23 21:59:02.02')
post47 = Post.create!(user_id: '8',  track: '6TaqooOXAEcijL6G1AWS2K', lat:'51.515021', lon: '-0.204307',
                      message: "Fight is an accepted method of life in this reality.",
                      place_name: "Colville Terrace, UK",
                      privacy: '2',
                      created_at: '2016-02-24 20:12:29.29')
post48 = Post.create!(user_id: '5',  track: '0PAj9Y5kFEzhGeWkockoxv', lat:'51.530202', lon: '-0.203700',
                      message: "One can fight for health only if one happens to be sick.",
                      place_name: "London, UK",
                      privacy: '3',
                      created_at: '2016-02-25 18:25:55.55')
post49 = Post.create!(user_id: '10',  track: '7ilS0BPWS8ek2P2GaxH3cP', lat:'51.521215', lon: '-0.119582',
                      message: "Disease is a result of your notion of yourself.",
                      place_name: "London",
                      privacy: '0',
                      created_at: '2016-02-25 18:36:00.00')
post50 = Post.create!(user_id: '6',  track: '6RsWqX8zABZLhZydXxEFOm', lat:'51.511848', lon: '-0.135969',
                      message: "You accuse others of what you do not allow yourself to manifest.",
                      place_name: "Daytrippers",
                      privacy: '1',
                      created_at: '2016-02-26 18:33:07.07')
post51 = Post.create!(user_id: '16',  track: '7crplFzt7spG80NCbpmuCp', lat:'51.511848', lon: '-0.130628',
                      message: "In order to understand oneself, one needs to understand the duality of one's personality.",
                      place_name: "Gerrard St",
                      privacy: '2',
                      created_at: '2016-02-26 23:31:12.12')
post52 = Post.create!(user_id: '18',  track: '22mek4IiqubGD9ctzxc69s', lat:'51.509053', lon: '-0.128079',
                      message: "Asserting on side of the truth, you lie in relationship to the whole.",
                      place_name: "London, UK",
                      privacy: '3',
                      created_at: '2016-02-27 03:44:38.38')
post53 = Post.create!(user_id: '14',  track: '25khomWgBVamSdKw7hzm3l', lat:'51.508600', lon: '-0.146408',
                      message: "Love your enemy, as he is you.",
                      place_name: "Hay's Mews, UK",
                      privacy: '0',
                      created_at: '2016-02-28 02:05:17.17')
post54 = Post.create!(user_id: '1',  track: '6splO3UF8hSmK33y5fJTNk', lat:'51.506484', lon: '-0.137304',
                      message: "Arre you ready to see your enemy inside yourself?",
                      place_name: "Christie's King Street",
                      privacy: '1',
                      created_at: '2016-02-28 12:48:58.58')
post55 = Post.create!(user_id: '18',  track: '7fPHfBCyKE3aVCBjE4DAvl', lat:'51.505956', lon: '-0.128929',
                      message: "That is reinforced what we pay attention to?",
                      place_name: "Admiralty House, London",
                      privacy: '2',
                      created_at: '2016-02-28 18:12:58.58')
post56 = Post.create!(user_id: '14',  track: '66hayvUbTotekKU3H4ta1f', lat:'51.507995', lon: '-0.146044',
                      message: "I was born to live, not please everyone!",
                      place_name: "Clarges Mews",
                      privacy: '3',
                      created_at: '2016-02-29 07:26:24.24')
post57 = Post.create!(user_id: '1',  track: '46gjYTEK7W8ZTABcglGP2f', lat:'51.515172', lon: '-0.135847',
                      message: "And they lived happily and often ever after!",
                      place_name: "Kleins",
                      privacy: '0',
                      created_at: '2016-02-29 23:42:43.43')
post58 = Post.create!(user_id: '18',  track: '1HNkqx9Ahdgi1Ixy2xkKkL', lat:'51.514568', lon: '-0.128443',
                      message: "Nothing poisons life more than potassium cyanide...",
                      place_name: "The Phoenix Garden",
                      privacy: '1',
                      created_at: '2016-03-01 21:53:17.17')
post59 = Post.create!(user_id: '3',  track: '3pXF1nA74528Edde4of9CC', lat:'51.516532', lon: '-0.138639',
                      message: "Take everything from life; just remember where you took it from.",
                      place_name: "Princess House, London",
                      privacy: '2',
                      created_at: '2016-03-01 23:31:12.12')
post60 = Post.create!(user_id: '12',  track: '2ZRJRe82aZaVhOKKlbJr4v', lat:'51.514266', lon: '-0.114484',
                      message: "We only live once. I couldn't bear a second time!",
                      place_name: "Carey St, London",
                      privacy: '3',
                      created_at: '2016-03-02 01:21:31.31')
post61 = Post.create!(user_id: '1',  track: '71SDPonZOsIKNtqnaX8LXj', lat:'51.515248', lon: '-0.124923',
                      message: "1/7 of our lives are Mondays :S ",
                      place_name: "The Covent Garden CBT Practice",
                      privacy: '0',
                      created_at: '2016-03-02 09:02:53.53')
post62 = Post.create!(user_id: '6',  track: '46THN9jjPWhSqFUu6YsBhv', lat:'51.514492', lon: '-0.120917',
                      message: "Living is good. But Id prefer to live good somewhere else...",
                      place_name: "Block H",
                      privacy: '1',
                      created_at: '2016-03-02 18:37:26.26')
post63 = Post.create!(user_id: '3',  track: '4wFHfY9IILHLNwakPuFogD', lat:'51.512604', lon: '-0.113392',
                      message: "Nerve cells are born and die; fat cells live forever!",
                      place_name: "Essex St",
                      privacy: '2',
                      created_at: '2016-03-03 10:35:02.02')
post64 = Post.create!(user_id: '13',  track: '34gCuhDGsG4bRPIf9bb02f', lat:'51.503613', lon: '-0.112299',
                      message: "The longer the diagnosis, the shorter the time left to live.",
                      place_name: "Rajput News",
                      privacy: '3',
                      created_at: '2016-03-04 03:11:31.31')
post65 = Post.create!(user_id: '17',  track: '1dl3vuXJS9anUXE7XnNP75', lat:'51.507240', lon: '-0.113756',
                      message: "If a person really wants to live, the medicine is helpless.",
                      place_name: "London South Bank",
                      privacy: '0',
                      created_at: '2016-03-05 01:48:00.00')
post66 = Post.create!(user_id: '17',  track: '7x5xYW5W42OGPAdHUyyguy', lat:'51.507920', lon: '-0.106715',
                      message: "Live as someone has left an open gate for you.",
                      place_name: "Sea Containers House",
                      privacy: '1',
                      created_at: '2016-03-05 22:56:38.38')
post67 = Post.create!(user_id: '17',  track: '40EB7ABUO6MoWMUwPKptJ7', lat:'51.507542', lon: '-0.109871',
                      message: "Life is short.\n\n\nHave a bit of patience.",
                      place_name: "Studio 6 Restaurant, London",
                      privacy: '2',
                      created_at: '2016-03-06 06:47:31.31')
post68 = Post.create!(user_id: '17',  track: '494OU6M7NOf4ICYb4zWCf5', lat:'51.507240', lon: '-0.093121',
                      message: "Value the time! It's the substance that life is made of.........",
                      place_name: "Anchor Bankside, Southwark",
                      privacy: '3',
                      created_at: '2016-03-06 13:33:36.36')
post69 = Post.create!(user_id: '10',  track: '0wdKiSBUT7aZkXUIdJWcwC', lat:'51.510488', lon: '-0.093485',
                      message: "If you didn't manage to make your life great, it means life did YOU!",
                      place_name: "Vintners Place, London",
                      privacy: '0',
                      created_at: '2016-03-07 12:46:05.05')
post70 = Post.create!(user_id: '11',  track: '43PuMrRfbyyuz4QpZ3oAwN', lat:'51.519553', lon: '-0.113634',
                      message: "Life always turns not as you want but as it should be.",
                      place_name: "Gray's Inn Gardens",
                      privacy: '1',
                      created_at: '2016-03-08 10:35:02.02')
post71 = Post.create!(user_id: '13',  track: '6oDkCmfVcSd9NXAKk1b4Ll', lat:'51.512906', lon: '-0.146286',
                      message: "Death takes away the best people. I'm gonna live forever!",
                      place_name: "Mayfair, London",
                      privacy: '2',
                      created_at: '2016-03-08 23:31:12.12')
post72 = Post.create!(user_id: '10',  track: '71EnloViXmSKrQkrkaYFxF', lat:'51.503613', lon: '-0.145194',
                      message: "It would be nice to live as everyone else, but my conscience wouldnt let me.",
                      place_name: "Green Park",
                      privacy: '3',
                      created_at: '2016-03-09 22:37:55.55')
post73 = Post.create!(user_id: '10',  track: '0P6RjFd2HgG2AXJadQuGfE', lat:'51.499155', lon: '-0.145801',
                      message: "Anniversaries: lots of flowers, but you're still alive?",
                      place_name: "Green Park, London",
                      privacy: '0',
                      created_at: '2016-03-10 00:31:41.41')
post74 = Post.create!(user_id: '11',  track: '2H8LPaY3NSjmOFMH2Rygnz', lat:'51.500591', lon: '-0.152113',
                      message: "Simple rule: do your best; let God do the rest.",
                      place_name: "Halkin St, London, UK",
                      privacy: '1',
                      created_at: '2016-03-10 13:19:12.12')
post75 = Post.create!(user_id: '8',  track: '7vFoFDWqTX0mHzLfrF1Cfy', lat:'51.489860', lon: '-0.134876',
                      message: "If the music is too loud, you're probably too old.",
                      place_name: "Pimlico Food & Wine",
                      privacy: '2',
                      created_at: '2016-03-10 21:43:12.12')
post76 = Post.create!(user_id: '10',  track: '0rHVd8h0cFwgLgPFem6S60', lat:'51.503689', lon: '-0.133420',
                      message: "I do very bad things extremely well!",
                      place_name: "The Mall",
                      privacy: '3',
                      created_at: '2016-03-11 20:41:17.17')
post77 = Post.create!(user_id: '2',  track: '32OlwWuMpZ6b0aN2RZOeMS', lat:'51.510791', lon: '-0.137425',
                      message: "Life belongs to optimists; pessimists are spectators.",
                      place_name: "Warwick St, London, UK",
                      privacy: '0',
                      created_at: '2016-03-12 01:01:55.55')
post78 = Post.create!(user_id: '7',  track: '0HMjXBAZmSYOTTi33WpMso', lat:'51.500138', lon: '-0.162552',
                      message: "Life is so short that you can't ruin it for everyone!",
                      place_name: "Russell & Bromley Ltd",
                      privacy: '1',
                      created_at: '2016-03-12 17:52:48.48')
post79 = Post.create!(user_id: '15',  track: '0L6UCE1Y0KX3MF2AtxlntI', lat:'51.594092', lon: '-0.146044',
                      message: "Shit happens; flush it down and move on!",
                      place_name: "Buckingham Palace Rd, London, UK",
                      privacy: '2',
                      created_at: '2016-03-13 05:55:41.41')
post80 = Post.create!(user_id: '7',  track: '66CFbqJScx6zRieGllITcs', lat:'51.504921', lon: '-0.196587',
                      message: "Friday is my second favourite F word.",
                      place_name: "Hornton St",
                      privacy: '3',
                      created_at: '2016-03-13 06:56:10.10')
post81 = Post.create!(user_id: '6',  track: '6ZllZRW9urRfEUdmtMM3lE', lat:'51.500426', lon: '-0.178875',
                      message: "If not us, who? I not now, when?",
                      place_name: "Metric Bar",
                      privacy: '0',
                      created_at: '2016-03-13 13:58:05.05')
post82 = Post.create!(user_id: '7',  track: '664gdARxaClFsoF5SXKOws', lat:'51.537560', lon: '-0.145903',
                      message: "The power of imagination makes us infinite!",
                      place_name: "The Dublin Castle",
                      privacy: '1',
                      created_at: '2016-03-14 04:48:00.00')
post83 = Post.create!(user_id: '6',  track: '0ZogPPD0uFaPXVhlZJOtSK', lat:'51.523320', lon: '-0.116882',
                      message: "In teaching others we teach ourselves.",
                      place_name: "Doughty St, London",
                      privacy: '2',
                      created_at: '2016-03-14 10:13:26.26')
post84 = Post.create!(user_id: '2',  track: '6WhzFzROw3aq3rPWjgYlxr', lat:'51.492283', lon: '-0.225199',
                      message: "You must do the thing you THINK you cannot do.",
                      place_name: "Hammersmith, London, UK",
                      privacy: '3',
                      created_at: '2016-03-14 19:12:00.00')
post85 = Post.create!(user_id: '3',  track: '62vpWI1CHwFy7tMIcSStl8', lat:'51.538577', lon: '-0.132551',
                      message: "Don't regret the past; just learn from it.",
                      place_name: "Grand Union Tow Path, London, UK",
                      privacy: '0',
                      created_at: '2016-03-15 18:56:10.10')
post86 = Post.create!(user_id: '10',  track: '6DUdDIRgLqCGq1DwkNWQTN', lat:'51.533831', lon: '-0.047941',
                      message: "Life is trying things to see if they work.",
                      place_name: "Sewardstone Rd",
                      privacy: '1',
                      created_at: '2016-03-15 19:35:02.02')
post87 = Post.create!(user_id: '4',  track: '3G2grVPTDrTQskKKsoEnRA', lat:'51.52647', lon: '-0.087862',
                      message: "It does not matter how slowly you go as long as you do not stop.",
                      place_name: "Cafe Arena",
                      privacy: '2',
                      created_at: '2016-03-16 15:46:05.05')
post88 = Post.create!(user_id: '7',  track: '3kfxarilcBr81mb2hmZLeh', lat:'51.490671', lon: '-0.129008',
                      message: "The best way out is always through -> !",
                      place_name: "Atterbury St, London, UK",
                      privacy: '3',
                      created_at: '2016-03-17 10:17:46.46')
post89 = Post.create!(user_id: '18',  track: '5iNRPN7oYQvdB9AmeSW6d3', lat:'51.518234', lon: '-0.121787',
                      message: "I hear and I forget.\nI see and I remember.\nI do and I understand.",
                      place_name: "Southampton Pl",
                      privacy: '0',
                      created_at: '2016-03-17 19:39:22.22')
post90 = Post.create!(user_id: '6',  track: '5cKhVlFn0Kuq68V56lSLvW', lat:'51.515775', lon: '-0.116882',
                      message: "Wherever you go, go with all your heart.",
                      place_name: "Lincoln's Inn Fields",
                      privacy: '1',
                      created_at: '2016-03-18 17:38:24.24')
post91 = Post.create!(user_id: '9',  track: '4VrWlk8IQxevMvERoX08iC', lat:'51.523744', lon: '-0.105983',
                      message: "Everything you can imagine is real.",
                      place_name: "St. James's Church Garden",
                      privacy: '2',
                      created_at: '2016-03-19 02:08:10.10')
post92 = Post.create!(user_id: '17',  track: '2YlZnw2ikdb837oKMKjBkW', lat:'51.511196', lon: '-0.113204',
                      message: "Don't wait. The time will never be just right.",
                      place_name: "Victoria Embankment Gardens",
                      privacy: '3',
                      created_at: '2016-03-19 12:28:48.48')
post93 = Post.create!(user_id: '1',  track: '4sw7dHjD6EsGs0d57AHgdy', lat:'51.514418', lon: '-0.121106',
                      message: "The OBSTACLE is the PATH.",
                      place_name: "Drury Lane, London, UK",
                      privacy: '0',
                      created_at: '2016-03-19 16:42:14.14')
post94 = Post.create!(user_id: '15',  track: '5NQbUaeTEOGdD6hHcre0dZ', lat:'51.514927', lon: '-0.153942',
                      message: "Men are born to succeed, not fail.",
                      place_name: "Edwards Mews",
                      privacy: '1',
                      created_at: '2016-03-20 07:13:26.26')
post95 = Post.create!(user_id: '3',  track: '5a7NdkF09AfD0H607eiOkX', lat:'51.523490', lon: '-0.052165',
                      message: "Whatever you are, be a good one.",
                      place_name: "Lang St",
                      privacy: '2',
                      created_at: '2016-03-20 14:38:24.24')
post96 = Post.create!(user_id: '12',  track: '7oGZAicScQt96OAW4AruYy', lat:'51.525524', lon: '-0.063201',
                      message: "May you live every day of your life.",
                      place_name: "Kelsey St",
                      privacy: '3',
                      created_at: '2016-03-20 22:14:53.53')
post97 = Post.create!(user_id: '10',  track: '1tYt8PbpbeTuqsNmprAZYY', lat:'51.528830', lon: '-0.083910',
                      message: "If you have never failed, you have never lived.",
                      place_name: "Yours Food Centre",
                      privacy: '0',
                      created_at: '2016-03-21 15:27:22.22')
post98 = Post.create!(user_id: '8',  track: '6Wytqpe4mfmyeT8s1xbczG', lat:'51.496779', lon: '-0.090587',
                      message: "Ever tried. Ever failed. No matter. Try again. Fail again. Fail better.",
                      place_name: "Burbage Close, London",
                      privacy: '1',
                      created_at: '2016-03-22 08:00:58.58')
post99 = Post.create!(user_id: '6',  track: '6ZANrVuAMp2rpjhfbOuJly', lat:'51.492028', lon: '-0.115929',
                      message: "It is never too late to be what you might have been.",
                      place_name: "Black Prince Community Hub",
                      privacy: '2',
                      created_at: '2016-03-22 13:48:00.00')
postA0 = Post.create!(user_id: '8',  track: '4ja3m5fYLcugwuXB6Jkh4Y', lat:'51.539763', lon: '-0.003661',
                      message: "{tag_1} To be the best, you must also be able to handle the worst. {tag_2}",
                      place_name: "Gibbins Rd, London",
                      privacy: '3',
                      created_at: '2016-03-23 12:00:00.00')

comment1 = Comment.create!(post_id: '1', user_id: '2', message: 'zomg first comment!')
comment2 = Comment.create!(post_id: '1', user_id: '3', message: 'roflmao first reply!')
comment3 = Comment.create!(post_id: '3', user_id: '1', message: 'I still remember it like it was yesterday...')

like1 = Like.create!(post_id: '1', user_id: '3')
like2 = Like.create!(post_id: '1', user_id: '2')
like3 = Like.create!(post_id: '2', user_id: '1')
like4 = Like.create!(post_id: '4', user_id: '1')
like5 = Like.create!(post_id: '4', user_id: '2')
like6 = Like.create!(post_id: '4', user_id: '3')

tag1 = Tag.create!(post_id: '3',    user_id: '1')
tag2 = Tag.create!(post_id: '4',    user_id: '7')
tag3 = Tag.create!(post_id: '100',  user_id: '1')

friendship01_02 = Friendship.create!(user_id: '1',  friend_user_id: '2')
friendship01_03 = Friendship.create!(user_id: '1',  friend_user_id: '3')
friendship01_04 = Friendship.create!(user_id: '1',  friend_user_id: '4')
friendship01_05 = Friendship.create!(user_id: '1',  friend_user_id: '5')
friendship01_06 = Friendship.create!(user_id: '1',  friend_user_id: '6')

friendship02_03 = Friendship.create!(user_id: '2',  friend_user_id: '3')
friendship02_04 = Friendship.create!(user_id: '2',  friend_user_id: '4')
friendship02_05 = Friendship.create!(user_id: '2',  friend_user_id: '5')
friendship02_06 = Friendship.create!(user_id: '2',  friend_user_id: '6')
friendship02_11 = Friendship.create!(user_id: '2',  friend_user_id: '11')
friendship02_14 = Friendship.create!(user_id: '2',  friend_user_id: '14')
friendship02_17 = Friendship.create!(user_id: '2',  friend_user_id: '17')

friendship03_02 = Friendship.create!(user_id: '3',  friend_user_id: '2')
friendship03_04 = Friendship.create!(user_id: '3',  friend_user_id: '4')
friendship03_12 = Friendship.create!(user_id: '3',  friend_user_id: '12')
friendship03_13 = Friendship.create!(user_id: '3',  friend_user_id: '13')
friendship03_14 = Friendship.create!(user_id: '3',  friend_user_id: '14')
friendship03_17 = Friendship.create!(user_id: '3',  friend_user_id: '17')
friendship03_18 = Friendship.create!(user_id: '3',  friend_user_id: '18')

friendship04_02 = Friendship.create!(user_id: '4',  friend_user_id: '2')
friendship04_03 = Friendship.create!(user_id: '4',  friend_user_id: '3')
friendship04_05 = Friendship.create!(user_id: '4',  friend_user_id: '5')
friendship04_06 = Friendship.create!(user_id: '4',  friend_user_id: '6')
friendship04_14 = Friendship.create!(user_id: '4',  friend_user_id: '14')
friendship04_15 = Friendship.create!(user_id: '4',  friend_user_id: '15')

friendship05_02 = Friendship.create!(user_id: '5',  friend_user_id: '2')
friendship05_04 = Friendship.create!(user_id: '5',  friend_user_id: '4')
friendship05_06 = Friendship.create!(user_id: '5',  friend_user_id: '6')
friendship05_11 = Friendship.create!(user_id: '5',  friend_user_id: '11')
friendship05_16 = Friendship.create!(user_id: '5',  friend_user_id: '16')
friendship05_17 = Friendship.create!(user_id: '5',  friend_user_id: '17')
friendship05_18 = Friendship.create!(user_id: '5',  friend_user_id: '18')

friendship06_02 = Friendship.create!(user_id: '6',  friend_user_id: '2')
friendship06_04 = Friendship.create!(user_id: '6',  friend_user_id: '4')
friendship06_05 = Friendship.create!(user_id: '6',  friend_user_id: '5')
friendship06_12 = Friendship.create!(user_id: '6',  friend_user_id: '12')

friendship07_08 = Friendship.create!(user_id: '7',  friend_user_id: '8')
friendship07_09 = Friendship.create!(user_id: '7',  friend_user_id: '9')
friendship07_10 = Friendship.create!(user_id: '7',  friend_user_id: '10')

friendship08_07 = Friendship.create!(user_id: '8',  friend_user_id: '7')
friendship08_09 = Friendship.create!(user_id: '8',  friend_user_id: '9')
friendship08_10 = Friendship.create!(user_id: '8',  friend_user_id: '10')
friendship08_11 = Friendship.create!(user_id: '8',  friend_user_id: '11')

friendship09_07 = Friendship.create!(user_id: '9',  friend_user_id: '7')
friendship09_08 = Friendship.create!(user_id: '9',  friend_user_id: '8')
friendship09_10 = Friendship.create!(user_id: '9',  friend_user_id: '10')

friendship10_07 = Friendship.create!(user_id: '10', friend_user_id: '7')
friendship10_08 = Friendship.create!(user_id: '10', friend_user_id: '8')
friendship10_09 = Friendship.create!(user_id: '10', friend_user_id: '9')

friendship11_02 = Friendship.create!(user_id: '11',  friend_user_id: '2')
friendship11_05 = Friendship.create!(user_id: '11',  friend_user_id: '5')
friendship11_08 = Friendship.create!(user_id: '11',  friend_user_id: '8')
friendship11_12 = Friendship.create!(user_id: '11',  friend_user_id: '12')
friendship11_13 = Friendship.create!(user_id: '11',  friend_user_id: '13')
friendship11_15 = Friendship.create!(user_id: '11',  friend_user_id: '15')
friendship11_16 = Friendship.create!(user_id: '11',  friend_user_id: '16')

friendship12_03 = Friendship.create!(user_id: '12',  friend_user_id: '3')
friendship12_06 = Friendship.create!(user_id: '12',  friend_user_id: '6')
friendship12_11 = Friendship.create!(user_id: '12',  friend_user_id: '11')
friendship12_13 = Friendship.create!(user_id: '12',  friend_user_id: '13')
friendship12_14 = Friendship.create!(user_id: '12',  friend_user_id: '14')
friendship12_16 = Friendship.create!(user_id: '12',  friend_user_id: '16')
friendship12_17 = Friendship.create!(user_id: '12',  friend_user_id: '17')

friendship13_03 = Friendship.create!(user_id: '13',  friend_user_id: '3')
friendship13_11 = Friendship.create!(user_id: '13',  friend_user_id: '11')
friendship13_12 = Friendship.create!(user_id: '13',  friend_user_id: '12')
friendship13_15 = Friendship.create!(user_id: '13',  friend_user_id: '15')
friendship13_17 = Friendship.create!(user_id: '13',  friend_user_id: '17')

friendship14_02 = Friendship.create!(user_id: '14',  friend_user_id: '2')
friendship14_03 = Friendship.create!(user_id: '14',  friend_user_id: '3')
friendship14_04 = Friendship.create!(user_id: '14',  friend_user_id: '4')
friendship14_12 = Friendship.create!(user_id: '14',  friend_user_id: '12')
friendship14_15 = Friendship.create!(user_id: '14',  friend_user_id: '15')
friendship14_18 = Friendship.create!(user_id: '14',  friend_user_id: '18')

friendship15_02 = Friendship.create!(user_id: '15',  friend_user_id: '2')
friendship15_11 = Friendship.create!(user_id: '15',  friend_user_id: '11')
friendship15_13 = Friendship.create!(user_id: '15',  friend_user_id: '13')
friendship15_14 = Friendship.create!(user_id: '15',  friend_user_id: '14')
friendship15_17 = Friendship.create!(user_id: '15',  friend_user_id: '17')

friendship16_02 = Friendship.create!(user_id: '16',  friend_user_id: '2')
friendship16_11 = Friendship.create!(user_id: '16',  friend_user_id: '11')
friendship16_12 = Friendship.create!(user_id: '16',  friend_user_id: '12')
friendship16_18 = Friendship.create!(user_id: '16',  friend_user_id: '18')

friendship17_02 = Friendship.create!(user_id: '17',  friend_user_id: '2')
friendship17_03 = Friendship.create!(user_id: '17',  friend_user_id: '3')
friendship17_05 = Friendship.create!(user_id: '17',  friend_user_id: '5')
friendship17_12 = Friendship.create!(user_id: '17',  friend_user_id: '12')
friendship17_13 = Friendship.create!(user_id: '17',  friend_user_id: '13')
friendship17_14 = Friendship.create!(user_id: '17',  friend_user_id: '14')
friendship17_18 = Friendship.create!(user_id: '17',  friend_user_id: '18')

friendship18_03 = Friendship.create!(user_id: '18',  friend_user_id: '3')
friendship18_05 = Friendship.create!(user_id: '18',  friend_user_id: '5')
friendship18_11 = Friendship.create!(user_id: '18',  friend_user_id: '11')
friendship18_14 = Friendship.create!(user_id: '18',  friend_user_id: '14')
friendship18_16 = Friendship.create!(user_id: '18',  friend_user_id: '16')
friendship18_17 = Friendship.create!(user_id: '18',  friend_user_id: '17')

follow01_02 = Follow.create!(user_id: '1',  followed_user_id: '2')
follow01_03 = Follow.create!(user_id: '1',  followed_user_id: '3')
follow01_08 = Follow.create!(user_id: '1',  followed_user_id: '8')

follow02_03 = Follow.create!(user_id: '2',  followed_user_id: '3')
follow02_04 = Follow.create!(user_id: '2',  followed_user_id: '4')
follow02_05 = Follow.create!(user_id: '2',  followed_user_id: '5')
follow02_06 = Follow.create!(user_id: '2',  followed_user_id: '6')
follow02_07 = Follow.create!(user_id: '2',  followed_user_id: '7')
follow02_08 = Follow.create!(user_id: '2',  followed_user_id: '8')
follow02_11 = Follow.create!(user_id: '2',  followed_user_id: '11')
follow02_14 = Follow.create!(user_id: '2',  followed_user_id: '14')
follow02_17 = Follow.create!(user_id: '2',  followed_user_id: '17')

follow03_01 = Follow.create!(user_id: '3',  followed_user_id: '1')
follow03_04 = Follow.create!(user_id: '3',  followed_user_id: '4')
follow03_08 = Follow.create!(user_id: '3',  followed_user_id: '8')
follow03_09 = Follow.create!(user_id: '3',  followed_user_id: '9')
follow03_13 = Follow.create!(user_id: '3',  followed_user_id: '13')
follow03_17 = Follow.create!(user_id: '3',  followed_user_id: '17')

follow04_02 = Follow.create!(user_id: '4',  followed_user_id: '2')
follow04_06 = Follow.create!(user_id: '4',  followed_user_id: '6')
follow04_07 = Follow.create!(user_id: '4',  followed_user_id: '7')
follow04_08 = Follow.create!(user_id: '4',  followed_user_id: '8')
follow04_09 = Follow.create!(user_id: '4',  followed_user_id: '9')
follow04_10 = Follow.create!(user_id: '4',  followed_user_id: '10')
follow04_14 = Follow.create!(user_id: '4',  followed_user_id: '14')

follow05_02 = Follow.create!(user_id: '5',  followed_user_id: '2')
follow05_04 = Follow.create!(user_id: '5',  followed_user_id: '4')
follow05_06 = Follow.create!(user_id: '5',  followed_user_id: '6')
follow05_08 = Follow.create!(user_id: '5',  followed_user_id: '8')
follow05_16 = Follow.create!(user_id: '5',  followed_user_id: '16')
follow05_18 = Follow.create!(user_id: '5',  followed_user_id: '18')

follow06_02 = Follow.create!(user_id: '6',  followed_user_id: '2')
follow06_04 = Follow.create!(user_id: '6',  followed_user_id: '4')
follow06_05 = Follow.create!(user_id: '6',  followed_user_id: '5')
follow06_07 = Follow.create!(user_id: '6',  followed_user_id: '7')
follow06_08 = Follow.create!(user_id: '6',  followed_user_id: '8')
follow06_09 = Follow.create!(user_id: '6',  followed_user_id: '9')
follow06_12 = Follow.create!(user_id: '6',  followed_user_id: '12')

follow07_08 = Follow.create!(user_id: '7',  followed_user_id: '8')
follow07_09 = Follow.create!(user_id: '7',  followed_user_id: '9')

follow08_07 = Follow.create!(user_id: '8',  followed_user_id: '7')
follow08_10 = Follow.create!(user_id: '8',  followed_user_id: '10')
follow08_11 = Follow.create!(user_id: '8',  followed_user_id: '11')

follow09_08 = Follow.create!(user_id: '9',  followed_user_id: '8')

follow10_07 = Follow.create!(user_id: '10', followed_user_id: '7')
follow10_08 = Follow.create!(user_id: '10', followed_user_id: '8')
follow10_09 = Follow.create!(user_id: '10', followed_user_id: '9')

follow11_02 = Follow.create!(user_id: '11', followed_user_id: '2')
follow11_08 = Follow.create!(user_id: '11', followed_user_id: '8')
follow11_09 = Follow.create!(user_id: '11', followed_user_id: '9')
follow11_12 = Follow.create!(user_id: '11', followed_user_id: '12')
follow11_13 = Follow.create!(user_id: '11', followed_user_id: '13')
follow11_15 = Follow.create!(user_id: '11', followed_user_id: '15')
follow11_18 = Follow.create!(user_id: '11', followed_user_id: '18')

follow12_06 = Follow.create!(user_id: '12', followed_user_id: '6')
follow12_07 = Follow.create!(user_id: '12', followed_user_id: '7')
follow12_08 = Follow.create!(user_id: '12', followed_user_id: '8')
follow12_10 = Follow.create!(user_id: '12', followed_user_id: '10')
follow12_11 = Follow.create!(user_id: '12', followed_user_id: '11')
follow12_13 = Follow.create!(user_id: '12', followed_user_id: '13')
follow12_16 = Follow.create!(user_id: '12', followed_user_id: '16')
follow12_17 = Follow.create!(user_id: '12', followed_user_id: '17')

follow13_03 = Follow.create!(user_id: '13', followed_user_id: '3')
follow13_08 = Follow.create!(user_id: '13', followed_user_id: '8')
follow13_09 = Follow.create!(user_id: '13', followed_user_id: '9')
follow13_12 = Follow.create!(user_id: '13', followed_user_id: '12')
follow13_15 = Follow.create!(user_id: '13', followed_user_id: '15')
follow13_17 = Follow.create!(user_id: '13', followed_user_id: '17')

follow14_02 = Follow.create!(user_id: '14', followed_user_id: '2')
follow14_04 = Follow.create!(user_id: '14', followed_user_id: '4')
follow14_07 = Follow.create!(user_id: '14', followed_user_id: '7')
follow14_08 = Follow.create!(user_id: '14', followed_user_id: '8')
follow14_09 = Follow.create!(user_id: '14', followed_user_id: '9')
follow14_12 = Follow.create!(user_id: '14', followed_user_id: '12')
follow14_18 = Follow.create!(user_id: '14', followed_user_id: '18')

follow15_04 = Follow.create!(user_id: '15', followed_user_id: '4')
follow15_08 = Follow.create!(user_id: '15', followed_user_id: '8')
follow15_11 = Follow.create!(user_id: '15', followed_user_id: '11')
follow15_13 = Follow.create!(user_id: '15', followed_user_id: '13')
follow15_17 = Follow.create!(user_id: '15', followed_user_id: '17')

follow16_05 = Follow.create!(user_id: '16', followed_user_id: '5')
follow16_07 = Follow.create!(user_id: '16', followed_user_id: '7')
follow16_08 = Follow.create!(user_id: '16', followed_user_id: '8')
follow16_09 = Follow.create!(user_id: '16', followed_user_id: '9')
follow16_10 = Follow.create!(user_id: '16', followed_user_id: '10')
follow16_12 = Follow.create!(user_id: '16', followed_user_id: '12')
follow16_18 = Follow.create!(user_id: '16', followed_user_id: '18')

follow17_02 = Follow.create!(user_id: '17', followed_user_id: '2')
follow17_05 = Follow.create!(user_id: '17', followed_user_id: '5')
follow17_08 = Follow.create!(user_id: '17', followed_user_id: '8')
follow17_09 = Follow.create!(user_id: '17', followed_user_id: '9')
follow17_12 = Follow.create!(user_id: '17', followed_user_id: '12')
follow17_13 = Follow.create!(user_id: '17', followed_user_id: '13')
follow17_18 = Follow.create!(user_id: '17', followed_user_id: '18')

follow18_03 = Follow.create!(user_id: '18', followed_user_id: '3')
follow18_07 = Follow.create!(user_id: '18', followed_user_id: '7')
follow18_08 = Follow.create!(user_id: '18', followed_user_id: '8')
follow18_11 = Follow.create!(user_id: '18', followed_user_id: '11')
follow18_14 = Follow.create!(user_id: '18', followed_user_id: '14')
follow18_17 = Follow.create!(user_id: '18', followed_user_id: '17')

follow_request01_04 = FollowRequest.create(user_id: '1', requested_user_id: '4')
follow_request02_01 = FollowRequest.create(user_id: '2', requested_user_id: '1')
follow_request04_01 = FollowRequest.create(user_id: '4', requested_user_id: '1')
follow_request05_01 = FollowRequest.create(user_id: '5', requested_user_id: '1')
follow_request06_01 = FollowRequest.create(user_id: '6', requested_user_id: '1')
