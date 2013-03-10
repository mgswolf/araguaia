class Notifier < ActionMailer::Base
  default from: "dev.defindex@gmail.com"

  def contact(contact)
    @contact = contact
    mail to: "dev.defindex@gmail.com", subject: @contact.subject
  end
end
