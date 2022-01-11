class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true
    validates :password_confirmation, presence: true, length: { minimum: 4 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email)
        if user && user.authenticate(password)
          user
        else
          nil
        end
    end

end
