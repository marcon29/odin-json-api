class KittensController < ApplicationController
    # before_action :require_login, only: [:index, :show, :edit, :update, :destroy]    # use this for user model
    # before_action :require_login     # use this for regular models, restrict to certain action if necessary
    before_action :find_kitten, only: [:show, :edit, :update, :destroy]
    # before_action :set_user

    def index
      @kittens = Kitten.all

      respond_to do |format|
        format.html
        format.json {render json: @kittens}
      end
    end
  
    def show
      respond_to do |format|
        format.html
        format.json {render json: @kitten}
      end
    end
  
    def new
      @kitten = Kitten.new
    end
  
    def create
      @kitten = Kitten.new(kitten_params)
      if @kitten.save
        redirect_to kittens_path
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      @kitten.assign_attributes(kitten_params)
      if @kitten.save
        redirect_to kittens_path
      else
        render :edit
      end
    end
  
    def destroy
      @kitten.destroy
      redirect_to kittens_path
    end
  
  
    private
    def kitten_params
      params.require(:kitten).permit(:id, :name, :age, :cuteness, :softness)
    end

    def find_kitten
      @kitten = Kitten.find(params[:id])
    end

    # def set_user
    #   @user = current_user
    # end
  
end
