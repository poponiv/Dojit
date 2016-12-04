require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do
  	before do
      @user1 = authenticated_user
      @user2 = authenticated_user
      @post = associated_post
      @favorite = @user1.favorites.create(post: @post)
      @favorite.save
    end
    it "returns `nil` if the user has not favorited the post" do
    	expect( @user2.favorited(@post)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
    	expect(@user1.favorited(@post)).to eq @favorite
    end
  end
end