class AccountController < ApplicationController
   def list
     @accounts = Account.find(:all)
   end

   def show
     @account = Account.find(params[:id])
   end

   def new
     @account = Account.new
     @account_types = AccountType.find(:all)
     @user = User.find(params[:id])
  end

   def create
     @account = Account.new(params[:account])
     @user = User.find(params[:id])
     @account_types = AccountType.find(:all)
     if @account.save
       flash[:success] = "New Account Successfully Created"
       redirect_to :action => 'list'
     else
       flash[:fail] = "Account Creation was Unsuccessful"
       render :action => 'new'
     end
   end
   
   def edit
   end
   def update
   end
  
  def delete
    @account = Account.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
