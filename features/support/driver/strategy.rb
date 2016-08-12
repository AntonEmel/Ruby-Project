module Strategy

  module Grid

    def setup_grid
      if  ENV.include? 'browser'
        case ENV['browser']
          when 'chrome', 'ch'
            capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
          when 'firefox', 'ff'
            capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
          when 'poltergeist', 'pl'
            capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs
        end
      else
        capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
      end

      if ENV.include? 'host'
       url = "http://#{ENV['host']}"
      else
       url = "http://localhost:4444/wd/hub"
      end


      Capybara.register_driver :remote_browser do |app|
        Capybara::Selenium::Driver.new(
            app,
            :browser => :remote,
            url: url,
            desired_capabilities: capabilities
        )
      end
      Capybara.default_driver = :remote_browser
      Capybara.javascript_driver = :remote_browser

      Capybara.configure do |config|
        config.run_server = false
        config.app_host = 'https://mail.google.com'
        unless (ENV['browser'].equal?'poltergeist') || (ENV['browser'].equal?'pl')
          config.page.driver.browser.manage.window.maximize
        end
      end
    end
  end

  module Local

    def setup_local
      if  ENV.include? 'browser'
        case ENV['browser']
          when 'chrome', 'ch'
            Capybara.register_driver :selenium do |app|
              Capybara::Selenium::Driver.new(app, :browser => :chrome)
            end
            Capybara.javascript_driver = :chrome

          when 'firefox', 'ff'
            Capybara.register_driver :selenium do |app|
              Capybara::Selenium::Driver.new(app, :browser => :firefox)
            end
            Capybara.javascript_driver = :firefox

          when 'poltergeist', 'pl'
            Capybara.javascript_driver = :poltergeist
        end
      end
      Capybara.configure do |config|
        config.run_server = false
        config.app_host = 'https://mail.google.com'
        if config.javascript_driver == :poltergeist
          config.default_driver = :poltergeist
        else
          config.default_driver = :selenium
          config.page.driver.browser.manage.window.maximize
        end
      end
    end
  end

end