# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username:  "Test User",
             email: "test@test.com",
             password:              "testtest",
             password_confirmation: "testtest")


User.create!(username:  "Test User N2",
             email: "testn2@testn2.com",
             password:              "testtest",
             password_confirmation: "testtest")