class ApplicationMailer < ActionMailer::Base
  #no-reply@sheltersoft.com, info@sheltersoft.com, feedback@sheltersoft.com, carrier@sheltersoft.com
  default from: "info@sheltersoft.com"
  layout 'mailer'
end
