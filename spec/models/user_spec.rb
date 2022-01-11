require "rails_helper"
RSpec.describe User, type: :model do
    
    describe 'Validations' do
        it 'saves successfully when all four feilds are set' do
            user = User.new( {:name => "Ali", :email => 'ali@yahoo.com', :password => "4321", :password_confirmation => "4321"})
            user.save
            expect(user.errors).to be_empty
        end

        it "doesn't save successfully when name is not set" do
            user = User.new( {:name => nil, :email => 'ali@yahoo.com', :password => "4321", :password_confirmation => "4321"})
            user.save
            
            expect(user.errors).not_to be_empty
        end

        it "doesn't save successfully when email is not set" do
            user = User.new( {:name => "Ali", :email => nil, :password => "4321", :password_confirmation => "4321"})
            user.save
            
            expect(user.errors).not_to be_empty
        end

        it "doesn't save successfully when password is not set" do
            user = User.new( {:name => "Ali", :email => 'ali@yahoo.com', :password => nil, :password_confirmation => "4321"})
            user.save
            
            expect(user.errors).not_to be_empty
        end

        it "doesn't save successfully when password is not set" do
            user = User.new( {:name => "Ali", :email => 'ali@yahoo.com', :password => "1234", :password_confirmation => "4321"})
            user.save
            
            expect(user.errors).not_to be_empty
        end
    end
  
    # describe '.authenticate_with_credentials' do
    #     session = User.new( {:name => "Ali", :email => 'ali@yahoo.com', :password => "4321", :password_confirmation => "4321"})
    #     user = SessionsController.authenticate_with_credentials('ali@yahoo.com', '4321')
    #     expect(session).eql? nil
    #   # examples for this class method here
    # end
  
end
  