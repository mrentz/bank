class AccountTypeController < ApplicationController

  def list
    @account_types = AccountType.find(:all)
  end
  
  def new
    @account_type = AccountType.new
  end
    
  def create
    @account_type = AccountType.new(params[:account_type])
    if @account_type.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def delete
    @account_type = AccountType.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
