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
     @account = Account.find(params[:id])
     @account_types = AccountType.find(:all)
   end

   def update
     @account = Account.find(params[:id])
     if @account.update_attributes(params[:account])
       flash[:success] = "Account Successfully Updated"
       redirect_to :action => 'show', :id => @account.id
     else
       flash[:fail] = "Update was Unsuccessful"
       render :action => 'edit'
     end
    end
  
   def atm
     @account = Account.find(params[:id])
     @account_types = AccountType.find(:all)
   end

   def update_atm
     @account = Account.find(params[:id])
     if params[:type] == "Deposit"
       @account.ballance += params[:ballance].to_f
     else
       @account.ballance -= params[:ballance].to_f
     end
     if @account.update_attributes(params[:account])
       flash[:success] = "Account Successfully Updated"
       redirect_to :action => 'show', :id => @account.id
     else
       flash[:fail] = "Update was Unsuccessful"
       render :action => 'edit'
     end
    end

   def calc
     @account = Account.find(params[:id])
    end
 
  def delete
    @account = Account.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
