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

        it "doesn't save successfully when password does not have required length" do
            user = User.new( {:name => "Ali", :email => 'ali@yahoo.com', :password => "12", :password_confirmation => "12"})
            user.save
            
            expect(user.errors).not_to be_empty
        end
    end

    describe '.authenticate_with_credentials' do
        it 'will return the user if email and password is correct' do
            user = User.new( {:name => "Ali", :email => 'ali@yahoo.com', :password => "4321", :password_confirmation => "4321"})
            user1 = User.authenticate_with_credentials('ali@yahoo.com', '4321')
            expect(user1).eql? user
        end

        it 'will return the user if email and password is correct, Testing with uppercase email' do
            user = User.new( {:name => "Ali", :email => 'ali@yahoo.com', :password => "4321", :password_confirmation => "4321"})
            user1 = User.authenticate_with_credentials('ALI@yahoo.com', '4321')
            expect(user1).eql? user
        end

        it 'will return nil if password is incorrect' do
            user = User.new( {:name => "Ali", :email => 'ali@yahoo.com', :password => "4321", :password_confirmation => "4321"})
            user1 = User.authenticate_with_credentials('ALI@yahoo.com', '42')
            expect(user1).eql? nil
        end

    end
  
    
end
  