require 'spec_helper'

describe UsersController do 

  before :each do 
    @user = FactoryGirl.create(:user, email: "kittens@love.com", username: "kitty")
    @admin = FactoryGirl.create(:user, admin: true)
  end

  it "should get index" do
    login_user(@admin)
    get :index
    expect(response.status).to eq(200)
    expect(assigns(:users)).to be 
  end

  it "should get new user" do 
    get :new
    expect(response.status).to eq(200)
  end

  it "should create a new user" do 
    post :create, user: FactoryGirl.attributes_for(:user)
    expect(User.all.count).to eq(3)
  end

  it "should show a user" do 
    login_user(@user)
    get :show, :id => @user.to_param
    expect(response.status).to eq(200)
  end

  it "should allow admin to get to edit user page " do 
    login_user(@admin)
    get :edit, :id => @user.to_param
    expect(response.status).to eq(200)
  end

  it "should be able to update a user" do 
    pending
    login_user(@user)
    put :update, :id => @user.to_param, :user => @user.attributes
    response.should redirect_to(user_path(assigns(:user)))
  end

  it "should destroy a user" do 
    login_user(@user)
    expect(User.all.count).to eq(2)
    delete :destroy, :id => @user.to_param
    expect(User.all.count).to eq(1) 
    response.should redirect_to(users_path)
  end

end
