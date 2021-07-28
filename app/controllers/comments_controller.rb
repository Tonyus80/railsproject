require('Profano')
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  #Load a custom list of profane words
  #Profano.loadProfaneWords(Rails.root.join('lib/profano/ita-eng-bad-words-list.csv'))
  Profano.loadProfanoList(Rails.root.join('lib/ita-eng-bad-words-list.csv'))

  # GET /comments or /comments.json
  def index
    #requre foregn key article id
    @article = Article.find(params[:article_id])
    @comments = Comment.all
    @user = current_user
  end

  # GET /comments/1 or /comments/1.json
  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

  end

  # GET /comments/new
  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    @article = Article.find(params[:article_id])
    # @comment = Comment.new(comment_params)
    #@comment = @article.comments.find(params[:id])
    @comment = @article.comments.build(comment_params)

    @comment.user = current_user

    #respond_to do |format|
      #check profanity filter
    #@comment.content = Profano.profanoFilter(@comment.content)
    # the condition true make sure that no profane words are detected
    if Profano.profanoFilter(@comment.content)

      if @comment.save
        #format.html { redirect_to @comment, notice: "Comment was successfully created." }
        redirect_to article_comments_url(@article, @comment)
        #format.json { render :show, status: :created, location: @comment }
      else
        #format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
        render :action => "new"
      end
    else
      #redirect_to article_comments_url(@article, @comment), flash: { alert: "Forbidden language detected !" }
      redirect_to article_comments_url(@article, @comment), notice: "Forbidden language detected !"
  end

    end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update

    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if Profano.profanoFilter(@comment.content)
        if @comment.update(comment_params)

          format.html { redirect_to article_comment_url(@article, @comment), notice: "Comment was successfully updated." }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      else
        #redirect_to article_comments_url(@article, @comment), flash: { alert: "Forbidden language detected !" }
        redirect_to article_comments_url(@article, @comment), notice: "Forbidden language detected !"

      end
      
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content, :user)
  end

end

