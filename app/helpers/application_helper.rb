module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), :class => "ascArrow", :remote => true
  end	

  def avatar_image_url url
  	url = url.gsub("https://", "")
  	"https://images.weserv.nl/?url=#{url}"
  end
end
