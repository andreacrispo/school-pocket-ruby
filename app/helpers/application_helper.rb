module ApplicationHelper

	def title
	  base_title = "School Pocket"
	  if base_title
	  	base_title
	  else
	  	"#{page_title} | #{base_title}"
	  end
	end
end
