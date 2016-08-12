class LoginPage < SitePrism::Section
  element :email_input, :css, "#Email"
  element :next_button, :css, "#next"
  element :password_input, :css, "#Passwd"
  element :singin_button, :css, "#signIn"
  element :choose_account, :xpath, "//a[contains(text(),'Sign in with a different account')]"
  element :add_account, :css, "#account-chooser-add-account"

  def set_email(email)
    wait_for_email_input
    email_input.set "#{email}"
    next_button.click
  end

  def set_pass(pass)
    wait_for_password_input
    password_input.set "#{pass}"
    singin_button.click
  end

end