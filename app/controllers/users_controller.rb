class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params())
    
    if (@user.save)    # If validations are successfull
      flash[:notice] = "Welcome to the Alpha Blog " + @user.username
      redirect_to articles_path(@article) ## @artcile is passed in because article_path (show fn) needs the id (can see in rake routes)
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if (@user.update(user_params()))
      flash[:notice] = "User updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  
  
  private 
    def user_params()
      params.require(:user).permit(:username, :email, :password)
    end
end