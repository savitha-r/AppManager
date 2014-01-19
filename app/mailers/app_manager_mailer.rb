class AppManagerMailer < ActionMailer::Base
  default from: "savitha.r@2359media.com"

  def invite_app_email(app, version, email)
  	@app = app
  	@version = version
    @email = email
    mail(to: @email, subject: 'Invite to Download & Test App')
  end
end
