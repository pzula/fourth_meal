require 'spec_helper'

describe UserMailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = FactoryGirl.create(:user)
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  context "welcome email" do
    before(:each) do
      UserMailer.welcome_email(@user).deliver
    end
    it 'should send a welcome email' do
      ActionMailer::Base.deliveries.count.should == 1
    end

    it 'renders the receiver email address for welcome email' do
      ActionMailer::Base.deliveries.first.to.should == [@user.email]
    end

    it 'should set the subject to the correct subject for welcome email' do
      ActionMailer::Base.deliveries.first.subject.should == 'Welcome to Craveyard!'
    end

  it 'renders the sender email for welcome email' do
    ActionMailer::Base.deliveries.first.from.should == ['customer_service@craveyard.com']
  end
end

  context "order email" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      item = FactoryGirl.create(:item)
      @order = FactoryGirl.create(:user_order, customer: @user)
      @order_item = FactoryGirl.create(:order_item, item: item, order:@order)
      UserMailer.order_email(@user, @order).deliver
    end

    it 'should send a order email' do
      ActionMailer::Base.deliveries.count.should == 1
    end

    it 'renders the receiver email address for order email' do
      ActionMailer::Base.deliveries.first.to.should == [@user.email]
    end

    it 'should set the subject to the correct subject for welcome email' do
      ActionMailer::Base.deliveries.first.subject.should == 'Your Grub is Coming!'
    end

    it 'renders the sender email for welcome email' do
    ActionMailer::Base.deliveries.first.from.should == ['customer_service@craveyard.com']
    end
  end

end


