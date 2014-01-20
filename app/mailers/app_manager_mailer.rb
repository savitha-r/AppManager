class AppManagerMailer < ActionMailer::Base
  default from: "anjali.s77@gmail.com"

  def invite_app_email(app, version, email, host)
  	@app = app
  	@version = version
    @email = email
    @host = host
    mail(to: @email, subject: 'Invite to Download & Test App')
  end
end
