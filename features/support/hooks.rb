include AllureCucumber::DSL
After do |scenario|
  if scenario.failed?
    path = take_screenshot(scenario.name)
    AllureCucumber::DSL.attach_file("#{scenario.name}.png -FAILURE Screenshot", path, false)
  end
 page.driver.browser.manage.delete_all_cookies unless Capybara.default_driver == :poltergeist
end

def take_screenshot(scenario_name)
    screenshots_path= 'artifacts/screenshots/'
    unless File.directory?(screenshots_path)
      FileUtils.mkdir_p(screenshots_path)
    end
    page.driver.browser.save_screenshot "#{screenshots_path}/#{scenario_name}.png"
end
