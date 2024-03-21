class CommentsController < ApplicationController
        
    expose :article
    expose :comments , -> { article.comments }
    expose :comment

    def create
        # buybug
        comment.article_id = article.id
        if comment.save
            redirect_to article_path(article)
        end
    end
    
    def destroy      
        if comment.destroy
            redirect_to article_path(article), status: :see_other
        end       
    end
    
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status) 
    end
    
end
