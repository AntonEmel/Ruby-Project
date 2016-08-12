class NewEmail < SitePrism::Section
  element :subject, :xpath, "//input[@placeholder='Тема']"
  element :recipients, :xpath, "//div[text()='Получатели']"
  element :recipient, :xpath, "//textarea[@aria-label='Кому']"
  element :letter_body, :xpath, "//div[@aria-label='Тело письма']/.."
  element :send, :xpath, "//div[text()='Отправить']"

  def send_email(recipient_text, subject_text=(0...10).map { ('a'..'z').to_a[rand(26)] }.join)
    recipient.set "#{recipient_text}"
    subject.set "#{subject_text}"
    send.click
    subject_text
  end
end