module ApplicationHelper

  def full_title
	base_title = "School Pocket"
	"#{base_title} | #{ controller_path.capitalize}"
  end


end