Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  Jamatkhana.new(:region => "Southwest", :name => "Austin", :address => "5555 N Lamar", :phonenumber => "5121234567").save!
  AnnouncementUser.new(:email => email, :password => password, :password_confirmation => password, :jamatkhana => Jamatkhana.find_by_name("Austin")).save!

  visit '/'
  fill_in "announcement_user_email", :with => email
  fill_in "announcement_user_password", :with => password
  click_button "Log in"
end

Given /^I have an announcement with title "([^"]*)" and body "([^"]*)"$/ do |title, body|
    @announcement = Announcement.new({:title => title, :body => body})
    jk = Jamatkhana.find_by_name("Austin")
    @announcement.jamatkhana = jk
    @announcement.save!
end

Given /^I am a new user with email "([^"]*)" and jamatkhana "([^"]*)"$/ do |email, jk|
  password = 'secretpass'
  Jamatkhana.new(:region => "Southwest", :name => jk, :address => "5555 N Lamar", :phonenumber => "5121234567").save!
  AnnouncementUser.new(:email => email, :password => password, :password_confirmation => password, :jamatkhana => Jamatkhana.find_by_name(jk)).save!
end

When /^I log in with the email "([^"]*)"$/ do |email|
  visit '/'
  fill_in "announcement_user_email", :with => email
  fill_in "announcement_user_password", :with => "secretpass"
  click_button "Log in"
end


When /^I click edit on announcement "([^"]*)"$/ do |a_title|
  find(:xpath, "//tr[td[contains(., '" + a_title + "')]]/td/a", :text => 'Edit').click
end