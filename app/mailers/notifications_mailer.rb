class NotificationsMailer < ActionMailer::Base
  default :from => "no-reply.zacharyreview@gmail.com"
  default :to => "info.zacharyreview@gmail.com" 
  default :subject => "User Contact" 

  def new_contact(contact)
    @contact = contact
    #mail(:subject => "#{contact.subject}")
    mail()
  end

end
