When(/^user send email to "([^"]*)"$/) do |user_email|
  @home = HomePage.new
  @home.click_write_new_email
  @home.send_new_email "#{user_email}@gmail.com"
end

Then(/^popup with message "([^"]*)" should appears$/) do |message|
  expect(page).to have_xpath("//div[contains(text(),'#{message}')]")
end

And(/^user "([^"]*)" with password "([^"]*)" should got email from "([^"]*)"$/) do |user_email, user_password, user_email_2|
  @home.logout
  @home.login "#{user_email}", "#{user_password}"
  expect(page).to have_xpath(".//span[@email='#{user_email_2}@gmail.com']", visible: true)
  expect(page).to have_xpath(".//b[text()='#{@home.get_subject}']", visible: true)
end

Then(/^user should got email from "([^"]*)"$/) do |user_email_2|
  expect(page).to have_xpath(".//span[@email='#{user_email_2}@gmail.com']", visible: true)
  expect(page).to have_xpath(".//b[text()='#{@subject}']", visible: true)
end

Given(/^to  user "([^"]*)" was sent email from "([^"]*)" with password "([^"]*)"$/) do |user_email, user_email_2, user_password_2|
  @subject = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  Pony.mail(:to=> "#{user_email}@gmail.com",
            :from=> "Test mail <#{user_email_2}@gmail.com>",
            :via => :smtp, :via_options =>{
          address: 'smtp.gmail.com',
          port: '587',
          user_name: "#{user_email_2}@gmail.com",
          password: "#{user_password_2}",
          authentication: :plain,
          damain: 'mail.google.com'},
            subject: "#{@subject}", body: "Some text")
end