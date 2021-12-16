class BirdsController < ApplicationController
  skip_before_action :find_by, only: [:index, :create]
  

                            # GET /birds
                            def index
                              birds = Bird.all
                              render json: birds
                            end

    # POST /birds
    def create
       bird = Bird.create(bird_params)
       render json: bird, status: :created
    end

                        # GET /birds/:id
                        def show

                          if find_by
                              render json: find_by
                          else
                            render json: { error: "Bird not found" }, status: :not_found
                          end
                        end

  # PATCH /birds/:id
  
    def update

      if find_by
          find_by.update(bird_params)
          render json: find_by
      else
        render json: { error: "Bird not found" }, status: :not_found
      end

    end
                          # PATCH /birds/:id/like
                          def increment_likes
                          
                            if find_by
                                find_by.update(likes: bird.likes + 1)
                                render json: bird
                            else
                              render json: { error: "Bird not found" }, status: :not_found
                            end
                            
                          end

    def destroy
          bye_bird = find_by.delete
          render json: bye_bird , status: :no_content
    end

end
