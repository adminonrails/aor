class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /admin/articles
  def index
    @q = Article.ransack(search_params)
    @q.sorts = ['id desc'] if @q.sorts.empty?
    @articles = @q.result.page(params[:page])
  end

  # GET /admin/articles/1
  def show
  end

  # GET /admin/articles/new
  def new
    @article = Article.new
  end

  # GET /admin/articles/1/edit
  def edit
  end

  # POST /admin/articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to [:admin, @article], notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/articles/1
  def update
    if @article.update(article_params)
      redirect_to [:admin, @article], notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/articles/1
  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def search_params
      params.fetch(:q, {}).permit(:id_eq)
    end
end
