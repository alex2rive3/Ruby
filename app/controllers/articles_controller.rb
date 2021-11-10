class ArticlesController < ApplicationController

  before_action :set_article, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, only: [:new, :destroy, :my_articles]

  # GET /articles or /articles.json

  def index

    @articles = Article.order("title DESC")

    @articles = Article.paginate(:page=>params[:page],per_page:6).order("created_at desc")   

    if params[:title].present?

      @articles = @articles.where("title ILIKE ?", "%#{params[:title]}%")



    elsif params[:title] == params[:title].nil?

      flash[:alert] = "No hay coincidencias"

    end

  end

  def my_articles

    @articles = current_user.articles.order("title DESC")



  end

  # GET /articles/1 or /articles/1.json

  def show

    #params.require(:article).permit(:title, :status)

  end



  # GET /articles/new

  def new

    @article = Article.new

    @categories = Category.all

  end



  # GET /articles/1/edit

  def edit

    #params.require(:article).permit(:title, :status)

    @categories = Category.all

  end



  # POST /articles or /articles.json

  def create

    @article = Article.new(article_params)

    @article.user = current_user

    @article.save_categories

    respond_to do |format|

      if @article.save

        format.html { redirect_to @article, notice: "Article was successfully created." }

        format.json { render :show, status: :created, location: @article }

      else

        format.html { render :new, status: :unprocessable_entity }

        format.json { render json: @article.errors, status: :unprocessable_entity }

      end

    end

  end



  # PATCH/PUT /articles/1 or /articles/1.json

  def update

    #params.require(:article).permit(:title, :status)

    respond_to do |format|

      if @article.update(article_params)

        @article.save_categories

        format.html { redirect_to @article, notice: "Article was successfully updated." }

        format.json { render :show, status: :ok, location: @article }

      else

        format.html { render :edit, status: :unprocessable_entity }

        format.json { render json: @article.errors, status: :unprocessable_entity }

      end

    end

  end



  # DELETE /articles/1 or /articles/1.json

  def destroy

    #params.require(:article).permit(:title, :status)

    @article.destroy

    respond_to do |format|

      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }

      format.json { head :no_content }

    end

  end



  private

    # Use callbacks to share common setup or constraints between actions.

    def set_article

      @article = Article.find(params[:id])

    end



    # Only allow a list of trusted parameters through.

    def article_params

      params.require(:article).permit(:title, :content, :user_id, category_elements: [])

    end

end

