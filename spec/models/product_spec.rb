require 'rails_helper'

RSpec.describe Product, type: :model do
    let(:category) {Category.new(:name => 'gifts')}
    subject {described_class.new(:name => 'flower', :price => 10, :quantity => 5, :category => category)}  
  
   
  describe 'Validations' do
    # validation tests/examples here
    it 'test for a valid object' do
        subject.valid?
        expect(subject.errors).to be_empty
        assc = described_class.reflect_on_association(:category)
        expect(assc.macro).to eq :belongs_to
    end

    it 'test fails because the category is not set' do
      subject.category = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end


    it 'test fails because the name is not set' do
        subject.name = nil
        subject.valid?
        expect(subject.errors).not_to be_empty
    end

    it 'test fails because the price is not set' do
        subject.price_cents = nil
        subject.valid?
        expect(subject.errors).not_to be_empty
    end

    it 'test fails because the quantity is not set' do
        subject.quantity = nil
        subject.valid?
        expect(subject.errors).not_to be_empty
    end
  
    
  end
end


