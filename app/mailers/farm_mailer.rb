class FarmMailer < ActionMailer::Base
  default from: "familyfarmfun.us@gmail.com"

  def comment_email(comment)
  	@comment = comment

  	mail(to: comment.farm.email_address, subject: "#{@comment.user.name} commented on your farm.")
  end
end
