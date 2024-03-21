class CommentsController < ApplicationController
    
    http_basic_authenticate_with name: "Ibrahim", password: "0000", only: :destroy
    
    expose :article
    expose :comments , -> { article.comments }
    expose :comment

    def create
        # comment = comments.create(comment_params)
        if comment.save
            redirect_to article_path(article)
        end
    end
    
    def destroy      
        # comment = comments.find(params[:id])
        if comment.destroy
            redirect_to article_path(article), status: :see_other
        end       
    end
    
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status) 
    end
    
end
