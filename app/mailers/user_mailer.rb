class UserMailer < ApplicationMailer
    default :from => "noreply@ironcityfishingclub.com"

    def registration_confirmation(user)
        @user = user
        mail(to: user.email, :subject => "Registration Confirmation")
    end

    def password_reset(user)
        @user = user
        mail(to: user.email, :subject => "Password Reset")
    end

    def verified_confirmation(user)
        @user = user
        mail(to: user.email, :subject => "ICFC Account Verified")
    end

    def new_member_notification(user)
        @user = user
        users = ['diehlstx@gmail.com', 'richard@hugessen.ca']
        users.each do |ad_user|
            mail(to: "#{ad_user}", :subject => "A new member is awaiting your approval.")
        end
    end
end
