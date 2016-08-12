require 'allure-cucumber'
require "capybara/cucumber"
require 'selenium-webdriver'
require 'site_prism'
require 'pony'
require 'capybara/poltergeist'
require_relative '../step_definitions/pages/home_page'
require_relative '../step_definitions/pages/login/login_page'
require_relative '../step_definitions/pages/new_email'
require_relative '../support/driver/strategy'


include Strategy::Grid
include Strategy::Local

if ENV.include?'strategy'
  case ENV['strategy']
    when 'grid', 'gr'
      Strategy::Grid.setup_grid
    when 'local', 'lc'
      Strategy::Local.setup_local
    else
      Strategy::Local.setup_local
  end
else
  Strategy::Local.setup_local
end



