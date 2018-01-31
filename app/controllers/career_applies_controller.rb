class CareerAppliesController < ApplicationController
  def new
  	@career = Career.find_by_id params[:career_id]
    @career_apply = CareerApply.new
  end

  def create
  	@career = Career.find_by_id params[:career_id]
    @career_apply = CareerApply.new(career_apply_params)
    if @career_apply.save
      flash[:notice] = I18n.t('career_apply.applied_successfully')
      redirect_to careers_path
    else
      @career = Career.find_by_id params[:career_apply][:career_id]
      render action: 'new'
    end
  end  

  private

  def career_apply_params
    params.require(:career_apply).permit!
  end

end
