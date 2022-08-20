class ClaimsController < ApplicationController
    
    before_action :authenticate_user!
    def index
        @claims = Claim.all
    end

    def new
        @claim = Claim.new
    end
    def create
        claim = Claim.new(claim_params)
        claim.parent_id = params[id]
        claim.user_id = current_user.id
        if claim.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    
    def show
        @claim = Claim.find(params[:id])
        

        @question = Question.new
        @questions = @claim.questions

        @child_claim = Claim.new
        
        
        parent_id = ParentChild.find_by(child_id:params[:id])
        @parent_claim = Claim.find_by(id:parent_id)

    end

    def edit
        @claim = Claim.find(params[:id])
    end

    def update
        claim = Claim.find(params[:id])
        if claim.update(claim_params)
            redirect_to :action => "show", :id => claim.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        claim = Claim.find(params[:id])
        claim.destroy
        redirect_to action: :index
    end

    private
    def claim_params
        params.require(:claim).permit(:title)
    end
end
