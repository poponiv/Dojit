class FavoriteMailer < ApplicationMailer
	default from: "niv@simplee.com"
	def new_comment(user, post, comment)
	    # New Headers
	    headers["Message-ID"] = "<comments/#{comment.id}@niv-dojit.com>"
	    headers["In-Reply-To"] = "<post/#{post.id}@yniv-dojit.com>"
	    headers["References"] = "<post/#{post.id}@niv-dojit.com>"

	    @user = user
	    @post = post
	    @comment = comment

	    mail(to: user.email, subject: "New comment on #{post.title}")
	end
end
