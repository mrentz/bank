class UsersController < ApplicationController
  def list
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @accounts = Account.find(:all)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "New User Successfully Created"
      redirect_to :action => 'list'
    else
     flash.now[:fail] = "New User Unsuccessfully Created"
      @accounts = Account.find(:all)
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "New User Successfully Updated"
      redirect_to :action => 'show', :id => @user.id
    else 
      render :action => 'edit'
    end
  end
  
  def delete
    @user = User.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def show_accounts
   @account_type = AccountType.find(params[:id])
  end

end
