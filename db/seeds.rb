# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Account
Account.destroy_all
Account.create!(id: 1, name: "frontale_bot", note: "川崎フロンターレBot", associate_tag: "kawasaki_frontale_bot-22")
puts "Account: #{Account.count} created"

# RssSite
RssSite.destroy_all
RssSite.create!(id: 1, title: "Goal,com",   url: "http://www.goal.com/jp/feeds/news?fmt=rss&ICID=OP")
RssSite.create!(id: 2, title: "SoccerKing", url: "http://www.soccer-king.jp/RSS.rdf")
puts "RssSite: #{RssSite.count} created"
