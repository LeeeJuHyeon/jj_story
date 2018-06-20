class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_ownership!, only:[:destroy]

    def create
        if user_signed_in?
            new_comment = Comment.new(content: params[:content], post_id: params[:post_id], user_id: current_user.id) 
            new_comment.save 
            redirect_back fallback_location: root_path
        else
            redirect_to root_path
        end
    end
    
    def destroy
        @comment.destroy
        redirect_back fallback_location: root_path
    end
    
    private
        def check_ownership!
            @comment = Comment.find_by(id: params[:id])
            redirect_back fallback_location: root_path if @comment.user.id!=current_user.id
        end

end
