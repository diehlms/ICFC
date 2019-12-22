class ArticlesController < ApplicationController

before_action :set_article, only: [:edit, :update, :show, :destroy]
helper_method :current_user, :logged_in?

def new
    @article = current_user.articles.build
end

def show
    user = session[:user_id]
    @comment = Comment.new(article_id: params[:id])
    set_article
    @comments = @article.comments.paginate(page: params[:page]).order("created_at DESC")
end

def index
    if params[:search]
        @articles = Article.where('lower(title) LIKE ? OR lower(content) LIKE ?', "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").paginate(page: params[:page])
    else
        @articles = Article.paginate(page: params[:page]).reorder("pinned DESC", "created_at DESC")
    end
end

def create
    @article = current_user.articles.new(article_params)
    if @article.save
        redirect_to article_path(@article), notice: "Article created"
    else
        render 'new'
    end
end

def update
    if current_user.admin?
        set_article
    else
        @article = current_user.articles.find(params[:id])
    end
    if @article.update(article_params)
        redirect_to article_path(@article), notice: "Article updated"
    else
        render 'edit', notice: "There was a problem with updating the article"
    end
end

def toggle_pinned
    set_article
    @article.toggle(:pinned).save
    redirect_to articles_path
end

def edit
    @article = current_user.articles.find(params[:id])
end

def destroy
    set_article
    @article = current_user.articles.find(params[:id])
    if @article.destroy
        redirect_to articles_path, notice: "Article was deleted"
    else
        redirect_to articles_path
    end
end

private

    def article_params
        params.require(:article).permit(:title, :content, :pinned, :image, :user_id, :search)
    end

    def set_article
        @article = Article.find_by_id(params[:id])
    end

    def comment_params
        params.permit(:content, :user_id, :article_id)
    end
end
