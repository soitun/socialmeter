class UsersController < ApplicationController

  before_filter :get_user, :except => [:index, :new, :create]

  def index
    @users = User.find(:all)
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.xml {
        @users = @user.friends
        render
      }
      format.csv {
        @users = @user.friends
        render
      }
      format.html
    end
  end

  def edit
    respond_to do |format|
      format.html
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :action => 'edit'
    end
    redirect_to @user
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.create(params[:user])
    if @user.valid?
      redirect_to @user
    else
      render :action => 'new'
    end
  end

  protected

  def get_user
    @user = User.find(params[:id])
  end

end
