class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def create
        claim = Claim.find(params[:claim_id])
        question = claim.questions.build(question_params) #buildを使い、contentとtweet_idの二つを同時に代入
        question.user_id = current_user.id
    if question.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
    else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
    end
    end

    private

    def question_params
        params.require(:question).permit(:content)
    end
end
