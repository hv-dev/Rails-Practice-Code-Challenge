class PostsController < ApplicationController

    before_action :set_post, except: [:index, :new, :create]
    before_action :require_signin, except: [:index, :show]

    def index
        @posts = Post.send(posts_filter)
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.blogger_id = 

    end

    private

    def posts_filter
        if params[:filter].in? %w(all popular)
            param[:filter]
        else
            :recent
        end
    end

    def post_params
        params.requrie(:post).
            permit(:title, :content, :likes)
    end
end