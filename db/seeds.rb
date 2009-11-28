# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

user = User.find_by_login("codeofficer")
user = User.create!({:login => "codeofficer", :email => "spam@codeofficer.com", :password => "netguy", :password_confirmation => "netguy"}) if user.blank?

room = Room.find_by_name("Asimov")
room = Room.create!({:name => "Asimov"}) if room.blank?