class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def post_created
    @user = params[:user]
    @post = params[:post]
    @greeting = "Hi"
    #attachments['rails.png'] = File.read('app/assets/images/rails.png')
    mail(
      #from: "Blob <hello@mundo.com>",
      to: email_address_with_name(User.first.email, User.first.email),
      cc: User.all.pluck(:email), 
      bcc: 'secrec@mail.com', 
      subject: "Post creado"
      )
  end
end