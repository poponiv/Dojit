class FavoritesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)
		authorize favorite
		if favorite.save
			flash[:notice] = "The post was added to favorites."
			redirect_to [@post.topic,  @post]
		else
			flash[:error] = "Couldn't add post to favorites. Try again."
			redirect_to [@post.topic,  @post]
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.find_by(post_id: @post.id)
		authorize favorite
		if favorite.destroy
			flash[:notice] = "The post was removed from favorites."
			redirect_to [@post.topic,  @post]
		else
			flash[:error] = "Couldn't remove post from favorites. Try again."
			redirect_to [@post.topic,  @post]
		end
	end
end
