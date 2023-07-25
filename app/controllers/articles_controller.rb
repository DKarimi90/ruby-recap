class ArticlesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
before_action :authorize 
# skip_before_action :authorize, only: [:index]

    def index 
        render json: Article.all.order(created_at: :desc)
    end

    def show 
        article = find_article
        render json: article 
     
    end

    # Alternative One

    # def create 
    #     begin
    #       article = Article.create!(article_params)
    #       render json: article, status: :created
    #     rescue ActiveRecord::RecordInvalid => invalid
    #     #   logger.error(invalid.record.errors.full_messages)
    #       render json: { errors: invalid.record.errors.full_messages }
    #     end
    #   end

    #Alternative Two
    def create 
        article = Article.create!(article_params)
        render json: article
    end
      

    def update 
        article = Article.find(params[:id])
            article.update!(article_params)
            render json: article
      
    end

    def destroy 
        article = find_article
        article.delete 
        head :no_content 
    end

    private 
    def article_params
        params.permit(:title, :body, :category, :user_id)
    end

    def find_article 
        Article.find(params[:id])
    end

    def render_not_found_response 
        render json: {error: "Not Found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def authorize 
        return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
    end
end
