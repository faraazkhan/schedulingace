# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
Role.delete_all
%w[admin instructor student].each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
User.delete_all
user = User.find_or_create_by_email :name => 'faraaz khan', :email => 'faraaz@rationalizeit.us', :password => 'password', :password_confirmation => 'password', :stripe_token => 'pk_test_0aJl2L2k98dG9lF3u6zyfDdj'
puts 'user: ' << user.name
user.add_role :admin
user2 = User.find_or_create_by_email :name => 'Silver User', :email => 'user2@example.com', :password => 'changeme', :password_confirmation => 'changeme', :stripe_token => 'pk_test_0aJl2L2k98dG9lF3u6zyfDdj'
user2.add_role :silver
user3 = User.find_or_create_by_email :name => 'Gold User', :email => 'user3@example.com', :password => 'changeme', :password_confirmation => 'changeme', :stripe_token => 'pk_test_0aJl2L2k98dG9lF3u6zyfDdj'
user3.add_role :gold
user4 = User.find_or_create_by_email :name => 'Platinum User', :email => 'user4@example.com', :password => 'changeme', :password_confirmation => 'changeme', :stripe_token => 'pk_test_0aJl2L2k98dG9lF3u6zyfDdj'
user4.add_role :platinum
puts "users: #{user2.name}, #{user3.name}, #{user4.name}"
