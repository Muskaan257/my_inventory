class PasswordResetsController < ApplicationController
    def new
    end
  
    def create
        @user = User.find_by(email: params[:user][:email])

        if @user.present?
        # Send email
            PasswordMailer.reset(@user).deliver_now
        end
        redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
    end

    def edit
        @user = GlobalID::Locator.locate_signed(params[:token], for: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired. Please try again."
    end

    def update
        @user = GlobalID::Locator.locate_signed(params[:token], for: "password_reset")
        if @user.update(password_params)
          redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in."
        else
          render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end