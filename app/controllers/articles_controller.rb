class ArticlesController < ApplicationController
  # these methods all get the set_article before
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    # @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    #  debugger -- to use, just put in 'debugger' without quotes
    # this will stop the live server hard and then you need to go to the IDE console
    # you can query variable values directly, such as 'article_params'
    # type 'n' in the console to go to the next execution block / line
    # ctrl-z to exit gracefully
 
    @article = Article.new(article_params)
    @article.user = current_user

  # cludge
  # @article.user = User.first


    # respond_to do |format|
      if @article.save
        flash[:success] = "Article  was successfully created."
        redirect_to articles_path(@article)
        # format.html { redirect_to @article, notice: 'Article was successfully created.' }
        # format.json { render :show, status: :created, location: @article }
      else
        render 'new'
        # format.html { render :new }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    
    
    
    # respond_to do |format|
      if @article.update(article_params)
        flash[:success] = "Article was successfully updated."    
        redirect_to articles_path(@article)
        # format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        # format.json { render :show, status: :ok, location: @article }
      else
        render 'edit'
        # format.html { render :edit }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully destroyed."  
    redirect_to articles_path
    # respond_to do |format|
    #   format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
      # used to find the article for each of the html actions
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def require_same_user
      if current_user != @article.user
        flash[:danger] = "You can only edit/delete your own articles."
        redirect_to root_path
      end
    end
end
