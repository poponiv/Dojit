require 'rails_helper'
describe Vote do
  describe "validations" do
    describe "value validation" do
      before do
        post = associated_post
      	@v1 = Vote.new(value: 1, post_id: post.id, user_id: post.user_id)
		    @v2 = Vote.new(value: -1, post_id: post.id, user_id: post.user_id)
		    @v3 = Vote.new(value: 2, post_id: post.id, user_id: post.user_id)
      end
      it "only allows -1 or 1 as values" do
        expect(@v1.valid?).to eq true
        expect(@v2.valid?).to eq true
        expect(@v3.valid?).to eq false
      end
    end
  end

  describe 'after_save' do
    it "calls `Post#update_rank` after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post, user: post.user)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end

  include TestFactories
  
end
