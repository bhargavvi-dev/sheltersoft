class InquiriesController < ApplicationController

  def create  	
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash[:notice] = I18n.t('contact.success_alert')
    else  
      flash[:notice] = I18n.t('contact.error_alert')
    end
    render layout: false
  end

  private

  def inquiry_params
    params.require(:inquiry).permit!
  end

end
