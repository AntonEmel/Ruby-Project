require_relative '../support/env'
Given(/^user goes to Gmail$/) do
  @home = HomePage.new
  @home.load
end

Then(/^they enter email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  @home.login email, password
end

Then(/^Gmail home page should appears$/) do
  @home.wait_until_gmail_visible(10)
end


Then(/^error message "([^"]*)" appears$/) do |error_message|
  expect(page).to have_xpath(".//span[contains(@id, \"errormsg\") and contains(text(),\"#{error_message}\")]")
end

And(/^login to it like "([^"]*)"$/) do |email|
  @home.login email
  @home.wait_until_gmail_visible(10)
end

Given(/^failed test$/) do
  expect(false).to be_true
end