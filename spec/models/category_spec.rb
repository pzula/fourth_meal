require 'spec_helper'

describe Category do
 it { should validate_presence_of(:name)}

 it "should have case-insensitive name validations" do
  category = FactoryGirl.build(:category, name: 'japanese')
  category.save
  invalid_category = FactoryGirl.build(:category, name: 'JAPANESE')
  invalid_category.should_not be_valid
 end
end
