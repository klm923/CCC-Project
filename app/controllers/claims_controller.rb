class ClaimsController < ApplicationController
    def index
    end
    
    def new
        @claim = Claim.new
    end
end
