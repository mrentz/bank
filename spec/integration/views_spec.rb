require 'spec_helper'

describe "ViewLinks" do

  it "should have the List page as root" do
    get 'users/list'
    response.should render_template('users/list')
  end

  it "should have a New page at '/new'" do
    get '/new'
    response.should render_template('users/new')
  end
  
end
