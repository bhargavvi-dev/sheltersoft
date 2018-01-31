class ContactMailer < ActionMailer::Base
  default to: "gagan.virtueinfo@gmail.com"

  def send_contact_us(contact_params)
    @contact_params = contact_params
    mail(from: @contact_params[:email], subject: "Inquiry Request")
  end

  def send_contact_confirm(contact_params)
    @contact_params = contact_params
    mail(to: @contact_params[:email], subject: "Inquiry Request", from: "info@sheltersoft.com")
  end

end
