class CommentsController < ApplicationController
    http_basic_authenticate_with name: "Ibrahim", password: "0000", only: :destroy
    expose :article
    expose :comments , -> { article.comments }
    def create
        comment = comments.create(comment_params)

        redirect_to article_path(article)
    end
    def destroy      
        comment = comments.find(params[:id])
        comment.destroy
        redirect_to article_path(article), status: :see_other       
    end
    
    
private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status) 
    end
end
