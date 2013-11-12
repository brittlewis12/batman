# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(username:"mihran", email:"mihran.abrahamian@gmail.com", password:"ding", password_confirmation:"ding" )
User.create(username:"george", email: "george@george.com", password:"george", password_confirmation:"george")
User.create(username:"jim", email: "jim@james.com", password:"jim", password_confirmation:"jim")
User.create(username:"joe", email: "joe@joe.com", password:"joe", password_confirmation:"joe")


Song.create(name:"Let's make apps", creator_id: 1)
Song.create(name:"Rails on Ruby", creator_id: 2 )

Track.create(name:"lead vocals", desc:"my voice", url:"dkdadfadf", song_id: 1 , user_id: 1 )
Track.create(name:"snare drum", desc:"thwack", url:"dsfsdflksdf", song_id: 1 , user_id: 2 )
Track.create(name:"bass", desc:"boom", url:"dshskdgsdg", song_id: 1, user_id: 3 )
Track.create(name:"handclaps", desc:"", url:"", song_id: 2 , user_id: 3 )
Track.create(name:"soundFX", desc:"kapow!!!", url:"fgkhdskhgsdk", song_id: 2 , user_id: 4 )
Track.create(name:"guitar", desc:"lalalalala", url:"sdgsdgsdg", song_id: 2 , user_id: 2 ) 
