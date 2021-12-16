class ApplicationController < ActionController::API
 before_action :find_by, only: [ :index, :increment_likes, :show, :create , :remove]

 

private

    def find_by
      Bird.find_by(id: params[:id])
    end

    def bird_params
        @bp =params.permit(:name, :species, :likes)
     end
end



