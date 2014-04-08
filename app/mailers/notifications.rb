class Notifications < ActionMailer::Base
  default from: "admin@moviereviews.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_comment.subject
  #
  

  def new_recommendation(user)
    @greeting="Congratulations Chap"
    @id=user.id
    @user= user.name
    mail to: user.email
  end
end
