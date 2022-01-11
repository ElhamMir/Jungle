require "rails_helper"
RSpec.describe User, type: :model do
    
    describe 'Validations' do
        it 'saves successfully when all four feilds are set' do
            user = User.new( {:name => "Ali", :email => 'ali@yahoo.com', :password => "4321", :password_confirmation => "4321"})
            user.save
            expect(user.errors).to be_empty
        end
    end
  
    describe '.authenticate_with_credentials' do
      # examples for this class method here
    end
  
end
  