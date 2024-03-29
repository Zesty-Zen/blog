 class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "Ibrahim", password: "0000", only: :destroy


  # exposure_config :whole_table, fetch: ->{ Article.all }
  expose :articles, ->{ Article.all }
  expose! :article

  def create
    if article.save
      redirect_to article_path(article)
    else
      render :new
    end
  end

  def update
    if article.update(article_params)
      redirect_to article_path(article)
    else
      render :edit
    end
  end

  def destroy
    article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end