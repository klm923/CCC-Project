class ParentChildrenController < ApplicationController
    def create
        parent_child = ParentChild.new(parent_child_params)
        parent_child.child_id = 

    end

    private
    def parent_child_params
        params.require(:parent_child).permit(:parent_id,:child_id)
    end
end


# claim = Claim.new(claim_params)
#         claim.user_id = current_user.id
#         if claim.save
#             redirect_to :action => "index"
#         else
#             redirect_to :action => "new"
#         end