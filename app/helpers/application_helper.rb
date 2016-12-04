module ApplicationHelper
	def my_name
		'Niv'
	end

	def form_group_tag(errors, &block)
		if errors.any?
			content_tag :div, capture(&block), class: 'form-group has-error'
		else
			content_tag :div, capture(&block), class: 'form-group'
		end
	end

	def markdown(text)
		renderer = Redcarpet::Render::HTML.new
		extensions = {fenced_code_blocks: true}
		redcarpet = Redcarpet::Markdown.new(renderer, extensions)
		(redcarpet.render text).html_safe
	end

	def vote_link_classes(post, direction)
		returned_class = "glyphicon glyphicon-chevron-#{direction}"
		if current_user.voted(post)
			if current_user.voted(post).up_vote? && direction == 'up' ||
			current_user.voted(post).down_vote? && direction == 'down'
				returned_class += " voted"
			end
		end
		returned_class
	end
end
