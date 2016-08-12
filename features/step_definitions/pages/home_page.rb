require_relative 'login/login_page'
require_relative 'new_email'
require_relative '../config/configurations'
class HomePage< SitePrism::Page
  set_url "/"
  element :gmail, :xpath, ".//span[text()=\"Gmail\"]"
  element :write_letter_button, :xpath, ".//div[text()=\"НАПИСАТЬ\"]"
  element :account, :xpath, ".//a[contains(@title, 'Аккаунт Google')]"
  element :add_account, :xpath, ".//a[text()='Добавить аккаунт']"

  section :new_email, NewEmail, :xpath, ".//div[text()=\"Новое сообщение\"]"
  section :login_area, LoginPage, :xpath, ".//div[contains(@class,'pre-shift')]"

  def login(email=Configurations.get_email_1, pass=Configurations.get_password_1)
    wait_until_login_area_visible(20)
    login_area.set_email email
    login_area.set_pass pass
  end

  def click_write_new_email
    wait_until_write_letter_button_visible(10)
    write_letter_button.click
  end

  def send_new_email(recipient)
    wait_for_new_email
    @subject = new_email.send_email "#{recipient}"
  end

  def get_subject
    @subject
  end

  def logout
    account.click
    wait_until_add_account_visible(5)
    add_account.click
    #Get new handler
    popup = page.driver.browser.window_handles.last
    #Then switch control between the windows
    page.driver.browser.switch_to.window(popup)
  end
end