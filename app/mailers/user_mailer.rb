class UserMailer < ApplicationMailer
    default from: 'neyder6101@gmail.com'
    
    def welcome_email
        mail(to: 'neyder6101@gmail.com', subject: 'Welcome to My Awesome Site')
    end

end
