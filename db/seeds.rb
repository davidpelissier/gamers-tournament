# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Adding all the BO's
bos = [{
  name: 'BO1',
  phase:'Poule'
 },
{
  name: 'BO3',
  phase: 'Poule'
},
{
  name: 'BO5',
  phase: 'Poule'
},
{
  name: 'BO1',
  phase:'Final'
},
{
  name: 'BO3',
  phase: 'Final'
},
{
  name: 'BO5',
  phase: 'Final'
}]

Bo.create(bos)

# Adding all the Games
games = [{
  name: "League of Legends"
},
{
  name: "Counter Strike : Global Offensive"
}]

Game.create(games)

# Adding all the tournaments
tournaments = [{
  name: "ESL ESEA",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis distinctio deleniti veritatis amet nobis quidem natus doloremque, voluptates commodi cupiditate magni nemo optio tempora placeat sint totam! Ipsum, distinctio, soluta?",
  game_id: 2,
  teams_limit: 8,
  signup_start: DateTime.parse("2016-01-04 09:43:49"),
  signup_end: DateTime.parse("2016-06-04 09:43:49"),
  check_in: DateTime.parse("2016-01-04 09:43:49"),
  date: DateTime.parse("2016-10-04 09:43:49"),
  mode: 1
},
{
  name: "ESL Pro Series",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis distinctio deleniti veritatis amet nobis quidem natus doloremque, voluptates commodi cupiditate magni nemo optio tempora placeat sint totam! Ipsum, distinctio, soluta?",
  game_id: 1,
  teams_limit: 18,
  signup_start: DateTime.parse("2016-01-04 09:43:49"),
  signup_end: DateTime.parse("2016-06-04 09:43:49"),
  check_in: DateTime.parse("2016-01-04 09:43:49"),
  date: DateTime.parse("2016-10-04 09:43:49"),
  mode: 1
},
{
  name: "IEM San Jose",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis distinctio deleniti veritatis amet nobis quidem natus doloremque, voluptates commodi cupiditate magni nemo optio tempora placeat sint totam! Ipsum, distinctio, soluta?",
  game_id: 2,
  teams_limit: 5,
  signup_start: DateTime.parse("2016-01-04 09:43:49"),
  signup_end: DateTime.parse("2016-06-04 09:43:49"),
  check_in: DateTime.parse("2016-01-04 09:43:49"),
  date: DateTime.parse("2016-10-04 09:43:49"),
  mode: 1
}]
Tournament.create(tournaments)

# Adding all the bo_tournaments
bo_tournaments = [{
  bo_id: 1,
  tournament_id: 1
},
{
  bo_id: 6,
  tournament_id: 1
},
{
  bo_id: 2,
  tournament_id: 2
},
{
  bo_id: 5,
  tournament_id: 2
},
{
  bo_id: 3,
  tournament_id: 3
}]
BoTournament.create(bo_tournaments)

# Adding all the users
pass  = User.new.send(:password_digest, 'password')
users = [{
	username: "admin",
  email: "admin@admin.com",
  password:  "password",
  role: 0
},
{
  username: "user",
  email: "user@user.com",
  password:  "password",
  role: 1
}]
User.create(users)

# Adding all the Matches
# TODO Rajouter les seed pour les todo

