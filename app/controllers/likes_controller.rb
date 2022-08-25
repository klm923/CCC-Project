class LikesController < ApplicationController
    def create
        like = Like.new(claim_id: params[:claim_id], user_id: current_user.id)
        like.save
        # ↑↓どちらでもよい
        # like = current_user.likes.create(claim_id: params[:claim_id]) #user_idとtweet_idの二つを代入
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(claim_id: params[:claim_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end
end
