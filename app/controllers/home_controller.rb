class HomeController < ApplicationController

  helper_method :sort_column, :sort_direction
  
  def index
    @home_active = "active"
    @projects = Project.all
  end

  def page
    begin
      case params[:name]
      when "team"
        @teams = Team.all
      when "portfolio"
        @projects = Project.all
      when "testimonials"
        @testimonials = Testimonial.all
      when "careers"
        @careers = Career.all
      end
      render params[:name]
    rescue Exception => e
      render "404"
    end
    
  end  

  private
    def sort_column
      Product.column_names.include?(params[:sort]) ? params[:sort] : (params[:sort] ? params[:sort] : "products.id")
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end
