class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password.reset.subject
  #
  def reset(user)
    @token = user.to_signed_global_id(for: "password_reset", expires_in: 15.minutes)
    @email=user.email
    mail(to: user.email, subject: "Password Reset")
  end
end
