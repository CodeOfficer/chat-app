# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

%w(user1 user2).each do |user|
  User.create!({  :login => user, :email => "#{user}@example.com", :password => "password", :password_confirmation => "password"}) 
end

Room.create!({:name => "Lobby"})