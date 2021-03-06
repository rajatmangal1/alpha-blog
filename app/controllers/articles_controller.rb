class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params());
    
    if (@article.save)    # If validations are successfull
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article) ## @artcile is passed in because article_path (show fn) needs the id (can see in rake routes)
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if (@article.update(article_params()))
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def index
    @article = Article.all
    
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  
  
  
  
  private
    def article_params()
      params.require(:article).permit(:title, :description)
    end
    
    
end