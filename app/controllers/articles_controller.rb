class ArticlesController < ApplicationController

def new #Definiendo metodo new
	@article = Article.new
end

#Definiendo metodo create
 def create
 	#  @article = Article.new(params[:article])
 	@article = Article.new(article_params)
 
  if @article.save
  redirect_to @article
   else
    render 'new'
end
  end

http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show]

#Definiendo metodo create
def index
  @articles = Article.all
end
#Definiendo metodo show
def show
  @article = Article.find(params[:id])
end
#Definiendo metodo edit
def edit
  @article = Article.find(params[:id])
end
#Definiendo metodo update
def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
#Definiendo metodo Destroy/Eliminar
def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end



private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end




#Controlador llamado Articulo