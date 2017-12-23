Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  j = Jamatkhana.new(:region => "Southwest", :name => "Austin", :phonenumber => "5121234567", :address => "5555 N Lamar")
  j.save!
  AnnouncementUser.new(:email => email, :password => password, :password_confirmation => password, :jamatkhana => j).save!

  visit '/'
  fill_in "announcement_user_email", :with => email
  fill_in "announcement_user_password", :with => password
  click_button "Log in"
end