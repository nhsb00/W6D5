class CatsController < ApplicationController
    def index 
        @cats = Cat.all
        render :index 
    end

    def show
         @cats = Cat.find(params[:id])
         render :show
    end

    def new 
        @cats = Cats.new
        render :new
    end

    def create
        cat = Cat.new(post_params)
        if cat.save
            redirect_to cat_url(cat)
        else
            render json: cat.errors.full_messages, status: 422
        end
    end

    private 
    def post_params
        params.require(:post).permit(:body, :author_id)
    end

end