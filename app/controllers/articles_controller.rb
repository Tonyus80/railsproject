require('profano')
require_relative '../../lib/subject'  #Required to initialize Observer
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  #before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  before_action :initialize_subject

  #Load a custom list of profane words
  Profano.loadProfanoList(Rails.root.join('lib/ita-eng-bad-words-list.csv'))

  # GET /articles or /articles.json
  def index
    #@articles = Article.all
    @articles = Article.paginate(page: params[:page])
    #@articles = Article.paginate(page: params[:page], per_page: 5)

    # Add Search Article
    if params[:search]
      @articles = Article.search(params[:search])
    end
  end
  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])

  end
  #end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    #ensure that the Article is bound to current user
    @article.user = current_user

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
    respond_to do |format|
      if @article.update(article_params)
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
    params.require(:article).permit(:title, :description)
    #params.require(:article).permit(:title, :description, :comment_id)
  end

  #an user that is not an Admin cannot delete other user article
  def require_same_user
    if current_user != @article.user && !current_user.admin?
      #redirect_to @article, alert: "You can only edit or delete your own article"
      flash[:alert] = "You can only edit or delete your own article"

      redirect_to @article
    end
  end

  #initialize Observer library
  def initialize_subject
    @subject = Subject.new
  end

end
