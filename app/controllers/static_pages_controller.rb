class StaticPagesController < ApplicationController

  def index    
    @static_page = StaticPage.find_by_label(params[:label])
  end
  
end
