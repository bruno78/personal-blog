class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validates => :email, :email_format => { :message => 'is not looking good' }
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "Contact Form",
      :to => "devbruno78@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
