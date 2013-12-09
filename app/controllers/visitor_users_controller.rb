class VisitorUsersController < ApplicationController
  before_action :set_visitor_user, only: [:show, :edit, :update, :destroy]

  # GET /visitor_users
  # GET /visitor_users.json
  def index
    @visitor_users = VisitorUser.all
  end

  # GET /visitor_users/1
  # GET /visitor_users/1.json
  def show
  end

  # GET /visitor_users/new
  def new
    @visitor_user = VisitorUser.new
  end

  # GET /visitor_users/1/edit
  def edit
  end

  # POST /visitor_users
  # POST /visitor_users.json
  def create
    @visitor_user = VisitorUser.new(visitor_user_params)

    respond_to do |format|
      if @visitor_user.save
        format.html { redirect_to @visitor_user, notice: 'Visitor user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @visitor_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @visitor_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitor_users/1
  # PATCH/PUT /visitor_users/1.json
  def update
    respond_to do |format|
      if @visitor_user.update(visitor_user_params)
        format.html { redirect_to @visitor_user, notice: 'Visitor user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @visitor_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitor_users/1
  # DELETE /visitor_users/1.json
  def destroy
    @visitor_user.destroy
    respond_to do |format|
      format.html { redirect_to visitor_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor_user
      @visitor_user = VisitorUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_user_params
      params.require(:visitor_user).permit(:email)
    end
end
